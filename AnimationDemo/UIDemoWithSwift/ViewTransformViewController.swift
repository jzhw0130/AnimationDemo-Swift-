//
//  ViewTransformViewController.swift
//  UIDemoWithSwift
//
//  Created by jing on 12/07/2017.
//  Copyright © 2017 jing. All rights reserved.
//

import UIKit

class ViewTransformViewController: UIViewController {

    let barHeight = CGFloat(200.0)
    
    lazy var firstView = {
        Void -> UIView in
        return UIView()
    }()
    
    
    lazy var secondView = {
        Void -> UIView in
        return UIView()
    }()
    
    
    func updateFirstViewConstraint(view: UIView) -> Void {
        let constraintWidth = NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.3, constant: 0.0)
        let constraintHeight = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0.15, constant: 0.0)
        
        let constraintX = NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: -50.0)
        let constraintY = NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 0.1, constant: view.tag == 1 ? barHeight - 100.0 : barHeight + 100.0)
        
        self.view.addConstraints([constraintWidth, constraintHeight, constraintX, constraintY])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        firstView.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "po3")!)
        firstView.tag = 1
        firstView.translatesAutoresizingMaskIntoConstraints = false
        
        secondView.backgroundColor = UIColor.red
        secondView.tag = 2
        secondView.translatesAutoresizingMaskIntoConstraints = false
        
            
        self.view.addSubview(firstView)
        self.view.addSubview(secondView)
        
        updateFirstViewConstraint(view: firstView)
        updateFirstViewConstraint(view: secondView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func trans1(_ sender: Any) {

        UIView.animate(withDuration: 0.5) {
            self.firstView.transform = self.firstView.transform.translatedBy(x: CGFloat(0.0), y: CGFloat(50.0))
            self.secondView.transform = self.secondView.transform.rotated(by: CGFloat(Float.pi/3))
        }
    }
    
    @IBAction func trans2(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.firstView.transform = self.firstView.transform.translatedBy(x: CGFloat(0.0), y: CGFloat(-50.0))
            self.secondView.transform = self.secondView.transform.rotated(by: CGFloat(-Float.pi/3))
        }
    }
    
    @IBAction func trans3(_ sender: Any) {
        var nub: Int = 0
        let stepAngle = Float.pi/5
        let stepScale = Float(0.95)
        let stepXY = Float(2.0)
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (timer) in
            switch nub {
            case 0..<50:
                self.smallWithScale(stepScale, angle: stepAngle, xy: stepXY)
            case 50..<100:
                self.bigWithScale(stepScale, angle: stepAngle, xy: stepXY)
            default:
                nub = -1
                break
            }
            nub += 1
        }
    }
    
    @IBAction func trans4(_ sender: Any) {
        var nub: Int = 0
        let stepAngle = Float.pi/5
        let stepScale = Float(0.95)
        let stepXY = Float(2.0)
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (timer) in
            switch nub {
            case 0..<50:
                self.firstView.transform = self.firstView.transform.scaledBy(x: CGFloat(stepScale), y: CGFloat(stepScale))
            case 50..<100:
                self.firstView.transform = self.firstView.transform.rotated(by: CGFloat(stepAngle))
            case 100..<150:
                self.firstView.transform = self.firstView.transform.translatedBy(x: CGFloat(stepXY), y: CGFloat(stepXY))
            case 150..<200:
                self.firstView.transform = self.firstView.transform.translatedBy(x: CGFloat(-stepXY), y: CGFloat(-stepXY))
            case 200..<250:
                self.firstView.transform = self.firstView.transform.rotated(by: CGFloat(-stepAngle))
            case 250..<300:
                self.firstView.transform = self.firstView.transform.scaledBy(x: CGFloat(1/stepScale), y: CGFloat(1/stepScale))
            default:
                nub = -1
                break
            }
            nub += 1
        }
    }
    
    
    @IBAction func trans5(_ sender: Any) {
        var nub: Int = 0
        let stepAngle = Float.pi/5
        let stepScale = Float(0.95)
        let stepXY = Float(2.0)
        
        var totalAngle = stepAngle
        var totalScale = stepScale
        var totalXY = stepXY
        
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (timer) in
            switch nub {
            case 0..<50:
                self.firstView.transform = CGAffineTransform(translationX: CGFloat(totalXY), y: CGFloat(totalXY)).scaledBy(x: CGFloat(totalScale), y: CGFloat(totalScale)).rotated(by: CGFloat(totalAngle))
                self.secondView.transform = CGAffineTransform(translationX: CGFloat(totalXY), y: CGFloat(totalXY)).scaledBy(x: CGFloat(totalScale), y: CGFloat(totalScale)).rotated(by: CGFloat(totalAngle))
                totalAngle += stepAngle
                totalXY += stepXY
                totalScale *= stepScale
            case 50..<100:
                self.firstView.transform = CGAffineTransform(translationX: CGFloat(totalXY), y: CGFloat(totalXY)).scaledBy(x: CGFloat(totalScale), y: CGFloat(totalScale)).rotated(by: CGFloat(totalAngle))
                self.secondView.transform = CGAffineTransform(translationX: CGFloat(totalXY), y: CGFloat(totalXY)).scaledBy(x: CGFloat(totalScale), y: CGFloat(totalScale)).rotated(by: CGFloat(totalAngle))
                totalAngle -= stepAngle
                totalXY -= stepXY
                totalScale /= stepScale
            default:
                nub = -1
                totalAngle = stepAngle
                totalXY = stepXY
                totalScale = stepScale
                break
            }
            nub += 1
            
        }
    }
    
    
    
    func smallWithScale(_ scale: Float, angle: Float, xy: Float) -> Void {
        
        self.firstView.transform = self.firstView.transform.translatedBy(x: CGFloat(xy), y: CGFloat(xy)).scaledBy(x: CGFloat(scale), y: CGFloat(scale)).rotated(by: CGFloat(angle))

        self.secondView.transform = self.secondView.transform.translatedBy(x: CGFloat(xy), y: CGFloat(xy)).scaledBy(x: CGFloat(scale), y: CGFloat(scale)).rotated(by: CGFloat(angle))
    }
    
    func bigWithScale(_ scale: Float, angle: Float, xy: Float) -> Void {

        self.firstView.transform = self.firstView.transform.rotated(by: 0 - CGFloat(angle)).scaledBy(x: CGFloat(1.0/scale), y: CGFloat(1.0/scale)).translatedBy(x: CGFloat(0-xy), y: CGFloat(0-xy))
        self.secondView.transform = self.secondView.transform.rotated(by: 0 - CGFloat(angle)).scaledBy(x: CGFloat(1.0/scale), y: CGFloat(1.0/scale)).translatedBy(x: CGFloat(0-xy), y: CGFloat(0-xy))

    }
    
    
    
    @IBAction func trans6(_ sender: Any) {
   
    }
    
    

    @IBAction func trans7(_ sender: Any) {

    }
    
    
    @IBAction func trans8(_ sender: Any) {

    }
    
    
    @IBAction func trans9(_ sender: Any) {
        self.firstView.transform = CGAffineTransform.identity
        self.secondView.transform = CGAffineTransform.identity
    }
    
    
    @IBAction func trans10(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
