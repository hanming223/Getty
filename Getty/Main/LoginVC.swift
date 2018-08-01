//
//  LoginVC.swift
//  Getty
//
//  Created by Han on 31/07/2018.
//  Copyright © 2018 Han. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoginVC: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginTapped(_ sender: Any) {
        
        if usernameTextField.text == "" || passwordTextField.text == ""{
            
            AppManager.shared.showAlert(msg: "All fields are required", activity: self)
            return
            
        }
        
        let params = ["username": usernameTextField.text,
                      "password": passwordTextField.text ] as! [String: String]
        
        AppManager.shared.showLoadingIndicator(view: self.view)
        
        APIManager.shared.login(params: params) { (error, response) in
            
            AppManager.shared.hideLoadingIndicator()
            
            if error == nil{
                print(response)
                if response["result"].stringValue == "success"{
                    
                    print(response["data"]["token"].stringValue)
                    AppManager.shared.showAlert(msg: "Login Success", activity: self)
                    
                }else{
                    //signup failure

                    AppManager.shared.showAlert(title: "Oops!", msg: response["msg"].stringValue, activity: self)
                    
                }
                
            }else{
                print(error!.localizedDescription)
                AppManager.shared.showAlert(msg: error!.localizedDescription, activity: self)
            }
            
        }
        
        
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
