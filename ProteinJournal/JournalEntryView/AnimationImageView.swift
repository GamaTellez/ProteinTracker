//
//  AnimationImageView.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 11/23/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

struct AnimationImageView : UIViewRepresentable {
    
    var animationImageView = UIImageView(frame: CGRect.zero)
    
    var wholeChickenImages : [UIImage] = {
        var images = [UIImage]()
        
        for index in 1...9 {
            guard let image = UIImage(named: "wholeChickenFrames/\(index)") else { break }
            images.append(image)
        }

        return images
    }()
    
    var width : CGFloat
    
    func makeUIView(context: Context) -> some UIView {
        let holderView = UIView(frame: CGRect(x: 0, y: 0, width: self.width, height: 100))
        self.animationImageView.translatesAutoresizingMaskIntoConstraints = false
        self.animationImageView.animationImages = self.wholeChickenImages
        self.animationImageView.animationDuration = 3
        holderView.addSubview(self.animationImageView)
        NSLayoutConstraint.activate([self.animationImageView.centerXAnchor.constraint(equalTo: holderView.safeAreaLayoutGuide.centerXAnchor),
                                     self.animationImageView.centerYAnchor.constraint(equalTo: holderView.safeAreaLayoutGuide.centerYAnchor),
                                     self.animationImageView.widthAnchor.constraint(equalToConstant: 200),
                                     self.animationImageView.heightAnchor.constraint(equalToConstant: 100)])
        self.animationImageView.center = holderView.center
        return holderView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        self.animationImageView.startAnimating()
    }
}
