//
//  RegisterViewController.swift
//  satoshi
//
//  Created by xy on 19/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet var accountTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var againPasswordTextField: UITextField!
    @IBOutlet var readButton: UIButton!
    
    var protocolReaded = true
    
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
    
    @IBAction func showAgainPassword() {
        againPasswordTextField.isSecureTextEntry = !againPasswordTextField.isSecureTextEntry
    }
    
    @IBAction func registerUser() {
        
    }
    
    @IBAction func readProtocol() {
        protocolReaded = !protocolReaded
        readButton.setTitle(protocolReaded ? "是": "不是", for: .normal)
    }
    
    @IBAction func showProtocol() {
        GotoStoryboard.gotoProtocol(currentviewController: self)
    }
    
    @IBAction func gotoLogin() {
        GotoStoryboard.gotoLogin(currentviewController: self)
    }
}
