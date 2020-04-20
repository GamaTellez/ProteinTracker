//
//  CountViews.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/16/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

struct GoalCountLabel : View {
    let proteinCount : Int
    let proteinGoal : Int
    
    var body : some View {
        Text("\(self.proteinCount) / \(self.proteinGoal) g.")
            .font(Font.custom("StringHelveticaNeue-CondensedBold", size: 30))
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            .scaledToFit()
            .minimumScaleFactor(0.5)
    }
}

struct BarButton : View {
    let imageName : String
    let function : () -> Void
    let side : Edge.Set
    let paddingSize : CGFloat
    
    var body : some View {
        Button(action: {
            self.function()
        }, label: {
            Image(self.imageName)
                .foregroundColor(Color.white)
                .padding(self.side, self.paddingSize)
        })
    }
}

struct DayText : View {
    let text : String
    
    var body : some View {
        Text(self.text)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .font(Font.custom("HelveticaNeue-CondensedBold", size: 20))
            .frame(width: 150, height: 50, alignment: .center)
    }
}

fileprivate struct CaloriesCountLabel : View {
    let calories : Int
    
    var body : some View {
        Text("\(self.calories) Cal.")
            .font(Font.custom("StringHelveticaNeue-CondensedBold", size: 30))
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            .scaledToFit()
            .minimumScaleFactor(0.5)
    }
}

struct CaloriesCircle : View {
    let width : CGFloat
    let height : CGFloat
    let caloriesCount : Int
    
    var body : some View {
        ZStack {
            Circle()
                .frame(width: self.width, height: self.height, alignment: .center)
                .foregroundColor(Color.appGreen)
            Circle()
                .frame(width: self.width - 10, height: self.height - 10, alignment: .center)
                .foregroundColor(Color.viewControllersGrey)
            CaloriesCountLabel(calories: self.caloriesCount)
        }
    }
}

struct AddEntryMenuButton : View {
    let function : () -> Void
    let imageName : String
    let entryMenuShowing : Bool
    
    var body : some View {
        
        Button(action: {
            self.function()
        }, label: {
            Image(self.imageName)
                .resizable()
                .background(Color.black)
                .rotationEffect(.degrees(self.entryMenuShowing ? 100 : 0))
                .animation(Animation.spring())
        })
            .frame(width: 80, height: 80, alignment: .trailing)
            .mask(Circle())
            .padding(.trailing, 20)
            .foregroundColor(Color.white)
        
        
        
        //        Button(action: { self.function() }) {
        //            Image(self.imageName)
        //                .resizable()
        //                .background(Color.black)
        //                .rotationEffect(.degrees( self.entryMenuShowing ? 180 : 0))
        //                .animation(Animation.spring())
        //
        //        }
        //        .frame(width: 80, height: 80, alignment: .trailing)
        //        .mask(Circle())
        //        .padding(.trailing, 20)
        //        .foregroundColor(Color.white)
    }
}
