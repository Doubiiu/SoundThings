//
//  DataModel.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/11/23.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import AudioKit
import AudioKitUI

final class Polyphony: ObservableObject, AKKeyboardDelegate{

    @Published var keyboard : AKKeyboardView?
    var bank : AKOscillatorBank?
    @Published var adsrView : AKADSRView?
    @Published var PITCHBEND : Double = 0.0{
        didSet{setParameters()}
    }
    @Published var VIBRATODEPTH : Double = 0.0{
        didSet{setParameters()}
    }
    @Published var VIBRATORATE : Double = 0.0{
        didSet{setParameters()}
    }
    @Published var MODE : Bool = true{
        didSet{setParameters()}
    }
    
    
    init(){

        do {
            try AudioKit.stop()
        } catch {
            AKLog("AudioKit stop error")
        }
        keyboard = AKKeyboardView(width: 440, height: 100)
        keyboard!.delegate = self
        keyboard!.polyphonicMode = true
        bank = AKOscillatorBank(waveform: AKTable(.sine),
                                attackDuration: 0.1,
                                releaseDuration: 0.1)
        
        adsrView = AKADSRView { att, dec, sus, rel in
            self.bank!.attackDuration = att
            self.bank!.decayDuration = dec
            self.bank!.sustainLevel = sus
            self.bank!.releaseDuration = rel
        }
        adsrView!.attackDuration = bank!.attackDuration
        adsrView!.decayDuration = bank!.decayDuration
        adsrView!.releaseDuration = bank!.releaseDuration
        adsrView!.sustainLevel = bank!.sustainLevel

        
        AudioKit.output = bank
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

        AudioKit.output = bank
        do{
            try AudioKit.start()
        }
        catch{
            assert(false, "Failed to start audiokit")
        }
    }
    func noteOn(note: MIDINoteNumber) {
        bank!.play(noteNumber: note, velocity: 80)
    }
      
    func noteOff(note: MIDINoteNumber) {
        bank!.stop(noteNumber: note)
    }
    func setParameters(){
        bank!.pitchBend = PITCHBEND
        bank!.vibratoDepth = VIBRATODEPTH
        bank!.vibratoRate = VIBRATORATE
        self.keyboard!.polyphonicMode = MODE
    }

    

}
