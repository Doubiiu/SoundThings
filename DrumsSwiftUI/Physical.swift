//
//  Physical.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/9.
//  Copyright © 2019 AudioKit. All rights reserved.
//
import AudioKit
import AudioKitUI

final class Physical: ObservableObject{
    
    var drip:AKDrip?
    var reverb:AKReverb?
    var drips:AKPeriodicFunction?
    let playRate = 2.0
    
    var flute:AKFlute?
    let scale = [0, 2, 4, 5, 7, 9, 11, 12]
    var performance:AKPeriodicFunction?
    
    var voc:AKVocalTract?
    var frequencySlider: AKSlider!
    var tonguePositionSlider: AKSlider!
    var tongueDiameterSlider: AKSlider!
    var tensenessSlider: AKSlider!
    var nasalitySlider: AKSlider!
    
    @Published var playingDrip = true
    @Published var playingFlute = true
    @Published var playingVocal = true
    @Published var playingBell = true
    
    init(){
        
        //Drip
        drip = AKDrip(intensity: 1)
        drip!.intensity = 100
        reverb = AKReverb(drip)
        drips = AKPeriodicFunction(frequency: playRate) {
            self.drip!.trigger()
        }

    }
    
    
    func playDrip(){
        drip = AKDrip(intensity: 1)
        drip!.intensity = 100
        reverb = AKReverb(drip)
        drips = AKPeriodicFunction(frequency: playRate) {
            self.drip!.trigger()
        }

        do {
            try AudioKit.stop()
        } catch {
            AKLog("AudioKit stop error")
        }
        
        AudioKit.output = AKBooster(reverb, gain: 0.4)
        do{
            try AudioKit.start(withPeriodicFunctions: drips!)
        }
        catch{
            assert(false, "Failed to start audiokit")
        }
        drips!.start()
        playingDrip = true
        playingFlute = false
        playingVocal = false
        playingBell = false
    }
    func stopDrip(){
        drips!.stop()
        playingDrip = false
    }
    func playFlute(){
        flute = AKFlute()
        reverb = AKReverb(flute)
        performance = AKPeriodicFunction(frequency: playRate) {
            var note = self.scale.randomElement()!
            let octave = (2..<6).randomElement()! * 12
            if random(in: 0...10) < 1.0 { note += 1 }
            if !self.scale.contains(note % 12) { AKLog("ACCIDENT!") }

            let frequency = (note + octave).midiNoteToFrequency()
            if random(in: 0...6) > 1.0 {
                self.flute!.trigger(frequency: frequency, amplitude: 0.1)
            } else {
                self.flute!.stop()
            }
        }
        do {
            try AudioKit.stop()
        } catch {
            AKLog("AudioKit stop error")
        }
        AudioKit.output = reverb
        do{
            try AudioKit.start(withPeriodicFunctions: performance!)
        }
        catch{
            assert(false, "Failed to start audiokit")
        }
        performance!.start()
        playingDrip = false
        playingFlute = true
        playingVocal = false
        playingBell = false
    }
    func stopFlute(){
        performance!.stop()
        playingFlute = false
    }
    
    func playVocal(){


        voc = AKVocalTract()
        frequencySlider = AKSlider(property: "Frequency",
                                   value: voc!.frequency,
                                   range: 0 ... 2_000
        ) { sliderValue in
            self.voc!.frequency = sliderValue
        }


        tonguePositionSlider = AKSlider(property: "Tongue Position", value: voc!.tonguePosition) { sliderValue in
            self.voc!.tonguePosition = sliderValue
        }
 

        tongueDiameterSlider = AKSlider(property: "Tongue Diameter", value: voc!.tongueDiameter) { sliderValue in
            self.voc!.tongueDiameter = sliderValue
        }


        tensenessSlider = AKSlider(property: "Tenseness", value: voc!.tenseness) { sliderValue in
            self.voc!.tenseness = sliderValue
        }


        nasalitySlider = AKSlider(property: "Nasality", value: voc!.nasality) { sliderValue in
            self.voc!.nasality = sliderValue
        }
        voc!.frequency = self.frequencySlider.randomize()
        voc!.tonguePosition = self.tonguePositionSlider.randomize()
        voc!.tongueDiameter = self.tongueDiameterSlider.randomize()
        voc!.tenseness = self.tensenessSlider.randomize()
        voc!.nasality = self.nasalitySlider.randomize()
        do {
            try AudioKit.stop()
        } catch {
            AKLog("AudioKit stop error")
        }
        AudioKit.output = voc
        do{
            try AudioKit.start()
        }
        catch{
            assert(false, "Failed to start audiokit")
        }
        voc!.start()
        playingDrip = false
        playingFlute = false
        playingVocal = true
        playingBell = false
    }
    func stopVocal(){
        voc!.stop()
        playingVocal = false
    }
    
    func playBell(){
        let tubularBells = AKTubularBells()

        var delay = AKDelay(tubularBells)
        delay.time = 1.5 / playRate
        delay.dryWetMix = 0.3
        delay.feedback = 0.2

        reverb = AKReverb(delay)


        performance = AKPeriodicFunction(frequency: playRate) {
            var note = self.scale.randomElement()!
            let octave = [2, 3, 4, 5].randomElement()! * 12
            if random(in: 0...10) < 1.0 { note += 1 }
            if !self.scale.contains(note % 12) { AKLog("ACCIDENT!") }

            let frequency = (note + octave).midiNoteToFrequency()
            if random(in: 0...6) > 1.0 {
                tubularBells.trigger(frequency: frequency)
            }
        }
        do {
            try AudioKit.stop()
        } catch {
            AKLog("AudioKit stop error")
        }
        AudioKit.output = reverb
        do{
            try AudioKit.start(withPeriodicFunctions: performance!)
        }
        catch{
            assert(false, "Failed to start audiokit")
        }
        performance!.start()
        playingDrip = false
        playingFlute = false
        playingVocal = false
        playingBell = true
    }
    func stopBell(){
        performance!.stop()
        playingBell = false
    }
}

/*
Drawbar Organ
Dripping Sounds
Drum Synthesizers
Flute
Mandolin
Plucked String
Tubular Bells
Vocal Tract
Vocal Tract Operation
*/
