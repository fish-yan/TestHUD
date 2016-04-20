//
//  ViewController.swift
//  TestHUD
//
//  Created by 薛焱 on 16/4/19.
//  Copyright © 2016年 薛焱. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var someView: UIView!
    var replicatorLayer = CAReplicatorLayer()
    var instanceLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        replicatorLayer.frame = someView.bounds
        replicatorLayer.instanceColor = UIColor.grayColor().CGColor
        someView.layer.addSublayer(replicatorLayer)
        
        let layerWidth:CGFloat = 10.0;
        let midX = CGRectGetMidX(someView.bounds) - layerWidth / 2
        instanceLayer.frame = CGRectMake(midX, 0.0, layerWidth, layerWidth)
        instanceLayer.backgroundColor = UIColor.whiteColor().CGColor
        instanceLayer.cornerRadius = 5.0
        replicatorLayer.addSublayer(instanceLayer)
        replicatorLayer.instanceDelay = CFTimeInterval(1.0 / 12.0)
        replicatorLayer.instanceCount = 12
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(M_PI * 2) / 12, 0.0, 0.0, 1.0)
        
        addAnimation()
    }
    func addAnimation() {
        let faderAnimation = CABasicAnimation(keyPath: "opacity")
        faderAnimation.fromValue = 1.0
        faderAnimation.toValue = 0.0
        instanceLayer.opacity = 0.0
        
        let scale = CABasicAnimation(keyPath: "transform.scale")
        scale.fromValue = 2.0
        scale.toValue = 0.0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [faderAnimation, scale]
        animationGroup.duration = 1
        animationGroup.repeatCount = Float(Int.max)
        
        instanceLayer.addAnimation(animationGroup, forKey: "fader")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

