//
//  AppManager.swift
//  Parikramas
//
//  Created by Admin on 10/12/17.
//  Copyright © 2017 Han. All rights reserved.
//

import UIKit
import MBProgressHUD
import Alamofire

let USER_DATA = "userdata"


final class AppManager {
    
    static let shared: AppManager = {
        return AppManager()
    }()
    
    //register
    var fullName: String!
    var userName: String!
    var password: String!
    var birthday: String!
    var male: Int!
    
    var loadingNotification: MBProgressHUD!
    
    private init() { }

    func showAlert(msg: String, activity: UIViewController) -> Void {
        let alert = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        activity.present(alert, animated: true, completion: nil)
    }

    func showAlert(title: String, msg: String, activity: UIViewController, complete:(()->Void)? = nil) -> Void
    {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { alert in
            complete?()
        }
        ))
        activity.present(alert, animated: true, completion: nil)
    }

    
    func showLoadingIndicator(view: UIView){
        loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
    }
    
    func hideLoadingIndicator(){
        loadingNotification.hide(animated: true)
    }
    
    func goToMainTabBar(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MainTab")
        UIApplication.shared.keyWindow?.rootViewController = controller
        
    }
    
    func setBorderToUIView(view: UIView, width: CGFloat, color: UIColor){
        
        view.layer.borderWidth = width
        view.layer.borderColor = color.cgColor
        
    }
    
    func makeCircleToUIView(view: UIView){
        
        view.layer.cornerRadius = view.frame.size.width / 2
        view.clipsToBounds = true
        
    }
    
    func getViewControllerWithId(id: String) -> Any{
        
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: id)
        
    }
    
    func convertImageToBase64(image: UIImage) -> String {
        let imageData = UIImagePNGRepresentation(image)!
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }
 
}

@IBDesignable extension UIView {
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
}

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
        }
    }
}

extension UIToolbar {
    
    func ToolbarPiker(mySelect : Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = false
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
}
