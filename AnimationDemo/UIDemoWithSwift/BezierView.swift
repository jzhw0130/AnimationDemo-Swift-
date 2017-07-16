//
//  BezierView.swift
//  UIDemoWithSwift
//
//  Created by jing on 16/07/2017.
//  Copyright © 2017 jing. All rights reserved.
//

import UIKit

class BezierView: UIView {

    var bezierPath: UIBezierPath?
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        UIColor.blue.setStroke()
        UIColor.red.setFill()
        
        bezierPath?.lineWidth = 5.0
        bezierPath?.stroke()
        bezierPath?.fill()
    }
 

}
