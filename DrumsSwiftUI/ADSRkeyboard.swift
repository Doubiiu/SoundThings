//
//  ADSRkeyboard.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/7.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import AudioKit
import AudioKitUI
import SwiftUI
import UIKit

struct ADSRkeyboard: UIViewRepresentable {
    //@Binding var microphone: AKMicrophone?
    @EnvironmentObject var polyphony: Polyphony



    func makeUIView(context: Context) -> AKADSRView {

        
        let plot = polyphony.adsrView!
        
        return plot
    }

    func updateUIView(_ PlotView: AKADSRView, context: Context) {

    }
}
