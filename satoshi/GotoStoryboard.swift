//
//  GotoStoryboard.swift
//  satoshi
//
//  Created by xy on 20/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import UIKit

class GotoStoryboard {
    open class func loadStroyboard<V>(_ nibName: String) -> V {
        let sb = UIStoryboard(name: nibName, bundle: nil)
        return sb.instantiateViewController(withIdentifier: nibName) as! V
    }
    
    open class func gotoLogin(_ currentViewController: UIViewController, first: Bool = false) {
        let nibName = "Login"
        
        if !first {
            if let navigationController = currentViewController.navigationController {
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
        currentViewController.hidesBottomBarWhenPushed = true
        currentViewController.navigationController?.pushViewController(vc, animated: true)
        if first {
            currentViewController.hidesBottomBarWhenPushed = false
        }
    }
    
    open class func gotoRegister(_ currentViewController: UIViewController, first: Bool = false) {
        let nibName = "Register"
        
        if !first {
            if let navigationController = currentViewController.navigationController {
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
        currentViewController.hidesBottomBarWhenPushed = true
        currentViewController.navigationController?.pushViewController(vc, animated: true)
        if first {
            currentViewController.hidesBottomBarWhenPushed = false
        }
    }
    
    open class func gotoForgot(_ currentViewController: UIViewController, first: Bool = false) {
        let nibName = "Forgot"
        
        if !first {
            if let navigationController = currentViewController.navigationController {
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
        currentViewController.hidesBottomBarWhenPushed = true
        currentViewController.navigationController?.pushViewController(vc, animated: true)
        if first {
            currentViewController.hidesBottomBarWhenPushed = false
        }
    }
    
    open class func gotoProtocol(_ currentViewController: UIViewController) {
        let nibName = "Protocol"
        
        let sb = UIStoryboard(name: nibName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: nibName) as! ProtocolViewController
        currentViewController.hidesBottomBarWhenPushed = true
        currentViewController.navigationController?.pushViewController(vc, animated: true)
    }
}
