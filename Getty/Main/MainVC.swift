//
//  MainVC.swift
//  Getty
//
//  Created by Han on 31/07/2018.
//  Copyright © 2018 Han. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        let loginVC = AppManager.shared.getViewControllerWithId(id: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(loginVC, animated: true)
        
    }
    
    
    @IBAction func registerTapped(_ sender: Any) {
        
        let signupVC = AppManager.shared.getViewControllerWithId(id: "SignupVC") as! SignupVC
        self.navigationController?.pushViewController(signupVC, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
