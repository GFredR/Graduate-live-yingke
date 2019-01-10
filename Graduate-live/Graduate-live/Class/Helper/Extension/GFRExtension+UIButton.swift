//
//  GFRExtension+UIButton.swift
//  Graduate-live
//
//  Created by 郭丰锐 on 2018/12/27.
//  Copyright © 2018 郭丰锐. All rights reserved.
//

import UIKit
extension UIButton{
    convenience init(type:UIButton.ButtonType,btnImage:String) {
        self.init()
        self.setImage(UIImage(named: btnImage), for: .normal)
    }
    
}
