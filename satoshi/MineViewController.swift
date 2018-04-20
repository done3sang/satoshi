//
//  MineViewController.swift
//  satoshi
//
//  Created by xy on 13/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let attr = [NSAttributedStringKey.foregroundColor: UIColor.orange]
        tabBarItem.setTitleTextAttributes(attr, for: UIControlState.selected)
        
        self.navigationController?.tabBarItem?.setTitleTextAttributes(attr, for: UIControlState.selected)
        
        self.title = "我的"
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func gotoRegister() {
        let nibName = "Register"
        let sb = UIStoryboard(name: nibName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: nibName) as! RegisterViewController
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    
    @IBAction func gotoLogin() {
        let nibName = "Login"
        let sb = UIStoryboard(name: nibName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: nibName) as! LoginViewController
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    
    @IBAction func gotoOrder() {
        print("gotoOrder")
    }
    
    @IBAction func gotoAddress() {
        print("gotoAddress")
    }
    
    @IBAction func gotoMoney() {
        print("gotoMoney")
    }
    
    @IBAction func gotoDevice() {
        print("gotoDevice")
    }
    
    @IBAction func gotoAbout() {
        print("gotoAbout")
    }
}
