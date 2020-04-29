//
//  WaveEntry.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/10.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI

struct WaveEntry: View {
    let waveInfo: WaveInfo
    
    var body: some View {
        HStack {
            Image(waveInfo.displayName).resizable()
                .frame(width: 60, height: 40)
                .padding(.all)
            Text(waveInfo.displayName)
        }
    }
}
