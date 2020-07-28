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
    case oneThird
    case twoThirds
    case threeThirds
    
    var value : Int {
        switch self {
        case .none:
            return 0
        case .oneThird:
            return 1
        case .twoThirds:
            return 2
        case .threeThirds:
            return 3
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
                    .frame(width: min((geometry.size.width / 3.0) *  CGFloat(self.progressValue.value), geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color.appGreen)
                    .animation(.linear)
            }
        }
    }
}
