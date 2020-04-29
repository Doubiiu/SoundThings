//
//  OutputPlot.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/10.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import AudioKit
import AudioKitUI
import SwiftUI
import UIKit

struct OutputPlot: UIViewRepresentable {

    @EnvironmentObject var noise: Noise



    func makeUIView(context: Context) -> AKOutputWaveformPlot {

        return noise.plot!
    }

    func updateUIView(_ PlotView: AKOutputWaveformPlot, context: Context) {

    }
}
