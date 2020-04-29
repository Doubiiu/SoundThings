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

struct NodePlot: UIViewRepresentable {

    @EnvironmentObject var plotobject: PlotObject



    func makeUIView(context: Context) -> AKNodeOutputPlot {

        
        let plot = plotobject.Nodeplot!
        return plot
    }

    func updateUIView(_ PlotView: AKNodeOutputPlot, context: Context) {

    }
}
