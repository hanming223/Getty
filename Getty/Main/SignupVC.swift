//
//  SignupVC.swift
//  Getty
//
//  Created by Han on 31/07/2018.
//  Copyright © 2018 Han. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmpasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func signupTapped(_ sender: Any) {
        
        if fullnameTextField.text == "" || usernameTextField.text == "" || passwordTextField.text == "" || confirmpasswordTextField.text == ""{
            AppManager.shared.showAlert(msg: "All fields are required.", activity: self)
            return
        }else{
            
            if passwordTextField.text != confirmpasswordTextField.text{
                AppManager.shared.showAlert(msg: "Password doesn't match.", activity: self)
                return
            }
            
        }
        
        
        AppManager.shared.showLoadingIndicator(view: self.view)
        
        let params = ["username": usernameTextField.text!]
        
        APIManager.shared.checkUsernameValidation(params: params) { (error, response) in
            
            if error == nil{

                if response["result"].stringValue == "exist"{
                    
                    AppManager.shared.showAlert(msg: "That username is aleady in use", activity: self)
                    return
                    
                }else{
                    
                    AppManager.shared.fullName = self.fullnameTextField.text
                    AppManager.shared.userName = self.usernameTextField.text
                    AppManager.shared.password = self.passwordTextField.text
                    
                    let birthdayVC = AppManager.shared.getViewControllerWithId(id: "BirthdayVC") as! BirthdayVC
                    self.navigationController?.pushViewController(birthdayVC, animated: true)
                    
                }
                
            }else{
                print(error!.localizedDescription)
            }
            
            AppManager.shared.hideLoadingIndicator()
            
        }
        
    }
    
    @IBAction func onBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
