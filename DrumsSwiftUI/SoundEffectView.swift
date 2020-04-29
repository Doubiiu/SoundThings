//
//  SoundEffect.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/9.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI

struct SoundEffectView: View {
    @EnvironmentObject var soundeffect:SoundEffect
    var body: some View {
        VStack{
            HStack(spacing: 30){
                VStack(spacing: 20){
                    Text("Frequency")
                    Text("Amplitude")

                }
                VStack{
                    Text("\(Int(soundeffect.trackerF))")
                        .font(.system(size: 50))
                    Text("\(soundeffect.trackerA)")
                        .font(.system(size: 50))
                }
            }
                .frame(width: SCREENWIDTH*2/3)
            
            HStack{
                VStack{
                    Picker(selection: $soundeffect.fileIndex, label: Text("")) {
                        ForEach(0 ..< soundeffect.files.count) {
                            Text(self.soundeffect.files[$0])
                        }
                    }
                        .pickerStyle(WheelPickerStyle())
                        .labelsHidden()
                    HStack{
                        Button(action: {
                            self.soundeffect.startWah()
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
                            self.soundeffect.stopWah()
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
                    HStack{

                        VStack(alignment: .leading){
                            Text("Auto Wah Wah: (Wah)\(soundeffect.wahValue)")
                                .padding()

                        }
                        VStack(){
                            Slider(value:$soundeffect.wahValue,in: 0.0...1.0, step: 0.1)
                                .padding()
                        }
                    }
                }
                
                VStack{
                    HStack{
                         VStack(spacing: 20){
                                Text("\(Int(32))Hz")
                                Text("\(Int(64))Hz")
                                Text("\(Int(125))Hz")
                                Text("\(Int(250))Hz")
                                Text("\(Int(500))Hz")
                                Text("\(Int(1000))Hz")
                            }
                            VStack(spacing: 10){
                                 Slider(value:$soundeffect.gainValues[0], in: 0.0...2.0, step: 0.01)
                                 Slider(value:$soundeffect.gainValues[1], in: 0.0...2.0, step: 0.01)
                                 Slider(value:$soundeffect.gainValues[2], in: 0.0...2.0, step: 0.01)
                                 Slider(value:$soundeffect.gainValues[3], in: 0.0...2.0, step: 0.01)
                                 Slider(value:$soundeffect.gainValues[4], in: 0.0...2.0, step: 0.01)
                                 Slider(value:$soundeffect.gainValues[5], in: 0.0...2.0, step: 0.01)
                            }
                             .padding()
                    }
                    Text("Equalizer Filters")
                }

            }

        }
        .onAppear(){
            self.soundeffect.set()
        }
    }
}

struct SoundEffectView_Previews: PreviewProvider {
    static var previews: some View {
        SoundEffectView()
    }
}
