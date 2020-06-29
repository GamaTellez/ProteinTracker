//
//  Extenstions.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/8/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import Foundation
import SwiftUI

//MARK: UIColorExtensions
extension Color {
    static let backgroundGrey = Color("viewControllersGrey")
    static let appGreen = Color("buttonsGreen")
    static let foreGroundColor = Color.white
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

enum AppFonts : String {
    case title = "HelveticaNeue-CondensedBold"
    
    func of(size:CGFloat)-> Font {
        return Font.custom(self.rawValue, size: size)
    }
}
