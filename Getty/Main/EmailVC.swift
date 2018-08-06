//
//  EmailVC.swift
//  Getty
//
//  Created by Han on 01/08/2018.
//  Copyright © 2018 Han. All rights reserved.
//

import UIKit
import SwiftyJSON
import PhoneNumberKit

class EmailVC: UIViewController {

    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: PhoneNumberTextField!
    
    var tap1: UITapGestureRecognizer!
    var tap2: UITapGestureRecognizer!
    
    var isPhonenumber: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        phoneView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        emailView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        phoneView.backgroundColor = UIColor.white
        emailView.backgroundColor = UIColor.clear
        phoneLabel.textColor = UIColor.init(rgb: 0xAA4111)
        emailLabel.textColor = UIColor.white
        
        tap1 = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        phoneView.addGestureRecognizer(tap1)
        
        tap2 = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        emailView.addGestureRecognizer(tap2)

    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        
        if sender == tap1{
            phoneView.backgroundColor = UIColor.white
            emailView.backgroundColor = UIColor.clear
            phoneLabel.textColor = UIColor.init(rgb: 0xAA4111)
            emailLabel.textColor = UIColor.white
            
            emailTextField.placeHolderColor = UIColor.white
            
            if emailTextField.isFirstResponder == true{
                emailTextField.resignFirstResponder()
                phoneTextField.becomeFirstResponder()
            }
            
            emailTextField.isHidden = true
            phoneTextField.isHidden = false
            
            isPhonenumber = true
            
        }else{
            phoneView.backgroundColor = UIColor.clear
            emailView.backgroundColor = UIColor.white
            emailLabel.textColor = UIColor.init(rgb: 0xAA4111)
            phoneLabel.textColor = UIColor.white
            
            emailTextField.placeHolderColor = UIColor.white
            
            if phoneTextField.isFirstResponder == true{
                phoneTextField.resignFirstResponder()
                emailTextField.becomeFirstResponder()
            }
            
            emailTextField.isHidden = false
            phoneTextField.isHidden = true
            
            isPhonenumber = false
            
        }
        
    }
    
    @IBAction func continueTapped(_ sender: Any) {
        
        var number: String!
        
        if isPhonenumber == true{
            
            if phoneTextField.text?.first != "+"{
                AppManager.shared.showAlert(msg: "Please enter valid phone number.", activity: self)
                return
            }
            
            do{
                let phoneNumber = try PhoneNumberKit().parse(phoneTextField.text!)
                
                number = "+" + String(phoneNumber.countryCode) + String(phoneNumber.nationalNumber)
                print(number)
                
                if AppManager.shared.isValidEmail(testStr: number){
                    AppManager.shared.showAlert(msg: "Please enter valid phone number.", activity: self)
                    return
                }

            }catch{
                AppManager.shared.showAlert(msg: "Please enter valid phone number.", activity: self)
                return
            }
            
            
            
        }else{
            
            if AppManager.shared.isValidEmail(testStr: emailTextField.text!) == false{
                AppManager.shared.showAlert(msg: "Please enter valid email address.", activity: self)
                return
            }
            
        }
        
        var params = ["full_name": AppManager.shared.fullName,
                      "password": AppManager.shared.password,
                      "c_password": AppManager.shared.password,
                      "birthday": AppManager.shared.birthday,
                      "username": AppManager.shared.userName ] as [String: Any]
        
        if isPhonenumber == true{
            params["phone_number"] = number
        }else{
            params["email"] = emailTextField.text
        }
        
        if AppManager.shared.gender >= 0{
            params["gender"] = AppManager.shared.gender
        }
        
        AppManager.shared.showLoadingIndicator(view: self.view)
        
        APIManager.shared.signup(params: params) { (error, response) in
            
            AppManager.shared.hideLoadingIndicator()
            
            if error == nil{
                print(response)
                if response["error"] == JSON.null{
                    
                    print(response["success"]["token"].stringValue)
                    
                    UserDefaults.standard.setValue(true, forKey: IS_LOGGEDIN)
                    UserDefaults.standard.setValue(response["data"]["token"].stringValue, forKey: TOKEN)
                    
                    let homeNav = AppManager.shared.getViewControllerWithId(id: "HomeTab") as! UITabBarController
                    UIApplication.shared.keyWindow?.rootViewController = homeNav
                    
                }else{
                    //signup failure
                    
                    let msg = response["error"].dictionaryObject
                    
                    var errorMessage: String = ""
                    
                    print(msg!.values)
                    
                    for msgArray in msg!.values{
                        for msg in (msgArray as! [String]){
                            errorMessage += msg
                            errorMessage += "\n"
                        }
                    }
                    
                    print(errorMessage)
                    
                    AppManager.shared.showAlert(title: "Oops!", msg: errorMessage, activity: self)
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
