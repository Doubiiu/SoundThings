//
//  SoundEffect.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/10.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import AudioKit
import AudioKitUI

final class SoundEffect: ObservableObject{
    var gameTimer: Timer?
    var file:AKAudioFile?
    var player:AKAudioPlayer?
    var wah:AKAutoWah?
    @Published var wahValue = 0.0{
        didSet{setWah()}
    }
    @Published var fileIndex = 0{
        didSet{pickSound()}
    }
    let pre = "Files/"
    let files = ["mixloop.wav", "drumloop.wav", "poney.mp3", "Lo-Fi Synth.mp3", "80s Synth.mp3"]
    
    @Published var plot : AKOutputWaveformPlot?
    @Published var gainValues: [Double] = [1.0, 1.0, 1.0, 1.0, 1.0, 1.0]{
        didSet{setGains()}
    }
    var filterBand2 : AKEqualizerFilter?
    var filterBand3 : AKEqualizerFilter?
    var filterBand4 : AKEqualizerFilter?
    var filterBand5 : AKEqualizerFilter?
    var filterBand6 : AKEqualizerFilter?
    var filterBand7 : AKEqualizerFilter?
    
    @Published var tracker : AKFrequencyTracker?
    @Published var trackerF : Double = 0
    @Published var trackerA : Double = 0
    
    init(){
        do{
            file = try AKAudioFile(readFileName: pre+files[fileIndex])
        }
        catch{
            AKLog("AudioKit file error")
        }
        do{
            player = try AKAudioPlayer(file: file!)
        }
        catch{
            AKLog("AudioKit player error")
        }
        tracker = AKFrequencyTracker(player)
        gameTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateTracker), userInfo: nil, repeats: true)
        player!.looping = true
        wah = AKAutoWah(tracker)
        wah!.amplitude = 1
        
        do {
            try AudioKit.stop()
        } catch {
            AKLog("AudioKit stop error")
        }
        
        filterBand2 = AKEqualizerFilter(wah, centerFrequency: 32, bandwidth: 44.7, gain: gainValues[0])
        filterBand3 = AKEqualizerFilter(filterBand2, centerFrequency: 64, bandwidth: 70.8, gain: gainValues[1])
        filterBand4 = AKEqualizerFilter(filterBand3, centerFrequency: 125, bandwidth: 141, gain: gainValues[2])
        filterBand5 = AKEqualizerFilter(filterBand4, centerFrequency: 250, bandwidth: 282, gain: gainValues[3])
        filterBand6 = AKEqualizerFilter(filterBand5, centerFrequency: 500, bandwidth: 562, gain: gainValues[4])
        filterBand7 = AKEqualizerFilter(filterBand6, centerFrequency: 1_000, bandwidth: 1_112, gain: gainValues[5])

        AudioKit.output = filterBand7

        do{
            try AudioKit.start()
        }
        catch{
            assert(false, "Failed to start audiokit")
        }
        plot = AKOutputWaveformPlot()

    }
    
    func set(){
        do {
            try AudioKit.stop()
        } catch {
            AKLog("AudioKit stop error")
        }

        filterBand2 = AKEqualizerFilter(wah, centerFrequency: 32, bandwidth: 44.7, gain: gainValues[0])
        filterBand3 = AKEqualizerFilter(filterBand2, centerFrequency: 64, bandwidth: 70.8, gain: gainValues[1])
        filterBand4 = AKEqualizerFilter(filterBand3, centerFrequency: 125, bandwidth: 141, gain: gainValues[2])
        filterBand5 = AKEqualizerFilter(filterBand4, centerFrequency: 250, bandwidth: 282, gain: gainValues[3])
        filterBand6 = AKEqualizerFilter(filterBand5, centerFrequency: 500, bandwidth: 562, gain: gainValues[4])
        filterBand7 = AKEqualizerFilter(filterBand6, centerFrequency: 1_000, bandwidth: 1_112, gain: gainValues[5])

        AudioKit.output = filterBand7
        do{
            try AudioKit.start()
        }
        catch{
            assert(false, "Failed to start audiokit")
        }
        
    }
    func startWah(){
        player!.play()
    }
    func stopWah(){
        player!.stop()
    }
    func setWah(){
        wah!.wah = wahValue
    }
    func pickSound(){
        do{
            file = try AKAudioFile(readFileName: pre+files[fileIndex])
        }
        catch{
            AKLog("AudioKit file error")
        }
        do{
            player = try AKAudioPlayer(file: file!)
        }
        catch{
            AKLog("AudioKit player error")
        }
        tracker = AKFrequencyTracker(player)
        player!.looping = true
        wah = AKAutoWah(tracker)
        wah!.amplitude = 1
        
        set()
        plot = AKOutputWaveformPlot()
    }
    func setGains(){
        do {
            try AudioKit.stop()
        } catch {
            AKLog("AudioKit stop error")
        }

        filterBand2 = AKEqualizerFilter(wah, centerFrequency: 32, bandwidth: 44.7, gain: gainValues[0])
        filterBand3 = AKEqualizerFilter(filterBand2, centerFrequency: 64, bandwidth: 70.8, gain: gainValues[1])
        filterBand4 = AKEqualizerFilter(filterBand3, centerFrequency: 125, bandwidth: 141, gain: gainValues[2])
        filterBand5 = AKEqualizerFilter(filterBand4, centerFrequency: 250, bandwidth: 282, gain: gainValues[3])
        filterBand6 = AKEqualizerFilter(filterBand5, centerFrequency: 500, bandwidth: 562, gain: gainValues[4])
        filterBand7 = AKEqualizerFilter(filterBand6, centerFrequency: 1_000, bandwidth: 1_112, gain: gainValues[5])

        AudioKit.output = filterBand7
        do{
            try AudioKit.start()
        }
        catch{
            assert(false, "Failed to start audiokit")
        }
        
    }
    @objc func updateTracker(){
        trackerA = tracker!.amplitude
        trackerF = tracker!.frequency
    }
}
