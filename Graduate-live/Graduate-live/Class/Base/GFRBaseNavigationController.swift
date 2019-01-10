//
//  GFRBaseNavigationController.swift
//  Graduate-live
//
//  Created by 郭丰锐 on 2019/1/3.
//  Copyright © 2019 郭丰锐. All rights reserved.
//

import UIKit

class GFRBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = UIColor(red: 0/255.0, green: 216/255.0, blue: 201/255.0, alpha: 1.0)
        self.navigationBar.tintColor = UIColor.white
//        self.navigationItem.title
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
