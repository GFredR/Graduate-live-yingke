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
    
    var topCloser:(_ tag:Int) -> Void = {_ in
        
    }
    
    
    let lineView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
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
            
            titleBtn.tag = i
            
            titleBtn.frame = CGRect(x: CGFloat(i) * btnWidth, y: 0, width: btnWidth, height: btnHeight)
            
            titleBtn.addTarget(self, action: #selector(titleClick(button:)), for: .touchUpInside)
            self.addSubview(titleBtn)
            
            if i == 1{
                let high:CGFloat = 2.0
                let y:CGFloat = 40.0
                
                titleBtn.titleLabel?.sizeToFit()
                
                lineView.top = y
                lineView.width = (titleBtn.titleLabel?.width)!
                lineView.height = high

                
                lineView.centerX = titleBtn.centerX
                
                lineView.backgroundColor = UIColor.white
                
                self.addSubview(lineView)
            }
            
        }
        
    }
    @objc func titleClick(button:UIButton) -> Void {
        self.topCloser(button.tag)
        
        UIView.animate(withDuration: 0.5) {
            self.lineView.centerX = button.centerX
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
