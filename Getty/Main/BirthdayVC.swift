//
//  BirthdayVC.swift
//  Getty
//
//  Created by Han on 01/08/2018.
//  Copyright © 2018 Han. All rights reserved.
//

import UIKit

class BirthdayVC: UIViewController {

    @IBOutlet weak var birthdayTextField: UITextField!
    var selectedDate: Date!
    
    var datePickerView: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func birthdayEditDidBegin(_ sender: Any) {
        
        datePickerView = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        (sender as! UITextField).inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(self.handleDatePicker), for: UIControlEvents.valueChanged)
        
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(self.dismissPicker))
        birthdayTextField.inputAccessoryView = toolBar
        
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        selectedDate = sender.date
    }
    
    @objc func dismissPicker() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        birthdayTextField.text = dateFormatter.string(from: datePickerView.date)
        
        birthdayTextField.resignFirstResponder()
        
    }
    
    @IBAction func continueTapped(_ sender: Any) {
        
        if birthdayTextField.text == ""{
            AppManager.shared.showAlert(msg: "Please enter birthday.", activity: self)
            return
        }
        
        AppManager.shared.birthday = birthdayTextField.text
        
        
    }
    
    @IBAction func onBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
