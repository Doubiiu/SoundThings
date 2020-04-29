//
//  PhysicalView.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/9.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhysicalView: View {
    @EnvironmentObject var physical:Physical
    
    var body: some View {
        VStack{
            HStack{
                HStack{
                    VStack{
                        Button(action: {
                            self.physical.playDrip()

                        }){
                            
                            Text("Water Drip")
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
                            self.physical.stopDrip()

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
                    WebImage(url: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1575885087924&di=12de863f20f4f55674d963c452e99ebf&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201812%2F15%2F20181215014816_grnel.thumb.700_0.gif"))
                        .onSuccess { image, cacheType in
                            // Success
                        }
                        .resizable() // Resizable like SwiftUI.Image
                        .placeholder(Image(systemName: "photo")) // Placeholder Image
                        // Supports ViewBuilder as well
                        .placeholder {
                            Rectangle().foregroundColor(.gray)
                        }
                        .animated(physical.playingDrip)
                        .indicator(.activity) // Activity Indicator
                        .animation(.easeInOut(duration: 0.5)) // Animation Duration
                        .transition(.fade) // Fade Transition
                        .scaledToFit()
                        .frame(width: 300, height: 300, alignment: .center)
                }
                HStack{
                    VStack{
                        Button(action: {
                            self.physical.playFlute()

                        }){
                            Text("Flute")
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
                            self.physical.stopFlute()

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
                    //for use:/*https://www.darendaisuki.com/static/flute.gif */
                    WebImage(url: URL(string: "https://66.media.tumblr.com/fc8b641960601938fa1b7aeda8632c32/tumblr_oixozmro9F1qet0cro1_400.gifv"))
                        .onSuccess { image, cacheType in
                            // Success
                        }
                        .resizable() // Resizable like SwiftUI.Image
                        .placeholder(Image(systemName: "photo")) // Placeholder Image
                        // Supports ViewBuilder as well
                        .placeholder {
                            Rectangle().foregroundColor(.gray)
                        }
                        .animated(physical.playingFlute) // Supports Animated Image
                        .indicator(.activity) // Activity Indicator
                        .animation(.easeInOut(duration: 0.5)) // Animation Duration
                        .transition(.fade) // Fade Transition
                        .scaledToFit()
                        .frame(width: 300, height: 300, alignment: .center)
                }
            }
            HStack{
                HStack{
                    VStack{
                        Button(action: {
                            self.physical.playVocal()

                        }){
                            Text("Random Vocal Tract")
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
                            self.physical.stopVocal()

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
                    WebImage(url: URL(string: "https://www.darendaisuki.com/static/vocal.gif"))
                        .onSuccess { image, cacheType in
                            // Success
                        }
                        .resizable() // Resizable like SwiftUI.Image
                        .placeholder(Image(systemName: "photo")) // Placeholder Image
                        // Supports ViewBuilder as well
                        .placeholder {
                            Rectangle().foregroundColor(.gray)
                        }
                        .animated(physical.playingVocal) // Supports Animated Image
                        .indicator(.activity) // Activity Indicator
                        .animation(.easeInOut(duration: 0.5)) // Animation Duration
                        .transition(.fade) // Fade Transition
                        .scaledToFit()
                        .frame(width: 300, height: 300, alignment: .center)
                }
                HStack{
                    VStack{
                        Button(action: {
                            self.physical.playBell()
                            print(self.physical.playingBell)

                        }){
                            Text("Tubular Bells")
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
                            self.physical.stopBell()

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
                    WebImage(url: URL(string: "https://www.darendaisuki.com/static/bells.gif"))
                        .onSuccess { image, cacheType in
                            // Success
                        }
                        .resizable() // Resizable like SwiftUI.Image
                        .placeholder(Image(systemName: "photo")) // Placeholder Image
                        // Supports ViewBuilder as well
                        .placeholder {
                            Rectangle().foregroundColor(.gray)
                        }
                        .animated(self.physical.playingBell) // Supports Animated Image
                        .indicator(.activity) // Activity Indicator
                        .animation(.easeInOut(duration: 0.5)) // Animation Duration
                        .transition(.fade) // Fade Transition
                        .scaledToFit()
                        .frame(width: 300, height: 300, alignment: .center)
                }
            }

        }

    }
}

struct PhysicalView_Previews: PreviewProvider {
    static var previews: some View {
        PhysicalView()
    }
}
