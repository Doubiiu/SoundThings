//
//  KeyboardView.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/6.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import AudioKit
import AudioKitUI
import SwiftUI
import UIKit

struct KeyboardView: UIViewRepresentable {
    //@Binding var microphone: AKMicrophone?
    @EnvironmentObject var polyphony: Polyphony



    func makeUIView(context: Context) -> AKKeyboardView {

        
        let plot = polyphony.keyboard!
        
        return plot
    }

    func updateUIView(_ PlotView: AKKeyboardView, context: Context) {

    }
}
