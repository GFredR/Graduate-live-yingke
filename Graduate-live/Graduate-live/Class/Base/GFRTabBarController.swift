//
//  GFRTabBarController.swift
//  Graduate-live
//
//  Created by 郭丰锐 on 2018/12/26.
//  Copyright © 2018 郭丰锐. All rights reserved.
//

import UIKit
import SnapKit
class GFRTabBarController: UITabBarController {

    //懒加载创建直播按钮
    private lazy var cameraButton:UIButton = UIButton(type: UIButton.ButtonType.custom, btnImage: "tab_launch")
    var launchVC = GFRLiveViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addControllers()
        setCameraButton()
        
    }
    //设置直播按钮各类属性，定位，点击事件
    private func setCameraButton() -> Void {
        tabBar.addSubview(cameraButton)
        cameraButton.sizeToFit()
        cameraButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(tabBar.snp.centerX)
            make.centerY.equalTo(tabBar.snp.centerY).offset(-30)

        }

        
        cameraButton.addTarget(self, action: #selector(GFRTabBarController.clickCarmera), for: .touchUpInside)

    }
    //点击直播按钮的对应事件
    @objc private func clickCarmera() -> Void {
        present(launchVC, animated: true) {
            
        }
    }
    
    //重写视图viewWillAppear方法，并将直播按钮置于视图最上层，防止遮挡
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.bringSubviewToFront(cameraButton)
    tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor(red: 98/255.0, green: 213/255.0, blue: 201/255.0, alpha: 1.0)] , for: .selected)
        
    }

}
extension GFRTabBarController{
    //添加视图控制器
    private func addControllers() -> Void {
        addChildController(vc: GFRMainViewController(), title: "首页", imageNormal: "tab_live", selectedImage: "tab_live_p")

        addChildController(vc: GFRMeViewController(), title: "我", imageNormal: "tab_me", selectedImage: "tab_me_p")
    }
    //设置添加视图控制器方式，设置标签栏样式
    private func addChildController(vc: UIViewController, title: String, imageNormal: String,selectedImage:String){
        //设置导航栏文字
        vc.title = title
        //设置tabBarItem的图片，选用原始图片渲染方式，通过该方式，替代tintColor，达到原图色彩显示
        var image:UIImage = UIImage(named: imageNormal)!
        image = image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        vc.tabBarItem.image = image
        
        
        var selImage:UIImage = UIImage(named: selectedImage)!
        selImage = selImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        vc.tabBarItem.selectedImage = selImage
        //设置导航控制器的根视图控制器
        let gfrNav = GFRBaseNavigationController(rootViewController:vc)
        //将导航控制器添加到标签栏控制器
        addChild(gfrNav)
    }
}
