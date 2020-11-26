//
//  ProgressBar.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 6/22/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

enum ProgressPortion {
    case none
    case half
    case whole
    
    var value : Int {
        switch self {
        case .none:
            return 0
        case .half:
            return 1
        case .whole:
            return 2
        }
    }
}

struct ProgressBar : View {
    @Binding var progressValue : ProgressPortion
    
    var body : some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color.white)
                Rectangle()
                    .frame(width: min((geometry.size.width / 2.0) *  CGFloat(self.progressValue.value), geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color.appGreen)
                    .animation(.linear)
            }
        }
    }
}
