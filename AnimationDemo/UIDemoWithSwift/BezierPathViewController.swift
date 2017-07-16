//
//  BezierPathViewController.swift
//  UIDemoWithSwift
//
//  Created by jing on 16/07/2017.
//  Copyright © 2017 jing. All rights reserved.
//

import UIKit

class BezierPathViewController: UIViewController {

    @IBOutlet weak var commonView: UIView!
    @IBOutlet weak var bezierView: BezierView!
    
    let rectWidth = CGFloat(150)
    let rectHeight = CGFloat(180)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Layer method
    
    @IBAction func bezier1(_ sender: Any) {
        let bezierRect = UIBezierPath(roundedRect: CGRect.init(x: (self.commonView.frame.size.width - rectWidth)/2, y: (self.commonView.frame.size.height - rectHeight)/2, width: rectWidth, height: rectHeight), cornerRadius: 20)
        
        strokeWithPath(bezierRect)
        drawWithPath(bezierRect)
    }

    @IBAction func bezier2(_ sender: Any) {
        let bezierOval = UIBezierPath(ovalIn:  CGRect.init(x: (self.commonView.frame.size.width - rectWidth)/2, y: (self.commonView.frame.size.height - rectHeight)/2, width: rectWidth, height: rectHeight))
        
        strokeWithPath(bezierOval)
        drawWithPath(bezierOval)
    }
    
    @IBAction func bezier3(_ sender: Any) {
        
        let bezierRectWithCorner = UIBezierPath(roundedRect:  CGRect.init(x: (self.commonView.frame.size.width - rectWidth)/2, y: (self.commonView.frame.size.height - rectHeight)/2, width: rectWidth, height: rectHeight), byRoundingCorners:[ UIRectCorner.bottomLeft, UIRectCorner.bottomRight], cornerRadii: CGSize(width: 10, height: 60))
        
        strokeWithPath(bezierRectWithCorner)
        drawWithPath(bezierRectWithCorner)
    }
    
    @IBAction func bezier4(_ sender: Any) {
        let bezierArc = UIBezierPath(arcCenter: CGPoint.init(x: self.commonView.frame.size.width/2, y: self.commonView.frame.size.height/2), radius: rectWidth/2, startAngle: 0, endAngle: CGFloat(Float.pi), clockwise: true)
        
        strokeWithPath(bezierArc)
        drawWithPath(bezierArc)
    }
    

    
    
    
    @IBAction func bezier5(_ sender: Any) {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: (self.commonView.frame.size.width - rectWidth)/2, y: (self.commonView.frame.size.height - rectHeight)/2))
        path.addLine(to: CGPoint(x: (self.commonView.frame.size.width - rectWidth)/2 + 20, y: (self.commonView.frame.size.height - rectHeight)/2 + 90))
        path.addLine(to: CGPoint(x: (self.commonView.frame.size.width - rectWidth)/2 + 180, y: (self.commonView.frame.size.height - rectHeight)/2 + 40))
        path.close()
        
        let dashLineConfig = [CGFloat(8.0), CGFloat(4.0), CGFloat(20.0), CGFloat(1.0)]
        path.setLineDash(dashLineConfig, count: 4, phase: 100)

        
        
        strokeWithPath(path)
        drawWithPath(path)
    }
    
    @IBAction func bezier6(_ sender: Any) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: (self.commonView.frame.size.width - rectWidth)/2, y: (self.commonView.frame.size.height - rectHeight)/2))
        path.addLine(to: CGPoint(x: (self.commonView.frame.size.width - rectWidth)/2 + 20, y: (self.commonView.frame.size.height - rectHeight)/2 + 90))
        path.addCurve(to: CGPoint.init(x: 100.0, y: 100.0), controlPoint1: CGPoint.init(x: 160.0, y: 120.0), controlPoint2: CGPoint.init(x: 90.0, y: 100.0))
        
        let dashLineConfig = [CGFloat(8.0), CGFloat(4.0)]
        path.setLineDash(dashLineConfig, count: 2, phase: 0)
        
        
        
        strokeWithPath(path)
        drawWithPath(path)
    }
    
    @IBAction func bezier7(_ sender: Any) {
    }
    
    @IBAction func bezier8(_ sender: Any) {
    }
    
    @IBAction func bezier9(_ sender: Any) {
        
    }
    

    func drawWithPath(_ path: UIBezierPath) -> Void {
        self.bezierView.bezierPath = path
        self.bezierView.setNeedsDisplay()
    }
    
    
    func strokeWithPath(_ path: UIBezierPath) -> Void {
        
        removeShapeLayer()
        
        let subLayer = CAShapeLayer()
        subLayer.lineWidth = 5.0
        subLayer.fillColor = UIColor.red.cgColor
        subLayer.strokeColor = UIColor.blue.cgColor
        
        subLayer.path = path.cgPath
        
        self.commonView.layer.addSublayer(subLayer)
        
    }
    
    func removeShapeLayer() -> Void {
        if let subLayers = self.commonView.layer.sublayers {
            for subLayer in subLayers {
                if subLayer is CAShapeLayer {
                    subLayer.removeFromSuperlayer()
                }
            }
        }
    }
    
    
    
    
    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
