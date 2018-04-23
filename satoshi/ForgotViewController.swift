//
//  ForgotViewController.swift
//  satoshi
//
//  Created by xy on 19/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import UIKit

class ForgotViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var accountTextField: UITextField!
    @IBOutlet var codeTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var againPasswordTextField: UITextField!
    @IBOutlet var getCodeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        accountTextField.delegate = self
        codeTextField.delegate = self
        passwordTextField.delegate = self
        againPasswordTextField.delegate = self
        
        getCodeButton.layer.borderColor = UIColor.clear.cgColor
        getCodeButton.layer.borderWidth = 5
        getCodeButton.layer.cornerRadius = 5
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.tintColor = UIColor.orange
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
    
    @IBAction func getCode() {
        
    }
    
    @IBAction func showPassword() {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @IBAction func showAgainPassword() {
        againPasswordTextField.isSecureTextEntry = !againPasswordTextField.isSecureTextEntry
    }
    
    @IBAction func resetPassword() {
        
    }
    
    @IBAction func gotoRegister() {
        MyApp.shared.gotoRegister(self)
    }
    
    @IBAction func gotoLogin() {
        MyApp.shared.gotoLogin(self)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let frame = textField.frame
        let offset = frame.origin.y + frame.height - self.view.frame.height + 216
        
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
        UIView.beginAnimations("ResizeForKeyboard", context: nil)
        UIView.setAnimationDuration(0.3)
        if 0 > self.view.frame.origin.y {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }
        UIView.commitAnimations()
    }
}
