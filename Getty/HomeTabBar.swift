//
//  HomeTabBar.swift
//  Getty
//
//  Created by Han on 06/08/2018.
//  Copyright © 2018 Han. All rights reserved.
//

import UIKit

class HomeTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        layerGradient.colors = [UIColor.init(rgb: 0xFFA334), UIColor.init(rgb: 0xFFC856)]
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let layerGradient = CAGradientLayer()
        
        print(tabBar.bounds.width)
        print(tabBar.bounds.height)
        
        layerGradient.colors = [UIColor.red, UIColor.blue]
        layerGradient.startPoint = CGPoint(x: 0, y: 0.5)
        layerGradient.endPoint = CGPoint(x: 1, y: 0.5)
        layerGradient.frame = CGRect(x: 0, y: 0, width: tabBar.bounds.width, height: tabBar.bounds.height)
        tabBar.layer.addSublayer(layerGradient)
        

    }
    
    override func viewWillLayoutSubviews() {
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
