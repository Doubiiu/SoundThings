//
//  File.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/11/23.
//  Copyright © 2019 AudioKit. All rights reserved.
//
import AudioKit
import AudioKitUI
import SwiftUI
import UIKit

struct PlotView: UIViewRepresentable {
    //@Binding var microphone: AKMicrophone?
    @EnvironmentObject var plotobject: PlotObject



    func makeUIView(context: Context) -> AKOutputWaveformPlot {

        
        let plot = plotobject.plot!
        return plot
    }

    func updateUIView(_ PlotView: AKOutputWaveformPlot, context: Context) {

    }
}
