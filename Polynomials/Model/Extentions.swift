//
//  Extentions.swift
//  Polynomials
//
//  Created by Khater on 5/12/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import UIKit

extension UITextField{
    
    func wiggleTheButton() {
        let wiggleAnim = CABasicAnimation(keyPath: "position")
        wiggleAnim.duration = 0.05
        wiggleAnim.repeatCount = 5
        wiggleAnim.autoreverses = true
        wiggleAnim.fromValue = CGPoint(x: self.center.x - 4.0, y: self.center.y)
        wiggleAnim.toValue = CGPoint(x: self.center.x + 4.0, y: self.center.y)
        layer.add(wiggleAnim, forKey: "position")
    }
}

//buttons with corners
extension UIButton{
    
    func cornerByTwo(){
        self.layer.cornerRadius = self.frame.size.height/2
    }
    
    
    func cornerByThree(){
        self.layer.cornerRadius = self.frame.size.height/3
    }
}
