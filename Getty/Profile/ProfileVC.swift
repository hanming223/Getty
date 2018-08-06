//
//  ProfileVC.swift
//  Getty
//
//  Created by Han on 06/08/2018.
//  Copyright © 2018 Han. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func logOutTapped(_ sender: Any) {
        
        UserDefaults.standard.setValue(false, forKey: IS_LOGGEDIN)
        
        let mainNav = AppManager.shared.getViewControllerWithId(id: "MainNav") as! UINavigationController
        UIApplication.shared.keyWindow?.rootViewController = mainNav
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
