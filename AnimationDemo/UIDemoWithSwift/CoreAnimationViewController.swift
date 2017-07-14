//
//  CoreAnimationViewController.swift
//  UIDemoWithSwift
//
//  Created by jing on 14/07/2017.
//  Copyright © 2017 jing. All rights reserved.
//

import UIKit

class CoreAnimationViewController: UIViewController {

    @IBOutlet weak var hatImage: UIImageView!
    
    @IBOutlet weak var bkView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //position              CGPoint
    //position.x            CGFloat
    //position.y            CGFloat
    //transform.scale       CGFloat  equal .x + .y + .z
    //transform.scale.x     CGFloat
    //transform.scale.y     CGFloat
    //transform.scale.z     invalid
    //transform.translation     CGSize   equal .x + .y
    //transform.translation.x   CGFloat
    //transform.translation.y   CGFloat
    //transform.translation.z   invalid
    //transform.rotation        Float.pi  equal  .z
    //transform.rotation.x      Float.pi
    //transform.rotation.y      Float.pi
    //transform.rotation.z      Float.pi
    //shadowOffset              CGSize
    //shadowOpacity             Float(0-1)
    //shadowRadius              Float
    //shadowColor               CGColor
    //opacity                   Float(0-1)
    //cornerRadius              Float
    //borderWidth               Float
    //contents                  CGImage
    @IBAction func ca1(_ sender: Any) {
        
        let borderAnimation = baseAniamtionWithPath("borderWidth",  fromValue: nil, toValue: 5.0)
        let xAnimation = baseAniamtionWithPath("position.x", fromValue: nil, toValue: 115.0)
        let yAnimation = baseAniamtionWithPath("position.y", fromValue: nil, toValue: 175.0)
        let opacityAnimation = baseAniamtionWithPath("opacity", fromValue: nil, toValue: 0.4)
        
        runAniamtion(animation: borderAnimation, xAnimation, yAnimation, opacityAnimation)
    }

    @IBAction func ca2(_ sender: Any) {
        let xAnimation = baseAniamtionWithPath("transform.translation.x",  fromValue: nil, toValue: 50.0)
        let yAnimation = baseAniamtionWithPath("transform.translation.y", fromValue: nil, toValue: -100.0)
        let xScaleAnimation = baseAniamtionWithPath("transform.scale.x",  fromValue: nil, toValue: 0.8)
        let yScaleAnimation = baseAniamtionWithPath("transform.scale.y", fromValue: nil, toValue: 0.8)
        let conerAnimation = baseAniamtionWithPath("cornerRadius", fromValue: nil, toValue: 40.0)
        let xRotationAnimation = baseAniamtionWithPath("transform.rotation.x",  fromValue: nil, toValue: Float.pi/3)
        let yRotationAnimation = baseAniamtionWithPath("transform.rotation.y",  fromValue: nil, toValue: Float.pi/6)
        
        runAniamtion(animation:  xAnimation, yAnimation, xScaleAnimation, yScaleAnimation, conerAnimation, xRotationAnimation, yRotationAnimation)
    }

    @IBAction func ca3(_ sender: Any) {
        let xRotationAnimation = baseAniamtionWithPath("transform.rotation",  fromValue: -Float.pi/3, toValue: Float.pi/3)
        let xScaleAnimation = baseAniamtionWithPath("transform.scale",  fromValue: nil, toValue: 0.4)
        runRepeatAniamtion(animation:xRotationAnimation,  xScaleAnimation)
    }
    
    @IBAction func ca4(_ sender: Any) {
        let xRotationAnimation = baseAniamtionWithPath("transform.rotation",  fromValue: 0, toValue: Float.pi * 2)
        runRepeatAniamtion(animation:xRotationAnimation)
    }
    
    
    @IBAction func ca5(_ sender: Any) {
        let frameAnimation = frameAnimationWithPoints(keyPath: "position", point: CGPoint(x: 150, y: 150), CGPoint(x: 50, y: 200), CGPoint(x: 200, y: 300), CGPoint(x: 150, y: 250))
        let xRotationAnimation = baseAniamtionWithPath("transform.rotation",  fromValue: 0, toValue: Float.pi * 20)
        
        runAniamtion(animation: frameAnimation, xRotationAnimation)
    }
    
    @IBAction func ca6(_ sender: Any) {
        let path = CGMutablePath()
        path.addEllipse(in: CGRect(x: 100, y: 200, width: 100, height: 100))
        let frameAnimation = frameAnimationWithPath(keyPath: "position", path: path as CGPath)
        
        runRepeatAniamtion(animation: frameAnimation)
    }
    
    @IBAction func ca7(_ sender: Any) {
        
        bkView.layer.removeAllAnimations()
        hatImage.layer.removeAllAnimations()
    }
    
    
    func baseAniamtionWithPath(_ keyPath: String, fromValue: Any?, toValue: Any) -> CAAnimation {
        
        let animation = CABasicAnimation(keyPath: keyPath)
        
        animation.fromValue = fromValue
        animation.toValue  = toValue
        
        return animation
    }
    
    func frameAnimationWithPoints(keyPath: String, point: CGPoint...) -> CAAnimation {
        let animation = CAKeyframeAnimation(keyPath: keyPath)
        
        animation.values = point
        animation.calculationMode = kCAAnimationPaced
        
        return animation
    }
    
    func frameAnimationWithPath(keyPath: String, path: CGPath) -> CAAnimation {
        let animation = CAKeyframeAnimation(keyPath: keyPath)
        
        animation.path = path
        animation.calculationMode = kCAAnimationPaced
        
        return animation
    }
    
    
    func runAniamtion(duration: Double = 2, animation: CAAnimation...) -> Void {
        
        let animateGroup = CAAnimationGroup()
        animateGroup.animations = animation
        
        animateGroup.duration = duration
        animateGroup.isRemovedOnCompletion = false
        animateGroup.fillMode = kCAFillModeForwards
        
        hatImage.layer.add(animateGroup, forKey: nil)
    }
    
    func runRepeatAniamtion(duration: Double = 2, repeatCount: Float = 100, animation: CAAnimation...) -> Void {
        
        let animateGroup = CAAnimationGroup()
        animateGroup.animations = animation
        
//        animateGroup.autoreverses = true
        animateGroup.duration = duration
        animateGroup.repeatCount = repeatCount
//        animateGroup.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        hatImage.layer.add(animateGroup, forKey: nil)
    }
    
    
    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
