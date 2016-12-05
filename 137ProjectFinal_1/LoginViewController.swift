//
//  LoginViewController.swift
//  ProjectManager_Registration
//
//  Created by Stefan Francisco on 11/20/16.
//  Copyright © 2016 Stefan Francisco. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    let ref = FIRDatabase.database().reference(withPath: "pipeLine")
    
    @IBOutlet var errorLabel: UILabel!
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    
    @IBAction func submitData(_ sender: UIButton) {
            FIRAuth.auth()!.signIn(withEmail: userName.text!,
                                   password: passWord.text!) { user, error in
                                    if error == nil {
                                        // 3
                                        FIRAuth.auth()!.signIn(withEmail: self.userName.text!,password: self.passWord.text!)
                                    } else {
                                        if let error = FIRAuthErrorCode(rawValue: error!._code) {
                                        
                                        if(error == .errorCodeInvalidEmail || error == .errorCodeWeakPassword || error == .errorCodeUserNotFound || error == .errorCodeWrongPassword){
                                                                                        self.errorLabel.text = "Incorrect Password or Email"                                        }
                                            
                                    }

                                    }
        }
    }
    func buttonStyle(){
        if (userName.text?.isEmpty)! || (passWord.text?.isEmpty)!
        {
            submit.isEnabled = false
            
        }
        else
        {
            submit.isEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.buttonStyle), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        submit.isEnabled = false
        userName.keyboardType = .emailAddress
        userName.autocorrectionType = .no
        passWord.isSecureTextEntry = true
            self.hideKeyboardWhenTappedAround()
        errorLabel.textColor = UIColor.red
            }
    
    
}
