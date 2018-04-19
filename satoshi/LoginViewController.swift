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
        let nibName = "Forgot"
        if let navigationController = self.navigationController {
            for viewController in navigationController.viewControllers {
                if viewController.isKind(of: ForgotViewController.self) {
                    navigationController.popToViewController(viewController, animated: true)
                    return
                }
            }
        }
        
        let sb = UIStoryboard(name: nibName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: nibName) as! ForgotViewController
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        //self.hidesBottomBarWhenPushed = false
    }
    
    @IBAction func gotoRegister() {
        if let navigationController = self.navigationController {
            for viewController in navigationController.viewControllers {
                if viewController.isKind(of: RegisterViewController.self) {
                    navigationController.popToViewController(viewController, animated: true)
                    return
                }
            }
        }
        
        let sb = UIStoryboard(name: "Register", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "Register") as! RegisterViewController
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        //self.hidesBottomBarWhenPushed = false
    }
}
