//
//  DrawingControls.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/11/13.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI

struct DrawingControls: View {
    @Binding var color: Color
    @Binding var drawings: [Drawing]
    @Binding var lineWidth: Double

    @EnvironmentObject var sound: Sound
    
    enum ActiveSheet {
       case first, second, third
    }

    @State private var showSheet = false
    @State private var activeSheet: ActiveSheet = .first

    var body: some View {
        NavigationView {

            VStack (spacing: 2){
                HStack{
                    HStack {
                        Text("CM(0-20)")
                            .padding()
                        Slider(value:$sound.OCM,in: 0.0...20.0, step: 0.5)
                            .padding()
                    }
                    HStack {
                        Text("MM(0-20)")
                            .padding()
                        Slider(value: $sound.OMM, in: 0.0...20.0, step: 1.0)
                            .padding()
                    }
                    HStack {
                        Text("MI(0-100)")
                            .padding()
                        Slider(value: $sound.OMI, in: 0.0...100.0, step: 1.0)
                            .padding()
                    }
                }

                HStack{
                    HStack {
                        Text("Stereo")
                            .padding()
                        HStack(spacing: 2){
                            Text("L")
                            Slider(value:$sound.panValue,in: -1.0...1.0, step: 0.5)
                            Text("R")
                        }
                            .padding()
                    }
                    HStack {
                        Text("Pencil width")
                            .padding()
                        Slider(value: $lineWidth, in: 1.0...15.0, step: 1.0)
                            .padding()
                    }
                    Button(action: {
                        self.showSheet = true
                        self.activeSheet = .first
                    }){
                        Text("Pick Color")
                            .fontWeight(.bold)
                            .font(.caption)
                            .padding(3)
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
                        self.showSheet = true
                        self.activeSheet = .second
                    }){
                        Text("Pick Wave")
                            .fontWeight(.bold)
                            .font(.caption)
                            .padding(3)
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
                        self.showSheet = true
                        self.activeSheet = .third
                    }){
                        Text("Guidance")
                            .fontWeight(.bold)
                            .font(.caption)
                            .padding(3)
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

        }
        .navigationViewStyle(StackNavigationViewStyle())
        .frame(height: 200)
        
        .sheet(isPresented: $showSheet, onDismiss: {
                self.showSheet = false
        }) {
                if self.activeSheet == .first {
                    ColorPicker(color: self.$color, pickerShown: self.$showSheet)
                }
                if self.activeSheet == .second {
                    WavePicker(pickerShown: self.$showSheet).environmentObject(self.sound)
                }
                if self.activeSheet == .third{

                    VStack{
                        Button(action: {
                            self.showSheet = false
                        }){
                            Text("Close")
                        }
        
                        Text("""
         [AIST2010 Dear Dr.CHAU!]
         You can \"draw\" your sound using your fingers! The oscillator of this sound is FMoscillator
         which is different from basic oscillators. The higher part of drawing pad can generate lower
         basic frequency. The lower part can generate higher basic frequency.
         
         CM in this view represents Carrier Multiplier
         MM in this view represents Modulating Multiplier
         MI in this view represents Modulation Index
         
         Most interesting part is that you can shake your device to left or right, it will modify the
         stereo effect(left or right). Also, you can just modify it by that slider.
         
         You can select pencil width with slider and color with \"pick color\" button.
         Besides, you can use the \"pick wave\" button to choose the waveform you like to generate the
         sound you like.
         """)
        
        
                    }
                            
                }
            }

    }
}

