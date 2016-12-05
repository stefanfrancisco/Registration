//
//  CEORegisterViewController.swift
//  ProjectManager_Registration
//
//  Created by Stefan Francisco on 11/18/16.
//  Copyright © 2016 Stefan Francisco. All rights reserved.
//

import UIKit
import Firebase

class EmployeeRegister2ViewController: UIViewController {
    
    
    
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet var code: UITextField!
    @IBOutlet var eMailLabel: UILabel!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var eMail: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet var userName: UITextField!
    @IBOutlet var passWord: UITextField!
    
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet weak var submit: UIButton!
    
    @IBAction func submitData(_ sender: UIButton) {
        let firstname = firstName.text!
        let lastname = lastName.text!
        let email = eMail.text!
        let companyy = company.text!
        let username = userName.text!
        let password = passWord.text!
        let key = code.text!
        
        let ref2 = FIRDatabase.database().reference(withPath: companyy)
        
        FIRAuth.auth()!.createUser(withEmail: email,
                                   password: password) { user, error in
                                     if let error = FIRAuthErrorCode(rawValue: error!._code) {
                                        
                                        if(error == .errorCodeInvalidEmail){
                                            self.eMailLabel.textColor = UIColor.red
                                            self.eMail.textColor = UIColor.red
                                            self.errorLabel.text = "Invalid email"
                                        }
                                        else if(error == .errorCodeEmailAlreadyInUse){
                                            self.errorLabel.text = "Email is already in use"
                                        }
                                        else if (error == .errorCodeWeakPassword){
                                            self.passWord.textColor = UIColor.red
                                            self.errorLabel.text = "Password requires at least 6 characters"
                                        }

                                        
                                    }
 
        }
        
        ref2.child(key).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if snapshot.hasChildren(){
               self.code.textColor = UIColor.red
            }else{
                let newUser = User(firstName: firstname, lastName: lastname, email: email, userName: username, passWord: password, company: companyy, key: key)
                
                let newUserRef = ref2.child(key)
                newUserRef.setValue(newUser.toAnyObject())
            }
            
            
        })
        
        
    }
    
    
    
    func buttonStyle(){
        if (firstName.text?.isEmpty)! || (lastName.text?.isEmpty)! || (eMail.text?.isEmpty)! || (company.text?.isEmpty)! || (userName.text?.isEmpty)!
            
        {
            submit.isEnabled = false
            
        }
        else
        {
            submit.isEnabled = true
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    override
    func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(EmployeeRegister2ViewController.buttonStyle), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        submit.isEnabled = false
        errorLabel.textColor = UIColor.red
        code.autocorrectionType = .no
        code.keyboardType = .numberPad
    
        eMail.autocorrectionType = .no
        eMail.keyboardType = .emailAddress
        
        firstName.autocorrectionType = .no
        firstName.autocapitalizationType = .words
        lastName.autocorrectionType = .no
        lastName.autocapitalizationType = .words
        
        company.autocorrectionType = .no
        company.autocapitalizationType = .words
        
        userName.autocorrectionType = .no
        
        passWord.autocorrectionType = .no
        passWord.isSecureTextEntry = true
         self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
