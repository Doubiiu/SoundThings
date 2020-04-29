//
//  PlayWithView.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/11/23.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI
struct Positions {
    var id = UUID()
    var num : Int
    var pos: CGSize
}
struct PlayWithView: View {
    @EnvironmentObject var data: DataModel

    
    var body: some View {
        VStack{
            HStack{
                ForEach(self.data.newPositions, id: \.id) { np in
                    DragView(newPosition: self.$data.newPositions, index: np.num)

                }
            }
            .padding(.bottom,100)
            .padding(.top,100)
            .border(Color.black, width: 4)
            .padding(.bottom, 100)
            HStack{
                Button(action: {
                    self.data.toggleSound()
                }){
                    Text(data.sound ? "Sound On" : "Sound Off")
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
                    self.data.record()
                }){
                    Text(data.recording ? "Recording" : "Record")
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
                    self.data.play()
                }){
                    Text(data.playing ? "Playing" : "Play")
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
                Button(action: {
                    self.data.loadDemo()
                }){
                    Text("Load Demo")
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
                    self.data.delete()
                }){
                    Text("Delete")
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
                VStack{
                    Text("Amplitude (0-5)")
                    Text("\(data.amplitude)")
                }
                Slider(value: $data.amplitude, in: 0.0...5.0)

            }
            HStack{
                VStack{
                    Text("Frequency (0-1500Hz)")
                    Text("\(data.frequency)")
                }
                Slider(value: $data.frequency, in: 0.0...1500.0)
            }

        }
        .onAppear(){
            self.data.set()
        }
        .onDisappear(){
            
        }
    }
}

struct PlayWithView_Previews: PreviewProvider {
    static var previews: some View {
        PlayWithView()
    }
}
