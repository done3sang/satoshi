//
//  RegisterViewController.swift
//  satoshi
//
//  Created by xy on 19/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var accountTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var againPasswordTextField: UITextField!
    @IBOutlet var readButton: UIButton!
    @IBOutlet var passwordButton: UIButton!
    @IBOutlet var againPasswordButton: UIButton!
    
    var protocolReaded = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        accountTextField.delegate = self
        passwordTextField.delegate = self
        againPasswordTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if MyApp.shared.isNavigationBarHidden(self.navigationController?.topViewController) {
            self.navigationController?.isNavigationBarHidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        passwordTextField.resignFirstResponder()
        againPasswordTextField.resignFirstResponder()
    }
    
    @IBAction func showPassword() {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        passwordButton.setImage(UIImage(named: passwordTextField.isSecureTextEntry ? "password_open": "password_close"), for: .normal)
    }
    
    @IBAction func showAgainPassword() {
        againPasswordTextField.isSecureTextEntry = !againPasswordTextField.isSecureTextEntry
        againPasswordButton.setImage(UIImage(named: againPasswordTextField.isSecureTextEntry ? "password_open": "password_close"), for: .normal)
    }
    
    @IBAction func registerUser() {
        print("registerUser = ", accountTextField.text!, passwordTextField.text!, againPasswordTextField.text!)
    }
    
    @IBAction func readProtocol() {
        protocolReaded = !protocolReaded
        readButton.setTitle(protocolReaded ? "是": "不是", for: .normal)
    }
    
    @IBAction func showProtocol() {
        MyApp.shared.gotoProtocol(self)
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
            passwordTextField.becomeFirstResponder()
            
        case passwordTextField:
            againPasswordTextField.becomeFirstResponder()
            
        default:
            registerUser()
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
