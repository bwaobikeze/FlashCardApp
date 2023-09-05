//
//  color.swift
//  Exercise2_Waobikeze_Brian
//
//  Created by brian waobikeze on 9/4/23.
//

import SwiftUI
 //This is an extension of the SwiftUI color type
// That creates an initializer that when given a hexidecimal it converts it into rgb values
extension Color{
    init(hex: UInt, alpha: Double = 1) {
            self.init(
                .sRGB,
                red: Double((hex >> 16) & 0xff) / 255,
                green: Double((hex >> 08) & 0xff) / 255,
                blue: Double((hex >> 00) & 0xff) / 255,
                opacity: alpha
            )
        }
}
