//
//  SoundEffect.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/10.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI

struct SynView: View {

    @State private var currentDrawing: Drawing = Drawing()
    @State private var drawings: [Drawing] = [Drawing]()
    @State private var color: Color = Color.black
    @State private var lineWidth: Double = 3.0
    
    var body: some View {
        VStack(alignment: .center) {
            DrawingPad(currentDrawing: $currentDrawing,
                       drawings: $drawings,
                       color: $color,
                       lineWidth: $lineWidth)
            DrawingControls(color: $color, drawings: $drawings, lineWidth: $lineWidth)
        }
    }
}

struct SynView_Previews: PreviewProvider {
    static var previews: some View {
        SynView()
    }
}
