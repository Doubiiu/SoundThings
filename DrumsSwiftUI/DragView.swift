//
//  DragView.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/11.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI


struct DragView: View {
    @State private var currentPosition: CGSize = .zero
    @Binding var newPosition: [Positions]
    var index:Int
    var body: some View {

        Rectangle()
            .foregroundColor(.green)
            .cornerRadius(10)

            .offset(x: self.currentPosition.width, y: self.currentPosition.height)
            .frame(width: 100, height: 50, alignment: .center)
            .overlay(Text("\(Int(1400-self.newPosition[index].pos.height))"))
            .gesture(DragGesture()
                .onChanged { value in
                    self.currentPosition = CGSize(width: 0, height: value.translation.height + self.newPosition[self.index].pos.height/7-100)
                }
                .onEnded { value in
                    if (value.translation.height + self.newPosition[self.index].pos.height/7-100) > 100{
                        self.currentPosition = CGSize(width: 0, height: 100)
                    }
                    else if (value.translation.height + self.newPosition[self.index].pos.height/7-100) < -100{
                        self.currentPosition = CGSize(width: 0, height: -100)
                    }
                    else{
                        self.currentPosition = CGSize(width: 0, height: value.translation.height + self.newPosition[self.index].pos.height/7-100)
                    }
                    
                    self.newPosition[self.index].pos.width = 0
                    self.newPosition[self.index].pos.height = (self.currentPosition.height+100)*7

                }
            )
    }
}

