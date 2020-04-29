//
//  PadsView.swift
//  DrumsSwiftUI
//
//  Created by 邢金波 on 2019/11/2.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI

struct PadsView: View {
    var padsAction: (_ padNumber: Int) -> Void

    var body: some View {
        VStack(spacing: 2) {
            ForEach((0...2).reversed(), id: \.self) { row in
                HStack(spacing: 2) {
                  ForEach((0..<3), id: \.self) { column in
                      Button(action: {
                          self.padsAction(getPadId(row: row, column: column))
                          print(getPadId(row: row, column: column))
                      }) {
                          ZStack {
                              Rectangle()
                                .fill(Color("PadColor"))
                                .aspectRatio(contentMode: .fit)
                              Text(String(getPadId(row: row, column: column))).foregroundColor(Color("FontColor"))
                          }
                      }
                  }
                }
            }
        }
    }
}

private func getPadId(row: Int, column: Int) -> Int {
    return (row * 3) + column
}
