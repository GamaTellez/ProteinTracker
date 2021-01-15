//
//  NewDayView.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 12/22/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import Foundation
import SwiftUI

struct NewDayView: View {
    
    @State private var proteinGoal : String  = ""
    
    @State private var notificationShowing = false
    
    @State private var newDaySavedSuccessfully = false
    
    private let height : CGFloat = 200
    
    private let notificationMessage : String = "Invalid goal."
    
    private let dayDate = Date()
    
    private(set) var showing : Binding<Bool>
    
    private(set) var width : CGFloat
    
    private(set) var coreDataController : CoreDataController
    
    private let formatter : NumberFormatter = {
        let formater = NumberFormatter()
        formater.numberStyle = .none
        formater.roundingMode = .halfUp
        formater.maximumFractionDigits = 0
        return formater
    }()
    
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation {
                        self.showing.wrappedValue.toggle()
                    }
                }) {
                    Image("dismiss")
                        .renderingMode(.template)
                        .foregroundColor(Color.white)
                }
                Text("New Day")
                    .foregroundColor(Color.foreGroundColor)
                    .font(AppFonts.title.of(size: 30))
                Spacer()
            }
            
            Text(Date.formattedDate(from: self.dayDate)!)
                .foregroundColor(Color.white)
                .font(AppFonts.title.of(size: 15))
                .padding(.all, 20)
            
            
            if self.newDaySavedSuccessfully {
                Image("done")
                    .renderingMode(.template)
                    .foregroundColor(.appGreen)
                    .transition(.scale)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                self.showing.wrappedValue.toggle()
                            }
                        }
                    }
            } else {
                TextField("0", text: self.$proteinGoal)
                    .foregroundColor(.black)
                    .font(AppFonts.title.of(size: 30))
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100, height: 50, alignment: .center)
            }
            
            HStack {
                if self.notificationShowing {
                    Text(self.notificationMessage)
                        .transition(.opacity)
                        .foregroundColor(Color.red)
                        .font(AppFonts.title.of(size: 15))
                        .padding(.all, 20)
                } else {
                    Button(action: {
                        guard let goal = Int(self.proteinGoal),
                              goal > 0 && goal < 500 else {
                            self.toggleInvalidGoalNotification()
                            return
                        }
                        self.coreDataController.createDay(proteinGoal: goal) { saved in
                            withAnimation {
                                if saved {
                                    withAnimation {
                                        self.newDaySavedSuccessfully.toggle()
                                    }
                                }
                            }
                        }
                    }) {
                        Text("Save")
                            .foregroundColor(.white)
                            .font(AppFonts.title.of(size: 20))
                    }
                    .padding(.all, 20)
                }
            }
            
        }.frame(minWidth: self.width,
                idealWidth: self.width,
                maxWidth: self.width,
                minHeight: self.height,
                idealHeight: self.height,
                maxHeight: self.height,
                alignment: .top)
        .background(Color.backgroundGrey).edgesIgnoringSafeArea(.all)
        .transition(AnyTransition.move(edge: .leading).combined(with: .opacity))
    }
}

private extension NewDayView {
    private func toggleInvalidGoalNotification() {
        withAnimation {
            self.notificationShowing.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.notificationShowing.toggle()
                }
            }
        }
    }
}

//struct NewDayPreview: PreviewProvider {
//    static var previews: some View {
//        NewDayView(width: 300)
//    }
//}
