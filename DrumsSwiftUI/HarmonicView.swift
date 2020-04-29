//
//  HarmonicView.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/7.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI

struct HarmonicView: View {
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    @EnvironmentObject var additive:Additive
    @State var Hz = 261.63
    var body: some View {
        VStack{
            
            HStack{
                VStack{
                    HStack{
                        Text("Basic Frequency")
                        TextField("Basic Frequency", value:$Hz, formatter: NumberFormatter())
                            .padding()
                            .background(lightGreyColor)
                            .cornerRadius(5.0)
                            .padding()
                    }
                    
                    HStack{
                        Button(action: {
                            self.additive.setfHz(f:self.Hz)
                        }){
                            Text("Confirm")
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
                            self.additive.start()
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
                            self.additive.stop()
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


                }
                FFTplot(f: self.$Hz)
                    .frame(width: SCREENWIDTH/2, height: SCREENHEIGHT/4)
            }
            .padding()

            HStack{
                VStack(spacing: 20){
                    
                    Text("\(Int(additive.frequencies[0]))Hz")
                    Text("\(Int(additive.frequencies[1]))Hz")
                    Text("\(Int(additive.frequencies[2]))Hz")
                    Text("\(Int(additive.frequencies[3]))Hz")
                    Text("\(Int(additive.frequencies[4]))Hz")
                    Text("\(Int(additive.frequencies[5]))Hz")
                    Text("\(Int(additive.frequencies[6]))Hz")
                    Text("\(Int(additive.frequencies[7]))Hz")
                    Text("\(Int(additive.frequencies[8]))Hz")
                    Text("\(Int(additive.frequencies[9]))Hz")
                }
                VStack(spacing: 10){
                    
                    Slider(value:$additive.AMPs[0], in: 0.0...1.0, step: 0.001)
                        

                    Slider(value:$additive.AMPs[1], in: 0.0...1.0, step: 0.001)
                        

                    Slider(value:$additive.AMPs[2], in: 0.0...1.0, step: 0.001)

                    Slider(value:$additive.AMPs[3], in: 0.0...1.0, step: 0.001)

                    Slider(value:$additive.AMPs[4], in: 0.0...1.0, step: 0.001)
 
                    Slider(value:$additive.AMPs[5], in: 0.0...1.0, step: 0.001)
      
                    Slider(value:$additive.AMPs[6], in: 0.0...1.0, step: 0.001)

                    Slider(value:$additive.AMPs[7], in: 0.0...1.0, step: 0.001)
   
                    Slider(value:$additive.AMPs[8], in: 0.0...1.0, step: 0.001)

                    Slider(value:$additive.AMPs[9], in: 0.0...1.0, step: 0.001)

                    
                }
                VStack(spacing: 20){
                    Text("\(Int(additive.AMPs[0]*100))")
                    Text("\(Int(additive.AMPs[1]*100))")
                    Text("\(Int(additive.AMPs[2]*100))")
                    Text("\(Int(additive.AMPs[3]*100))")
                    Text("\(Int(additive.AMPs[4]*100))")
                    Text("\(Int(additive.AMPs[5]*100))")
                    Text("\(Int(additive.AMPs[6]*100))")
                    Text("\(Int(additive.AMPs[7]*100))")
                    Text("\(Int(additive.AMPs[8]*100))")
                    Text("\(Int(additive.AMPs[9]*100))")
                }
            .padding()
            }

        }
        .onAppear(){
            self.additive.set()
        }
    }
}

struct HarmonicView_Previews: PreviewProvider {
    static var previews: some View {
        HarmonicView()
    }
}
