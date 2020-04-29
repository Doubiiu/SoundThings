//
//  ColorPicker.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/11/13.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI

struct ColorPicker: View {
    @Binding var color: Color
    @Binding var pickerShown: Bool
    
    private let colors = ColorsProvider.supportedColors()
    
    var body: some View {
        List(colors) { colorInfo in
            ColorEntry(colorInfo: colorInfo).onTapGesture {
                self.color = colorInfo.color
                self.pickerShown = false
            }
        }
    }
}
