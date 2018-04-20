//
//  GotoStoryboard.swift
//  satoshi
//
//  Created by xy on 20/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import UIKit

class GotoStoryboard {
    open class func gotoLogin(currentviewController: UIViewController, first: Bool = false) {
        let nibName = "Login"
        
        if !first {
            if let navigationController = currentviewController.navigationController {
                for viewController in navigationController.viewControllers {
                    if viewController.isKind(of: LoginViewController.self) {
                        navigationController.popToViewController(viewController, animated: true)
                        return
                    }
                }
            }
        }
        
        let sb = UIStoryboard(name: nibName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: nibName) as! LoginViewController
        currentviewController.hidesBottomBarWhenPushed = true
        currentviewController.navigationController?.pushViewController(vc, animated: true)
        if first {
            currentviewController.hidesBottomBarWhenPushed = false
        }
    }
    
    open class func gotoRegister(currentviewController: UIViewController, first: Bool = false) {
        let nibName = "Register"
        
        if !first {
            if let navigationController = currentviewController.navigationController {
                for viewController in navigationController.viewControllers {
                    if viewController.isKind(of: RegisterViewController.self) {
                        navigationController.popToViewController(viewController, animated: true)
                        return
                    }
                }
            }
        }
        
        let sb = UIStoryboard(name: nibName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: nibName) as! RegisterViewController
        currentviewController.hidesBottomBarWhenPushed = true
        currentviewController.navigationController?.pushViewController(vc, animated: true)
        if first {
            currentviewController.hidesBottomBarWhenPushed = false
        }
    }
    
    open class func gotoForgot(currentviewController: UIViewController, first: Bool = false) {
        let nibName = "Forgot"
        
        if !first {
            if let navigationController = currentviewController.navigationController {
                for viewController in navigationController.viewControllers {
                    if viewController.isKind(of: ForgotViewController.self) {
                        navigationController.popToViewController(viewController, animated: true)
                        return
                    }
                }
            }
        }
        
        let sb = UIStoryboard(name: nibName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: nibName) as! ForgotViewController
        currentviewController.hidesBottomBarWhenPushed = true
        currentviewController.navigationController?.pushViewController(vc, animated: true)
        if first {
            currentviewController.hidesBottomBarWhenPushed = false
        }
    }
    
    open class func gotoProtocol(currentviewController: UIViewController) {
        let nibName = "Protocol"
        
        let sb = UIStoryboard(name: nibName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: nibName) as! ProtocolViewController
        currentviewController.hidesBottomBarWhenPushed = true
        currentviewController.navigationController?.pushViewController(vc, animated: true)
    }
}
