//
//  ViewController.swift
//  Tinder
//
//  Created by Yuichi Kuroda on 10/14/15.
//  Copyright © 2015 Yuichi Kuroda. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
  @IBOutlet weak var imageView: DraggableImageView!
  var initialCenterPointOfImageView: CGPoint!
  var rotation: CGFloat = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    setAnchorPoint(CGPoint(x: 1.0, y: 0.5), forView: self.view)
    
    imageView.image = UIImage(named: "ryan")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  var swipedOffScreen = false
  
  @IBAction func onSwipe(panGesture: UIPanGestureRecognizer) {
    
    switch panGesture.state {
    case .Began:
      initialCenterPointOfImageView = panGesture.locationInView(self.view)
      
    case .Changed:
      let translation = panGesture.translationInView(self.view)
      var transform = CATransform3DIdentity
      transform.m34 = 1.0 / 500.0
      
      imageView.center.x = initialCenterPointOfImageView.x + translation.x
      
      rotation = (45.degreesToRadians * translation.x) / (self.view.frame.width / 2)
      
      print("\(rotation)\n")
      transform = CATransform3DRotate(transform, rotation, 0, 0, 1)
      imageView.layer.transform = transform
      
      if translation.x > 50.0 {
        // Animate off right
        
      } else if translation.x < -50 {
        // Animate off left
        
      }
      
    case .Ended:
      
      
      if !swipedOffScreen {
        imageView.transform = CGAffineTransformIdentity
      }
      
      break
    default:
      break
    }
  }
  
}

/*      let animation = CABasicAnimation(keyPath: "transform")
animation.toValue = NSValue(CATransform3D: transform)
animation.duration = 3

transform = CATransform3DRotate(transform, 45.degreesToRadians, 1, 0, 0)

imageView.layer.transform = transform
imageView.layer.addAnimation(animation, forKey: "transform")*/

func setAnchorPoint(anchorPoint: CGPoint, forView view: UIView) {
  var newPoint = CGPointMake(view.bounds.size.width * anchorPoint.x, view.bounds.size.height * anchorPoint.y)
  var oldPoint = CGPointMake(view.bounds.size.width * view.layer.anchorPoint.x, view.bounds.size.height * view.layer.anchorPoint.y)
  
  newPoint = CGPointApplyAffineTransform(newPoint, view.transform)
  oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform)
  
  var position = view.layer.position
  position.x -= oldPoint.x
  position.x += newPoint.x
  
  position.y -= oldPoint.y
  position.y += newPoint.y
  
  view.layer.position = position
  view.layer.anchorPoint = anchorPoint
}

extension Int {
  var degreesToRadians : CGFloat {
    return CGFloat(self) * CGFloat(M_PI) / 180.0
  }
}