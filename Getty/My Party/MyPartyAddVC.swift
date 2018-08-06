//
//  MyPartyAddVC.swift
//  Getty
//
//  Created by Han on 05/08/2018.
//  Copyright © 2018 Han. All rights reserved.
//

import UIKit

class MyPartyAddVC: UIViewController {

    @IBOutlet weak var partyNameTextField: UITextField!
    @IBOutlet weak var partyDescriptionTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var endTimeTextField: UITextField!
    @IBOutlet weak var privateSwitch: UISwitch!
    @IBOutlet weak var partyAddressTextField: UITextField!
    @IBOutlet weak var guestInviteSwitch: UISwitch!
    @IBOutlet weak var guestInviteCountTextField: UITextField!
    @IBOutlet weak var byobSwitch: UISwitch!
    
    
    @IBOutlet weak var inviteApproveCheckBox: Checkbox!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        inviteApproveCheckBox.borderStyle = .square
        inviteApproveCheckBox.checkmarkStyle = .tick
        inviteApproveCheckBox.increasedTouchRadius = 10
//        inviteApproveCheckBox.checkboxBackgroundColor = UIColor.init(rgb: 0x6A6D7B)
        inviteApproveCheckBox.borderWidth = 0.5
        inviteApproveCheckBox.checkmarkColor = THEME_COLOR
        inviteApproveCheckBox.checkmarkSize = 0.8
        inviteApproveCheckBox.checkedBorderColor = UIColor.gray
        inviteApproveCheckBox.uncheckedBorderColor = UIColor.gray
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
