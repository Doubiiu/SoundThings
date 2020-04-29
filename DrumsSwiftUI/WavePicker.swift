//
//  WavePicker.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/10.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI

struct WavePicker: View {
    @Binding var pickerShown: Bool
    @EnvironmentObject var sound: Sound
    private let waves = WavesProvider.supportedWaves()
    
    var body: some View {
        List(waves) { waveInfo in
            WaveEntry(waveInfo: waveInfo).onTapGesture {
                self.sound.changeOscillator(index: waveInfo.id-1)
                self.pickerShown = false
            }
        }
    }
}
