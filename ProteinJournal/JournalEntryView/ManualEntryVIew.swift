//
//  EntryVIew.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/16/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

enum NewEntryStatus {
    case notSaved, saving, saved, savedFailed
}

struct ManualEntryView : View {
    
    @ObservedObject private var entryVeryfier : EntryVeryfier = EntryVeryfier()
    
    @State private var savedSuccessfully = false
    
    @State private var entryStatus : NewEntryStatus = .notSaved
    
    @State private var animating = false
    
//    private(set) var currentDay : Day
    
    private(set) var coreDataController : CoreDataController
    
    private(set) var showing : Binding<Bool>
    
    private var width : CGFloat
    
    
    
    init(minWidth: CGFloat, showing:Binding<Bool>, coreDataController: CoreDataController) {
        self.width = minWidth
        self.showing = showing
        self.coreDataController = coreDataController
    }
    
    var body : some View {
        VStack (alignment: .center) {
            VStack (spacing: 0){
                
                HStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                {
                    
                    Button(action: {
                        withAnimation {
                            self.showing.wrappedValue.toggle()
                        }
                    }) {
                        Image("dismiss")
                            .renderingMode(.template)
                            .foregroundColor(self.entryStatus == NewEntryStatus.saving ? Color.gray : Color.white)
                    }
                    
    
                    Text("New Entry")
                        .foregroundColor(Color.foreGroundColor)
                        .font(AppFonts.title.of(size: 30))
                    Spacer()
                }
                .frame(minWidth: nil, idealWidth: nil, maxWidth: .infinity, minHeight: 40, idealHeight: nil, maxHeight: 40, alignment: .center)
                
                HStack {
                    ProgressBar(progressValue: self.$entryVeryfier.portionFilled)
                        .frame(height: 2)
                        .padding(.top, 0)
                }
            }
            
            HStack {
                if self.entryStatus == .notSaved {
                    EntryTextField(text: self.$entryVeryfier.entryProtein, type: .protein)
                        .padding(.top, 5)
                    EntryTextField(text: self.$entryVeryfier.entryCalories, type: .calories)
                        .padding(.top, 5)
                }
                if self.entryStatus == .saving {
                    AnimationImageView(width: self.width)
                }
                if self.entryStatus == .saved {
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
                }
            }.frame(width: self.width, height:150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Button(action: { self.saveButtonTapped() }
                   , label: {
                    HStack {
                        Text(self.entryStatus == NewEntryStatus.notSaved ? "Save" : (self.entryStatus == NewEntryStatus.saving ? "Saving..." : "Saved"))
                            .foregroundColor( self.entryVeryfier.portionFilled == .whole ? .white : .gray )
                            .font(AppFonts.title.of(size: 20))
                            .transition(.opacity)
                        if self.entryStatus == .notSaved {
                            Image("save").renderingMode(.template)
                                .foregroundColor(self.entryVeryfier.portionFilled == .whole ? Color.white : Color.gray)
                                .transition(.opacity)
                        }
                    }
                   })
                .frame(width:150, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .border(self.entryVeryfier.portionFilled == .whole ? Color.white : Color.gray, width: 0.5)
                .disabled(!(self.entryVeryfier.portionFilled == .whole))
                .padding(.bottom, 20)
            
        }
        .frame(minWidth: self.width, idealWidth: self.width, maxWidth: self.width, minHeight: 250, idealHeight: nil, maxHeight: 250, alignment: .top)
        .background(Color.backgroundGrey).edgesIgnoringSafeArea(.all)
        .transition(AnyTransition.move(edge: .leading).combined(with: .opacity))
    }
    
    //MARK: save button tapped
    private func saveButtonTapped() {
        withAnimation {
            
            self.entryStatus = .saving
            //            self.coreDataController.createProteinEntry(calories: self.entryVeryfier.calories,
            //                                                       protein: self.entryVeryfier.protein) { (saved) in
            //                if saved {
            //                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            //                        self.showing.wrappedValue.toggle()
            //                    }
            //                }
            //            }
            
        }
    }
}


struct WrappingView : View {
    @State var something = false
    var body: some View {
        ManualEntryView(minWidth: 370, showing: self.$something, coreDataController: CoreDataController())
    }
}

struct ManualEntryViewPreview: PreviewProvider {
    static var previews: some View {
        WrappingView()
    }
}

