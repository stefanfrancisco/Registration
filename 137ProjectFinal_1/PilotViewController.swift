//
//  ViewController.swift
//  ProjectManager_Registration
//
//  Created by Stefan Francisco on 11/17/16.
//  Copyright © 2016 Stefan Francisco. All rights reserved.
//

import UIKit

class PilotViewController: UIViewController {
    
    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet var ownABusiness: UIButton!
    @IBOutlet var workForABusiness: UIButton!
    
    @IBAction func dismiss(_ sender: Any) {
        getStartedView.isHidden = true;
        loginView.isHidden = false;
    }
    
    @IBOutlet var start: UIButton!
    
    @IBOutlet weak var getStartedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStartedView.isHidden = true;
        self.view.addBackground()
        start.layer.cornerRadius = 5
        start.layer.borderWidth = 2
        start.layer.borderColor = UIColor.black.cgColor
        ownABusiness.layer.cornerRadius = 5
        ownABusiness.layer.borderWidth = 2
        ownABusiness.layer.borderColor = UIColor.black.cgColor
        workForABusiness.layer.cornerRadius = 5
        workForABusiness.layer.borderWidth = 2
        workForABusiness.layer.borderColor = UIColor.black.cgColor
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getStarted(_ sender: UIButton) {
        loginView.isHidden = true;
        getStartedView.isHidden = false;
        
    }
    
    
    @IBOutlet var haveAnAccount: UIButton!
    
    
    
    
    
    
}

extension UIView {
    func addBackground() {
        // screen width and height:
        
        let imageViewBackground = UIImageView(frame: UIScreen.main.bounds)
        imageViewBackground.image = UIImage(named: "background")
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill
        
        self.addSubview(imageViewBackground)
        self.sendSubview(toBack: imageViewBackground)
    }}
