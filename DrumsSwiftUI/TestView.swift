//
//  SwiftUIView.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/11/23.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var plotobject: PlotObject
    
    var body: some View {
        VStack(spacing: 10){
            HStack{
                Text("Sampling")
                    .padding()
                Spacer()
                Text("Delay")
                    .padding()
            }
            
            HStack{
                HStack{
                    VStack(alignment: .leading, spacing: 10){
                        Text("Bit Depth: \(Int(plotobject.BD))")
                            .padding()
                        Text("Sampling Rate: \(Int(plotobject.SR))")
                            .padding()

                    }
                    VStack(spacing: 10){
                        Slider(value:$plotobject.BD,in: 0.0...32.0, step: 4)
                            .padding()
                        Slider(value: $plotobject.SR, in: 0.0...44100.0, step: 100)
                            .padding()

                    }
                }
                HStack{

                    VStack(alignment: .leading, spacing: 10){
                        Text("Time: \(plotobject.TIME)")
                            .padding()
                        Text("Feedback: \(plotobject.FB)")
                            .padding()

                    }
                    VStack(spacing: 10){
                        Slider(value:$plotobject.TIME,in: 0.0...1.0, step: 0.1)
                            .padding()
                        Slider(value: $plotobject.FB, in: 0.0...1.0, step: 0.1)
                            .padding()

                    }
                }

            }
            HStack{
                Button(action: {
                    self.plotobject.start()
                }){
                    Text("Play")
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
                Button(action: {
                    self.plotobject.stop()
                }){
                    Text("Stop")
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

            
            PlotView()
//                .frame(width: SCREENWIDTH, height: SCREENHEIGHT/3, alignment: .center)
            NodePlot()
//                .frame(width: SCREENWIDTH/2, height: SCREENHEIGHT/2, alignment: .center)

        }
        .onAppear(){
            self.plotobject.set()
        }
//        .onDisappear(){
//            self.plotobject.stop()
//        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
