//
//  LoginViewController.swift
//  satoshi
//
//  Created by xy on 18/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.tintColor = UIColor.orange
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showPassword() {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @IBAction func fogetPassword() {
        GotoStoryboard.gotoForgot(currentviewController: self)
    }
    
    @IBAction func gotoRegister() {
        GotoStoryboard.gotoRegister(currentviewController: self)
    }
}
