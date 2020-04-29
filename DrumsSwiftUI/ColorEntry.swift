//
//  ColorEntry.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/11/13.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI

struct ColorEntry: View {
    let colorInfo: ColorInfo
    
    var body: some View {
        HStack {
            Circle()
                .fill(colorInfo.color)
                .frame(width: 40, height: 40)
                .padding(.all)
            Text(colorInfo.displayName)
        }
    }
}
