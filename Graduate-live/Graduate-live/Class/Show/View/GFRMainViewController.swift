//
//  GFRMainViewController.swift
//  Graduate-live
//
//  Created by 郭丰锐 on 2018/12/27.
//  Copyright © 2018 郭丰锐. All rights reserved.
//

import UIKit

class GFRMainViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var contentScrollView: UIScrollView!
    
    lazy var dataList = ["关注","热门","附近"]
    
    lazy var topView:GFRMainTopView = GFRMainTopView(frame: CGRect(x: 0, y: 0, width: 200, height: 50), titleNames: dataList)
    
    
    
    let gfrFousView = GFRFocusViewController()
    let gfrHotView = GFRHotViewController()
    let gfrNearView = GFRNearViewController()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        topView.topCloser = {
            tag in
            let point:CGPoint = CGPoint(x: CGFloat(tag) * SCREEN_WIDTH, y: self.contentScrollView.contentOffset.y)
            
            self.contentScrollView.setContentOffset(point, animated: true)
        }
        contentScrollView.delegate = self
        initUI()
        
    }
    //设置主视图UI
    func initUI() -> Void {
        //设置导航栏左右按钮
        setNavUI()
        //添加子视图控制器
        setupChildViewControllers()
    }
    
    func setupChildViewControllers(){
        var vcNames = [gfrFousView, gfrHotView, gfrNearView]
//        var vcNames = ["GFRFocusViewController", "GFRHotViewController", "GFRNearViewController"]
        for i in 0..<vcNames.count {
            let vcName = vcNames[i]
            addChild(vcName)
        }
        

        //添加至main上
        self.contentScrollView.contentSize = CGSize(width: SCREEN_WIDTH * 3, height: 0)
        
        self.contentScrollView.contentOffset = CGPoint(x: SCREEN_WIDTH, y: 0)
        
        self.scrollViewDidEndScrollingAnimation(self.contentScrollView)
        
        
    }
    
    
    func setNavUI() {
        
        self.navigationItem.titleView = topView
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "global_search"), style: .done, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "title_button_more"), style: .done, target: nil, action: nil)
    }

    @objc func goBack(){
        
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let width:CGFloat = SCREEN_WIDTH
        let height:CGFloat = SCREEN_HEIGHT
        let offset:CGFloat = scrollView.contentOffset.x
        
        //获取索引值
        let idx:Int = Int(offset / width)
        //根据索引值返回vc引用
        //        print(self.children[idx])
        let vc:UIViewController = children[idx]
        
        //判断当前VC是否执行过viewDidLoad
        if vc.isViewLoaded {
            return
        }
        //设置子控制器view的大小
        vc.view.frame = CGRect(x: offset, y: 0, width: contentScrollView.frame.size.width, height: height)
        //添加字控制器view到scrollView
        scrollView.addSubview(vc.view)
    }
   
    //减速结束调用字控制器view的方法
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDidEndScrollingAnimation(scrollView)
    }
}
