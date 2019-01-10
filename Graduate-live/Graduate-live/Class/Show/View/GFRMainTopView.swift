//
//  GFRMainTopView.swift
//  Graduate-live
//
//  Created by 郭丰锐 on 2019/1/10.
//  Copyright © 2019 郭丰锐. All rights reserved.
//

import UIKit
import YYKit

class GFRMainTopView: UIView {

    init(frame:CGRect,titleNames:[String]) {
        super.init(frame: frame)
        let btnWidth:CGFloat = self.width / CGFloat(titleNames.count)
        
        let btnHeight:CGFloat = self.height
        
        
        
        for i in 0..<titleNames.count {
            let titleBtn:UIButton = UIButton(type: UIButton.ButtonType.custom)
            
            let vcName = titleNames[i]
            //设置按钮文字
            titleBtn.setTitle(vcName, for: .normal)
            //
            titleBtn.setTitleColor(UIColor.white, for: .normal)
            //
            titleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            
            titleBtn.frame = CGRect(x: CGFloat(i) * btnWidth, y: 0, width: btnWidth, height: btnHeight)
            
            titleBtn.addTarget(self, action: #selector(titleClick(button:)), for: .touchUpInside)
            self.addSubview(titleBtn)
        }
        
    }
    @objc func titleClick(button:UIButton) -> Void {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
