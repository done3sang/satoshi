//
//  MyApp.swift
//  satoshi
//
//  Created by xy on 20/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import Foundation
import UIKit

class MyApp {
    static var shared: MyApp = MyApp()
    
    func isNavigationBarHidden(_ rootViewController: UIViewController?) -> Bool {
        var result = false
        
        if let _ = rootViewController?.navigationController {
            if rootViewController!.isKind(of: HomeViewController.self) ||
                rootViewController!.isKind(of: MineViewController.self) {
                result = true
            }
        }
        
        return result
    }
    
    func loadStroyboard<V>(_ nibName: String) -> V {
        let sb = UIStoryboard(name: nibName, bundle: nil)
        return sb.instantiateViewController(withIdentifier: nibName) as! V
    }
    
    func gotoLogin(_ currentViewController: UIViewController, first: Bool = false) {
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
    
    func gotoRegister(_ currentViewController: UIViewController, first: Bool = false) {
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
    
    func gotoForgot(_ currentViewController: UIViewController, first: Bool = false) {
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
    
    func gotoProtocol(_ currentViewController: UIViewController) {
        let nibName = "Protocol"
        
        let sb = UIStoryboard(name: nibName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: nibName) as! ProtocolViewController
        currentViewController.hidesBottomBarWhenPushed = true
        currentViewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    func gotoWebsite(_ currentViewController: UIViewController, urlLink: String, title: String) {
        let vc = WebsiteViewController(urlString: urlLink)
        
        vc.title = title
        //viewController.loadUrl(urlLink)
        vc.hidesBottomBarWhenPushed = true
        currentViewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    func checkUserLogged(_ viewController: UIViewController, showAlert: Bool = true, okFunc: (() -> Void)? = nil, cancelFunc: (() -> Void)? = nil) -> Bool {
        if showAlert && !ProtocolUser.shared.logged {
            let alertController = UIAlertController(title: NSLocalizedString("userLoginTitle", comment: ""), message: NSLocalizedString("userLoginMessage", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: NSLocalizedString("userLoginCancel", comment: ""), style:UIAlertActionStyle.destructive) { (_ : UIAlertAction) in cancelFunc?() }
            let okAction = UIAlertAction(title: NSLocalizedString("userLoginOk", comment: ""), style: UIAlertActionStyle.default) { (_ : UIAlertAction) in
                if nil != okFunc {
                    okFunc!()
                } else {
                    MyApp.shared.gotoLogin(viewController, first: true)
                }
            }
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            viewController.present(alertController, animated: true)
        }
        
        return ProtocolUser.shared.logged
    }
    
    func languageStringByKey(_ stringKey: String) -> String {
        return NSLocalizedString(stringKey, comment: "From localized strings")
    }
}
