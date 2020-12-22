//
//  SplashView.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 12/1/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

struct SplashView : View {
    
    var body : some View {
        VStack {
            
            
            Text("Animation Here!")
            
        }
        .frame(minWidth: nil, idealWidth: nil, maxWidth: .infinity, minHeight: nil, idealHeight: nil, maxHeight: .infinity, alignment: .center)
        .background(Color.backgroundGrey).edgesIgnoringSafeArea(.all)
        
        .onAppear {
            
        }
    }
}

