//
//  LoginViewController.swift
//  satoshi
//
//  Created by xy on 18/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        passwordTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //if self.navigationController?.viewControllers.first == self
        //self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showPassword() {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @IBAction func fogetPassword() {
        MyApp.shared.gotoForgot(self)
    }
    
    @IBAction func gotoRegister() {
        MyApp.shared.gotoRegister(self)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let frame = textField.frame
        let offset = frame.origin.y + 32 - self.view.frame.height - 216
        
        UIView.beginAnimations("ResizeForKeyboard", context: nil)
        UIView.setAnimationDuration(0.3)
        if 0 < offset {
            self.view.frame = CGRect(x: 0, y: -offset, width: self.view.frame.width, height: self.view.frame.height)
        }
        UIView.commitAnimations()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
    }
}
