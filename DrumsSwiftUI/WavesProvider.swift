//
//  WavesProvider.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/10.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI

struct WaveInfo: Identifiable {
    let id: Int
    let displayName: String
}

class WavesProvider {
    
    static func supportedWaves() -> [WaveInfo] {
        return [WaveInfo(id: 1, displayName: "Sine"),
               WaveInfo(id: 2, displayName: "Square"),
               WaveInfo(id: 3, displayName: "Triangle"),
               WaveInfo(id: 4, displayName: "Sawtooth")]
    }
    
}
