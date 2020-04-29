//
//  Additive.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/7.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import AudioKit
import AudioKitUI

final class Additive: ObservableObject{
    static let shared = Additive()
    @Published var envelope : AKAmplitudeEnvelope?
    @Published var mixer : AKMixer?
    @Published var oscillators: [AKOscillator]?
    @Published var AMPs:[Double] = [0.0, 0.0, 0.0, 0.0, 0.0,
                                    0.0, 0.0, 0.0, 0.0, 0.0]{
        didSet{setAMPs()}
    }
    @Published var fHz:Double = 261.63
    @Published var frequencies:[Double] = (1...10).map { $0 * 261.63 }
    @Published var plot:AKNodeFFTPlot?
    init(){

        do {
            try AudioKit.stop()
        } catch {
            AKLog("AudioKit stop error")
        }
        
        frequencies = (1...10).map { $0 * fHz }
        oscillators = frequencies.map {
          createOscillator(frequency: $0)
        }
        mixer = AKMixer()
        oscillators!.forEach { mixer!.connect(input:$0) }
        envelope = AKAmplitudeEnvelope(mixer)
        envelope!.attackDuration = 0.01
        envelope!.decayDuration = 0.1
        envelope!.sustainLevel = 0.1
        envelope!.releaseDuration = 0.3

        AudioKit.output = envelope
        do{
            try AudioKit.start()
        }
        catch{
            assert(false, "Failed to start audiokit")
        }
        plot = AKNodeFFTPlot(envelope, frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        plot!.shouldFill = true
        plot!.shouldMirror = false
        plot!.shouldCenterYAxis = false
        plot!.color = AKColor.purple
        plot!.gain = 100

    }
    
    func set(){
        do {
            try AudioKit.stop()
        } catch {
            AKLog("AudioKit stop error")
        }

        AudioKit.output = envelope
        do{
            try AudioKit.start()
        }
        catch{
            assert(false, "Failed to start audiokit")
        }
    }
    func createOscillator(frequency: Double) -> AKOscillator {
      let oscillator = AKOscillator()
      oscillator.frequency = frequency
      return oscillator
    }
    func start(){
        envelope!.start()
        mixer!.start()
        oscillators!.forEach{$0.start()}
    }
    func stop(){
        envelope!.stop()
        mixer!.stop()
        oscillators!.forEach{$0.stop()}
    }
    func setAMPs(){
        for index in 0...9 {
            oscillators![index].amplitude = AMPs[index]
        }
    }
    func setfHz(f: Double){
        fHz = f
        frequencies = (1...10).map { $0 * fHz }
        oscillators = frequencies.map {
          createOscillator(frequency: $0)
        }
        mixer = AKMixer()
        oscillators!.forEach { mixer!.connect(input:$0) }
        envelope = AKAmplitudeEnvelope(mixer)
        envelope!.attackDuration = 0.01
        envelope!.decayDuration = 0.1
        envelope!.sustainLevel = 0.1
        envelope!.releaseDuration = 0.3
        
        set()
        plot = AKNodeFFTPlot(envelope, frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    }
}
