//
//  ColorsProvider.swift
//  SoundThings
//
//  Created by 邢金波 on 2019/11/13.
//  Copyright © 2019 AudioKit. All rights reserved.
//

import SwiftUI

struct ColorInfo: Identifiable {
    let id: Int
    let displayName: String
    let color: Color
}

class ColorsProvider {
    
    static func supportedColors() -> [ColorInfo] {
        return [ColorInfo(id: 1, displayName: "Black", color: Color.black),
               ColorInfo(id: 2, displayName: "Blue", color: Color.blue),
               ColorInfo(id: 3, displayName: "Red", color: Color.red),
               ColorInfo(id: 4, displayName: "Green", color: Color.green),
               ColorInfo(id: 5, displayName: "Yellow", color: Color.yellow),
               ColorInfo(id: 6, displayName: "Orange", color: Color.orange),
               ColorInfo(id: 7, displayName: "Gray", color: Color.gray),
               ColorInfo(id: 8, displayName: "Purple", color: Color.purple),
               ColorInfo(id: 9, displayName: "Pink", color: Color.pink)]
    }
    
}
