//
//  Banner.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/27/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

struct EntrySavedBanner : View {
    //var entry : ProteinEntry
    
    var body : some View {
        VStack {
            HStack {
            Text("New Entry!")
                .multilineTextAlignment(.leading)
                .foregroundColor(.appGreen)
                .font(Font.custom("StringHelveticaNeue-CondensedBold", size: 15))
                .padding(5)
                Spacer()
            }
        }
        .frame(minWidth: 200, idealWidth: .infinity, maxWidth: .infinity, minHeight: 70, idealHeight: nil, maxHeight: 70, alignment: .leading)
        .transition(.asymmetric(insertion: AnyTransition.opacity.combined(with: .slide), removal: .scale))
        .background(Color.black)
        .clipShape(RoundedCorner(radius: 10, corners: [.topRight, .bottomRight]))
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: self.corners, cornerRadii: CGSize(width: self.radius, height: self.radius))
        return Path(path.cgPath)
    }
}
