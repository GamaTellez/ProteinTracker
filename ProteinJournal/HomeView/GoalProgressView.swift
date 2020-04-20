//
//  GoalProgressView.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/7/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import UIKit
import SwiftUI

//struct GoalProgressContentView : View {
//    var body : some View {
//        GoalProgressView(height: 100, width: 100)
//    }
//}


struct GoalProgressView : Shape {
    var startAngle : Angle
    var endAngle : Angle
    var clockwise : Bool

    var animatableData : Angle.AnimatableData {
        get { self.endAngle.animatableData }
        set { self.endAngle.animatableData = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        let rotatioAdjusment = Angle.degrees(90)
        let modifiedStart = self.startAngle - rotatioAdjusment
        let modifiedEnd = self.endAngle - rotatioAdjusment
        
        var baseCirclePath = Path()
        baseCirclePath.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                              radius: rect.width / 2.5,
                              startAngle: modifiedStart,
                              endAngle: modifiedEnd,
                              clockwise: !self.clockwise)
        return baseCirclePath
    }
}



