//
//  GenderVC.swift
//  Getty
//
//  Created by Han on 01/08/2018.
//  Copyright © 2018 Han. All rights reserved.
//

import UIKit

class GenderVC: UIViewController {

    @IBOutlet weak var skipButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    @IBAction func maleTapped(_ sender: Any) {
        AppManager.shared.male = 0
    }
    
    @IBAction func femaleTapped(_ sender: Any) {
        AppManager.shared.male = 1
    }
    
    @IBAction func skipTapped(_ sender: Any) {
        AppManager.shared.male = -1
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}


