//
//  DraggableImageView.swift
//  Tinder
//
//  Created by Yuichi Kuroda on 10/14/15.
//  Copyright © 2015 Yuichi Kuroda. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var imageView: UIImageView!
  
  var image: UIImage? {
    get { return imageView.image }
    set { imageView.image = newValue }
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    initSubviews()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initSubviews()
  }
  
  func initSubviews() {
    // standard initialization logic
    let nib = UINib(nibName: "DraggableImageView", bundle: nil)
    nib.instantiateWithOwner(self, options: nil)
    contentView.frame = bounds
    addSubview(contentView)
      
    // custom initialization logic
  }

  
}
