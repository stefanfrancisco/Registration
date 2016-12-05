//
//  CEORegisterViewController.swift
//  137ProjectFinal_1
//
//  Created by Stefan Francisco on 12/5/16.
//  Copyright © 2016 Stefan Francisco. All rights reserved.
//

import UIKit
import Firebase
class CEORegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.textColor = UIColor.red
        
        eMail.autocorrectionType = .no
        eMail.keyboardType = .emailAddress
        
        firstName.autocorrectionType = .no
        firstName.autocapitalizationType = .words
        lastName.autocorrectionType = .no
        lastName.autocapitalizationType = .words
        
        companyName.autocorrectionType = .no
        companyName.autocapitalizationType = .words
        
        userName.autocorrectionType = .no
        
        passWord.autocorrectionType = .no
        passWord.isSecureTextEntry = true
        self.hideKeyboardWhenTappedAround()

    }
    @IBOutlet var errorLabel: UILabel!
    @IBAction func dismiss(_ sender: Any) {
          dismiss(animated: true, completion: nil)
    }
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var eMail: UITextField!
    @IBOutlet var companyName: UITextField!
    @IBOutlet var numberOfEmployees: UITextField!
    
    @IBOutlet var userName: UITextField!
    @IBOutlet var passWord: UITextField!
    @IBAction func nextData(_ sender: UIButton) {
        let firstname = firstName.text!
        let lastname = lastName.text!
        let email = eMail.text!
        let username = userName.text!
        let password = passWord.text!
        let company = companyName.text!
        let number = Int(numberOfEmployees.text!)!
        let ref = FIRDatabase.database().reference(fromURL: "https://pipeline-106f9.firebaseio.com/")
        let ref2 = FIRDatabase.database().reference(withPath: company)
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.hasChild(company){
                self.errorLabel.text = "Company already exists."
                self.errorLabel.textColor = UIColor.red
                self.companyName.textColor = UIColor.red
            }else{
                for _ in 0...number {
                    let newUserRef = ref2.child(String(Int(arc4random())))
                    newUserRef.setValue("null")
                    let newUser = User(firstName: firstname, lastName: lastname, email: email, userName: username, passWord: password, company: company, key: "CEO")
                    
                    let newUserRef2 = ref2.child("CEO")
                    newUserRef2.setValue(newUser.toAnyObject())
                }
            }
            
            
        })
        

 

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   }
