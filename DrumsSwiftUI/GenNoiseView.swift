//
//  GenNoiseView.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/11/21.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI

struct GenNoiseView: View {

    @EnvironmentObject var noise: Noise

    var body: some View {
        VStack{
            OutputPlot()
                .frame(width: SCREENWIDTH*2/3)
            HStack{
                VStack(alignment: .leading, spacing: 20){
                    Text(String(format: "Brownian Volume: %.2f", noise.brownian.amplitude))
                        .padding()
                    Text(String(format: "Pink Volume: %.2f", noise.pink.amplitude))
                        .padding()
                    Text(String(format: "White Volume: %.2f", noise.white.amplitude))
                        .padding()
                }
                VStack{
                    Slider(value:$noise.brownian.amplitude,in: 0.0...1.0, step: 0.05)
                        .padding()
                    Slider(value: $noise.pink.amplitude, in: 0.0...1.0, step: 0.05)
                        .padding()
                    Slider(value: $noise.white.amplitude, in: 0.0...1.0, step: 0.05)
                        .padding()
                }
            }
        }

        .onAppear {
            self.noise.set()
        }
        .onDisappear(){
            self.noise.unset()
        }
    
    }

}

struct GenNoiseView_Previews: PreviewProvider {
    static var previews: some View {
        GenNoiseView()
    }
}
