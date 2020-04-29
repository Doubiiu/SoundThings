//
//  SoundEffect.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/10.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI


struct DrumsView: View {
    @EnvironmentObject var conductor: Conductor

    var body: some View {
        VStack(spacing: 2) {

          PadsView { (pad) in
            self.conductor.playPad(padNumber: pad)
          }
          Spacer().fixedSize().frame(minWidth: 0, maxWidth: .infinity,
                                     minHeight: 0, maxHeight: 5, alignment: .topLeading)
        }
        .onAppear {
            self.conductor.set()
        }
    }
}


