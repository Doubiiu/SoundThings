//
//  SoundEffect.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/12/10.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI
import AudioKit
import CoreMotion

struct DrawingPad: View {
    @Binding var currentDrawing: Drawing
    @Binding var drawings: [Drawing]
    @Binding var color: Color
    @Binding var lineWidth: Double
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @EnvironmentObject var sound : Sound
    
    @State var touchBegin: Bool = true
    @State var motionManager = CMMotionManager()

    let timeInterval: TimeInterval = 0.2
    
    var body: some View {

        GeometryReader { geometry in
            Path { path in
                for drawing in self.drawings {
                    self.add(drawing: drawing, toPath: &path)
                }
                self.add(drawing: self.currentDrawing, toPath: &path)
                
            }

            .stroke(self.color, lineWidth: CGFloat(self.lineWidth))
                .background(Color(white: 0.95))
//                .background(
//                    Image("Sky")
//                        .resizable()
//                        .frame(width: SCREENWIDTH, height: SCREENHEIGHT))
                .gesture(
                    DragGesture(minimumDistance: 0.0)
                        .onChanged({ (value) in
                            let currentPoint = value.location
                            if currentPoint.y >= 0
                                && currentPoint.y < geometry.size.height {
                                self.currentDrawing.points.append(currentPoint)
                                
                                if self.touchBegin{
                                    print("\(Double(currentPoint.x)), \(Double(currentPoint.y))")
                                    
                                    self.sound.updateOscillator(x: Double(currentPoint.x),y: Double(currentPoint.y))
                                    self.sound.startOscillator()
                                    self.touchBegin = false
                                }else{
                                    self.sound.updateOscillator(x: Double(currentPoint.x),y: Double(currentPoint.y))
                                }
                                
                            }
                            
                        })
                        .onEnded({ (value) in
                            self.drawings.append(self.currentDrawing)
                            self.currentDrawing = Drawing()
                            self.sound.stopOscillator()
                            self.touchBegin = true
                        })

            )
        }
        .frame(maxHeight: .infinity)
//        .frame(height: SCREENHEIGHT)
        .onReceive(timer) { _ in
            if self.drawings.count > 0{
                self.drawings.removeFirst()
            }
        }
        .onAppear {
            self.sound.set()
            self.updateGY()
        }
    }
    
    private func add(drawing: Drawing, toPath path: inout Path) {
        let points = drawing.points
        if points.count > 1 {
            for i in 0..<points.count-1 {
                let current = points[i]
                let next = points[i+1]
                path.move(to: current)
                path.addLine(to: next)
            }
        }
    }
    
    private func updateGY(){
        guard self.motionManager.isGyroAvailable else {
            return
        }

        self.motionManager.gyroUpdateInterval = self.timeInterval
        let queue = OperationQueue.current
        self.motionManager.startGyroUpdates(to: queue!, withHandler: { (gyroData, error) in
            guard error == nil else {
                print(error!)
                return
            }
            if self.motionManager.isGyroActive {
                if let rotationRate = gyroData?.rotationRate {
                    if (rotationRate.x > 3){
                        self.sound.updateStero(degree: 0.5)
                    }
                    if (rotationRate.x < -3){
                        self.sound.updateStero(degree: -0.5)
                    }
                }
            }
        })
    
    }
}


