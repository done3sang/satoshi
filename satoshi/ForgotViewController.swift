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
    @IBOutlet var newPasswordButton: UIButton!
    @IBOutlet var confirmPasswordButton: UIButton!
    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        accountTextField.resignFirstResponder()
        codeTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        againPasswordTextField.resignFirstResponder()
    }
    
    @IBAction func getCode() {
        
    }
    
    @IBAction func showPassword() {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        newPasswordButton.setImage(UIImage(named: passwordTextField.isSecureTextEntry ? "password_open": "password_close"), for: .normal)
    }
    
    @IBAction func showAgainPassword() {
        againPasswordTextField.isSecureTextEntry = !againPasswordTextField.isSecureTextEntry
        confirmPasswordButton.setImage(UIImage(named: againPasswordTextField.isSecureTextEntry ? "password_open": "password_close"), for: .normal)
    }
    
    @IBAction func resetPassword() {
        print("resetPassword = ", accountTextField.text!, codeTextField.text!,
              passwordTextField.text!, againPasswordTextField.text!)
    }
    
    @IBAction func gotoRegister() {
        MyApp.shared.gotoRegister(self)
    }
    
    @IBAction func gotoLogin() {
        MyApp.shared.gotoLogin(self)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let frame = textField.frame
        let offset = frame.origin.y + frame.height - self.view.frame.height + 220
        
        UIView.beginAnimations("ResizeForKeyboard", context: nil)
        UIView.setAnimationDuration(0.3)
        if 0 < offset {
            self.view.frame = CGRect(x: 0, y: -offset, width: self.view.frame.width, height: self.view.frame.height)
        }
        UIView.commitAnimations()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        switch textField {
        case accountTextField:
            codeTextField.becomeFirstResponder()
            
        case codeTextField:
            passwordTextField.becomeFirstResponder()
            
        case passwordTextField:
            againPasswordTextField.becomeFirstResponder()
            
        default:
            resetPassword()
        }
        
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
