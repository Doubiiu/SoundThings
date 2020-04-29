//
//  SoundEffect.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/10.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import AudioKit
import Combine


final class Sound: ObservableObject {

    static let shared = Sound()
    var mix:AKDryWetMixer?
    @Published var oscillator:AKFMOscillator?
    var delay:AKDelay?
    var reverb:AKCostelloReverb?
    @Published var panner:AKPanner?
    @Published var panValue = 0.0 {
        didSet{setPan()}
    }
    let sine = AKTable(.sine, count: 256)
    let square = AKTable(.square, count: 256)
    let triangle = AKTable(.triangle, count: 256)
    let sawtooth = AKTable(.sawtooth, count: 256)
    var waves : [AKTable]?
    
    @Published var OCM  = 0.0{
        didSet{setFMs()}
    }
    @Published var OMM  = 0.0{
        didSet{setFMs()}
    }
    @Published var OMI  = 0.0{
        didSet{setFMs()}
    }
    init() {
        do {
            try AudioKit.stop()
        } catch {
            AKLog("AudioKit did not start!")
        }
        waves = [sine, square, triangle, sawtooth]
        oscillator = AKFMOscillator(waveform: waves![0])
        oscillator!.amplitude = 0.4
        oscillator!.rampDuration = 0.1
        delay = AKDelay(oscillator)
        delay!.feedback = 0.3
        delay!.time = 0.1
        reverb = AKCostelloReverb(delay)
        mix = AKDryWetMixer(delay, reverb, balance: 0.5)
        panner = AKPanner(mix)
        
        AudioKit.output = panner
        do {
            try AudioKit.start()
        } catch {
            AKLog("AudioKit did not start!")
        }

    }
    
    func set(){
        do {
            try AudioKit.stop()
        } catch {
            AKLog("AudioKit did not start!")
        }
        AudioKit.output = panner
        do {
            try AudioKit.start()
        } catch {
            AKLog("AudioKit did not start!")
        }
    }
    
    
    func setPan(){
        panner!.pan = panValue
    }

    func updateStero(degree: Double) {
        
        panner?.pan += degree
        if (panner!.pan>1.0){
            panner!.pan = 1.0
        }
        if (panner!.pan < -1.0){
            panner!.pan = -1.0
        }
        panValue = panner!.pan
        print(panner!.pan)

    }
    func updateOscillator(x: Double, y: Double) {
        oscillator!.baseFrequency = Double(2*y)
        //oscillator.modulationIndex = Double(y * 20)
    }
    func stopOscillator(){
        oscillator!.stop()
    }
    func startOscillator(){
        oscillator!.start()
    }
    func changeOscillator(index: Int){
        oscillator = AKFMOscillator(waveform: waves![index])
        oscillator!.amplitude = 0.4
        oscillator!.rampDuration = 0.1
        delay = AKDelay(oscillator)
        delay!.feedback = 0.3
        delay!.time = 0.1
        reverb = AKCostelloReverb(delay)
        mix = AKDryWetMixer(delay, reverb, balance: 0.5)
        panner = AKPanner(mix)

        set()
    }
    
    func setFMs(){
        oscillator!.carrierMultiplier = OCM
        oscillator!.modulatingMultiplier = OMM
        oscillator!.modulationIndex = OMI
    }
}
