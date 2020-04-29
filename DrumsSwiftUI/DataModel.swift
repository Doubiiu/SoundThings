//
//  DataModel.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/11/23.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import AudioKit

final class DataModel: ObservableObject{
    static let shared = DataModel()
    private let oscillator = AKOscillator()
    private let oscillator2 = AKOscillator()
    private let bank = AKOscillatorBank(waveform: AKTable(.sine),
                            attackDuration: 0.1,
                            releaseDuration: 0.1)
    @Published var sound = false
    @Published var recording = false
    @Published var playing = false
    
    @Published var amplitude = 0.5 {
        didSet{setAmplitudeAndFrequency()}
    }
    @Published var frequency = 0.5 {
        didSet{setAmplitudeAndFrequency()}
    }
    
    private var timer = Timer()
    @Published var newPositions = [Positions(num: 0, pos: .zero), Positions(num: 1, pos: .zero),Positions(num: 2, pos: .zero),Positions(num: 3, pos: .zero),Positions(num:4, pos: .zero),Positions(num:5, pos: .zero), Positions(num:6, pos:.zero), Positions(num:7, pos:.zero)]{
        didSet{update()}
    }
    @Published var recordedAmplitudes = [0.0, 0.0, 0.0, 0.6, 1.0,
    1.6, 1.0, 1.0]
    @Published var recordedFrequencies = [1500.0, 1259.0, 959.0, 877.0, 938.6,
    1129.0, 936.0, 568.0]
    private let demoRecordedFrequencies = [1500.0, 1259.0, 959.0, 877.0, 938.6,
                                           1129.0, 936.0, 568.0]
    private let demoRecordedAmplitudes = [0.0, 0.0, 0.0, 0.6, 1.0,
                                          1.6, 1.0, 1.0]
    private var ampIndex = 0
    private var freqIndex = 0
    
    init(){
        do {
            try AudioKit.stop()
        } catch {
            AKLog("AudioKit stop error")
        }
        AudioKit.output = AKMixer(oscillator, oscillator2)
        do{
            try AudioKit.start()
        }
        catch{
            assert(false, "Failed to start audiokit")
        }
    }
    func set(){
        do {
            try AudioKit.stop()
        } catch {
            AKLog("AudioKit stop error")
        }
        AudioKit.output = AKMixer(oscillator, oscillator2)
        do{
            try AudioKit.start()
        }
        catch{
            assert(false, "Failed to start audiokit")
        }
    }
    func setAmplitudeAndFrequency(){
        oscillator.amplitude = amplitude
        oscillator.frequency = frequency
    }
    func record(){
        playing = false
        recording = !recording
        timer.invalidate()
        if recording {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: {_ in
                self.recordSliders()
            })
        }
    }
    func play(){
        recording = false
        playing = !playing
        timer.invalidate()
        if playing {
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: {_ in
                self.moveSliders()
            })
        }
    }
    func recordSliders(){
        recordedAmplitudes.append(amplitude)
        recordedFrequencies.append(frequency)
    }
    func moveSliders(){
        if recordedAmplitudes.count == 0 && recordedFrequencies.count == 0{
            playing = false
        }
        if playing{
            if recordedAmplitudes.count != 0{
                amplitude = recordedAmplitudes[ampIndex]
                ampIndex += 1
                if ampIndex == recordedAmplitudes.count{
                    ampIndex = 0
                }
            }
            if recordedFrequencies.count != 0{
                frequency = recordedFrequencies[freqIndex]
                freqIndex += 1
                if freqIndex == recordedFrequencies.count{
                    freqIndex = 0
                }
            }
            setAmplitudeAndFrequency()
        }
    }
    
    func delete(){
        recordedAmplitudes.removeAll()
        recordedFrequencies.removeAll()
    }
    func loadDemo(){
        recordedAmplitudes = demoRecordedAmplitudes
        recordedFrequencies = demoRecordedFrequencies
        for i in 0..<demoRecordedFrequencies.count-1{
            newPositions[i].pos.height = CGFloat(demoRecordedFrequencies[i])
        }
    }
    func toggleSound (){
        if oscillator.isPlaying{
            oscillator.stop()
        } else{
            oscillator.amplitude = amplitude
            oscillator.frequency = frequency
            oscillator.start()
        }
        sound = oscillator.isPlaying
    }
    func update(){
        for i in 0..<newPositions.count-1{
            recordedAmplitudes[i] = 1.0
            recordedFrequencies[i] = 1400-Double(newPositions[i].pos.height)
        }

    }
}
