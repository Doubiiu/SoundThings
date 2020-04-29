//
//  SoundEffect.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/10.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import AudioKit
import Combine
import AudioKitUI

class Noise: ObservableObject {
    @Published var brownian = AKBrownianNoise(amplitude: 0.0)
    @Published var pink = AKPinkNoise(amplitude: 0.0)
    @Published var white = AKWhiteNoise(amplitude: 0.0)
    @Published var plot:AKOutputWaveformPlot?
    var noiseall:AKMixer?
    func set(){
        do {
            try AudioKit.stop()
        } catch {
            AKLog("AudioKit did not start!")
        }

        AudioKit.output = noiseall
        do {
            try AudioKit.start()
        } catch {
            AKLog("AudioKit did not start!")
        }
        brownian.start()
        pink.start()
        white.start()
    }
    func unset(){

        brownian.stop()
        pink.stop()
        white.stop()
    }
    init() {
        noiseall = AKMixer(brownian, pink, white)
        do {
            try AudioKit.stop()
        } catch {
            AKLog("AudioKit did not start!")
        }

        AudioKit.output = noiseall
        do {
            try AudioKit.start()
        } catch {
            AKLog("AudioKit did not start!")
        }
        plot = AKOutputWaveformPlot()
        
        brownian.start()
        pink.start()
        white.start()
        
    }
}
