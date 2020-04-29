//
//  TestKeyboard.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/6.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI

struct TestKeyboard: View {
    @EnvironmentObject var polyphony:Polyphony
    var body: some View {
        VStack{
            HStack{
                ADSRkeyboard()

                VStack{
                    HStack{

                        VStack(alignment: .leading, spacing: 10){
                            Text("Pitch Bend: \(polyphony.PITCHBEND)")
                                .padding()
                            Text("Vibrato Depth: \(polyphony.VIBRATODEPTH)")
                                .padding()
                            Text("Vibrato Rate: \(polyphony.VIBRATORATE)")
                                .padding()

                        }
                        VStack(spacing: 10){
                            Slider(value:$polyphony.PITCHBEND,in: -12.0...12.0, step: 1)
                                .padding()
                            Slider(value: $polyphony.VIBRATODEPTH, in: 0.0...2.0, step: 0.1)
                                .padding()
                            Slider(value: $polyphony.VIBRATORATE, in: 0.0...10.0, step: 1)
                                .padding()

                        }
                    }
                    Button(action: {
                        self.polyphony.MODE = !self.polyphony.MODE
                    }){
                        Text(self.polyphony.MODE ? "Polyphonic Mode" : "Monophonic Mode")
                            .fontWeight(.bold)
                            .font(.caption)
                            .padding()
                            .background(Color.purple)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .padding(2)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.purple, lineWidth: 2)
                            )
                    }

                }
                
            }
            
            KeyboardView()
//                .frame(width: SCREENWIDTH-40, height: SCREENHEIGHT/2, alignment: .center)
        }
        .onAppear(){
            self.polyphony.set()
        }

    }
}

struct TestKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        TestKeyboard()
    }
}
