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

        
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        let vc = AppManager.shared.getViewControllerWithId(id: "MyPartyAddVC") as! MyPartyAddVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
