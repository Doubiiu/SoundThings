//
//  SoundEffect.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/10.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI
import AudioKit
import AudioKitUI
import CoreMotion

struct ContentView: View {

    let timeInterval: TimeInterval = 0.2
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    NavigationLink(destination: SynView()
                    ,label:{
                        Text("Draw the Sound")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: (SCREENWIDTH-30)/3, height: (SCREENHEIGHT-150)/3)
                        .background(Color.white)
                                                .opacity(0.5)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    })
                    
                    NavigationLink(destination: HarmonicView()
                    ,label:{
                        Text("Additive Synthesis")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: (SCREENWIDTH-30)/3, height: (SCREENHEIGHT-150)/3)
                        .background(Color.black)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    })
                    NavigationLink(destination: SoundEffectView()
                    ,label:{
                        Text("Sound Effect")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: (SCREENWIDTH-30)/3, height: (SCREENHEIGHT-150)/3)
                        .background(Color.white)
                                                .opacity(0.5)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    })
                }
                HStack{
                    NavigationLink(destination: GenNoiseView()
                    ,label:{
                        Text("Want Noise?")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: (SCREENWIDTH-30)/3, height: (SCREENHEIGHT-150)/3)
                        .background(Color.black)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    })
                    NavigationLink(destination: PlayWithView()
                    ,label:{
                        Text("Play & Record")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: (SCREENWIDTH-30)/3, height: (SCREENHEIGHT-150)/3)
                        .background(Color.white)
                                                .opacity(0.5)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    })
                    NavigationLink(destination: TestView()
                    ,label:{
                        Text("See the Sound")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: (SCREENWIDTH-30)/3, height: (SCREENHEIGHT-150)/3)
                        .background(Color.black)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    })
                }
                HStack{
                    NavigationLink(destination: TestKeyboard()
                    ,label:{
                        Text("MIDI Keyboard")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: (SCREENWIDTH-30)/3, height: (SCREENHEIGHT-150)/3)
                        .background(Color.white)
                                                .opacity(0.5)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    })
                    NavigationLink(destination: DrumsView()
                    ,label:{
                        Text("Drums")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: (SCREENWIDTH-30)/3, height: (SCREENHEIGHT-150)/3)
                        .background(Color.black)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    })
                    NavigationLink(destination: PhysicalView()
                    ,label:{
                        Text("Real-life Sound")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: (SCREENWIDTH-30)/3, height: (SCREENHEIGHT-150)/3)
                        .background(Color.white)
                                                .opacity(0.5)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    })
                }
            }
            .padding()
            .background(
                Image("Sky")
                    .resizable()

                    .edgesIgnoringSafeArea(.all)
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

