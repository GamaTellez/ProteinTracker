//
//  LoadingView.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 7/6/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct ICloudAnimationView : View {
    private(set) var status : ICloudStatus
    private var cloudImageName : String
    
    @State private var animate = false
    
    init(status:ICloudStatus) {
        self.status = status
        switch self.status {
        case .checking:
            self.cloudImageName = Constants.Images.iCloud
        case .available:
            self.cloudImageName = Constants.Images.iCloudOn
        case .notAvailable:
            self.cloudImageName = Constants.Images.iCloudOff
        }
    }
    
    var body : some View {
        ZStack {
            if self.status == ICloudStatus.checking {
                Text(self.status.message)
                    .multilineTextAlignment(.center)
                    .font(AppFonts.title.of(size: 30.00))
                    .foregroundColor(Color.white)
                    .padding(.bottom, 250)
                Circle()
                    .strokeBorder(style: StrokeStyle(lineWidth: 1,  dash: [5]))
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color.white)
                Circle()
                    .frame(width:5, height:5)
                    .offset(x: 0, y: -75)
                    .rotationEffect(.degrees(self.animate ? 180 : 0))
                    .animation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false).delay(1))
                    .foregroundColor(Color.white)
                Circle()
                    .frame(width:5, height:5)
                    .offset(x: 0, y: 75)
                    .rotationEffect(.degrees(self.animate ? 180 : 0))
                    .animation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false).delay(3))
                    .foregroundColor(Color.white)
                VStack {
                    Image(self.cloudImageName)
                        .background(Color.backgroundGrey.frame(height:10))
                    Spacer()
                        .frame(height:100)
                    Image(Constants.Images.iPhone)
                        .background(Color.backgroundGrey.frame(width: 30))
                }.animation(.easeInOut(duration: 1.0))
                .transition(.opacity)
            }
            
            if self.status == ICloudStatus.notAvailable {
                VStack {
                    Text("ICloud services off.")
                        .foregroundColor(.white)
                        .font(AppFonts.title.of(size: 30))
                    Image(Constants.Images.iCloudOff)
                    Text(self.status.message)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.all, 10)
                        .lineLimit(nil)
                        .frame(height:100)
                    Button(action: {
                        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
                            return
                        }
                        if UIApplication.shared.canOpenURL(settingsURL) {
                            UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
                        } else {
                            print("Can't open settings")
                        }
                    }, label: {
                        HStack {
                            Text("Open Settings")
                            Image("settings")
                        }
                    }).padding(.top, 40)
                }.animation(.easeInOut(duration: 1.0))
                    .transition(.opacity)
            }
            
            if self.status == ICloudStatus.available {
                VStack {
                    Text("We are ready to go!")
                        .foregroundColor(.white)
                        .font(AppFonts.title.of(size: 30))
                    Image(Constants.Images.iCloudOn)
                    Text(self.status.message)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .padding(.all, 10)
                        .frame(height:100)
                }.animation(.easeInOut(duration: 1.0))
                    .transition(.opacity)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 400.00, alignment: .center)
        .edgesIgnoringSafeArea(.all)
        .background(Color.clear)
        .onAppear {
            if self.status == .checking {
                self.animate.toggle()
            }
        }
    }
}

struct ContentViewPreviews: PreviewProvider {
    static var previews: some View {
        ICloudAnimationView(status: ICloudStatus.notAvailable)
    }
}
