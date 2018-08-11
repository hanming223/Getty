//
//  MyPartyVC.swift
//  Getty
//
//  Created by Han on 05/08/2018.
//  Copyright © 2018 Han. All rights reserved.
//

import UIKit

class MyPartyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        var colors = [UIColor]()
        colors.append(UIColor.init(rgb: 0xFFA334))
        colors.append(UIColor.init(rgb: 0xFFC856))
        navigationController?.navigationBar.setGradientBackground(colors: colors)
        
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        let vc = AppManager.shared.getViewControllerWithId(id: "MyPartyAddVC") as! MyPartyAddVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
