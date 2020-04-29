//
//  FFTplot.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/7.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import AudioKit
import AudioKitUI
import SwiftUI
import UIKit

struct FFTplot: UIViewRepresentable {

    @EnvironmentObject var additive: Additive
    @Binding var f:Double


    func makeUIView(context: Context) -> AKNodeFFTPlot {

        return additive.plot!
    }

    func updateUIView(_ PlotView: AKNodeFFTPlot, context: Context) {


    }
}
