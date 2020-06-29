//
//  CircleGoalView.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 5/5/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

struct CircleGoalView : View {
    var proteinCount : Int
    var proteinGoal : Int
    
    var body : some View {
        
        GeometryReader { geometry in
            HStack {
                ZStack {
                    GoalBaseShape()
                        .stroke(Color.white, lineWidth: 10)
                    GoalProgressShape(startAngle: .degrees(0),
                                      endAngle: .degrees(45),
                                      clockwise: true)
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                        .foregroundColor(Color.appGreen)
                    Text("35 / 250 g.")
                        .font(AppFonts.title.of(size: 30))
                        .foregroundColor(Color.white)
                }
            }
            .frame(width: 350, height: 350, alignment: .top)
        }
    }
}

struct ContentView: PreviewProvider {
    static var previews: some View {
        CircleGoalView(proteinCount: 10, proteinGoal: 20)
    }
}

private struct GoalBaseShape : Shape {
    func path(in rect: CGRect) -> Path {
        var baseCirclePath = Path()
        baseCirclePath.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                              radius: rect.width / 2.5,
                              startAngle: .degrees(0),
                              endAngle: .degrees(360),
                              clockwise: true)
        return baseCirclePath
    }
}

private struct GoalProgressShape : Shape {
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
