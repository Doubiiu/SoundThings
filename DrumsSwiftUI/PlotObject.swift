//
//  DataModel.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/11/23.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import AudioKit
import AudioKitUI

final class PlotObject: ObservableObject{

    
    @Published var plot : AKOutputWaveformPlot?
    @Published var Nodeplot : AKNodeOutputPlot?
    var file : AKAudioFile?
    var player:AKPlayer?
    var delay :AKDelay?
    var bitcrusher:AKBitCrusher?
    @Published var BD:Double = 16{
        didSet{setBDandSR()}
    }
    @Published var SR:Double = 44100{
        didSet{setBDandSR()}
    }
    @Published var TIME:Double = 0.0{
        didSet{setTIMEandFB()}
    }
    @Published var FB:Double = 0.0{
        didSet{setTIMEandFB()}
    }

    init(){
        do{
            //file = try AKAudioFile(readFileName: "Files/drumloop.wav")
            file = try AKAudioFile(readFileName: "Files/climax-disco-part2.wav")
        }
        catch{
            AKLog("AudioKit stop error")
        }
        player = AKPlayer(audioFile: file!)
        player!.isLooping = true
        player!.buffering = .always

        delay = AKDelay(player)


        delay!.dryWetMix = 0.6 // Normalized Value 0 - 1

        do {
            try AudioKit.stop()
        } catch {
            AKLog("AudioKit stop error")
        }
        bitcrusher = AKBitCrusher(delay)

        AudioKit.output = bitcrusher
        do{
            try AudioKit.start()
        }
        catch{
            assert(false, "Failed to start audiokit")
        }

        plot = AKOutputWaveformPlot()
        Nodeplot = AKNodeOutputPlot(player, frame: CGRect(x: 0, y: 0, width: 440, height: 300))
        Nodeplot!.plotType = .rolling
        Nodeplot!.shouldFill = true
        Nodeplot!.shouldMirror = true
        Nodeplot!.color = AKColor.blue
        
    }
    
    func set(){
        do {
            try AudioKit.stop()
        } catch {
            AKLog("AudioKit stop error")
        }

        AudioKit.output = bitcrusher
        do{
            try AudioKit.start()
        }
        catch{
            assert(false, "Failed to start audiokit")
        }
    }
    func setBDandSR(){
        bitcrusher!.bitDepth = BD
        bitcrusher!.sampleRate = SR
    }
    func setTIMEandFB(){
        delay!.time = TIME // seconds
        delay!.feedback = FB // Normalized Value 0 - 1
    }
    func start(){
 
        player!.play()
    }
    func stop(){

        player!.stop()
    }


    

}
