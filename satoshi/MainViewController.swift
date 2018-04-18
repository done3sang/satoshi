//
//  MainViewController.swift
//  satoshi
//
//  Created by xy on 12/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    var lastSelectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("-----tabBar = \(self.selectedIndex) == \(self.lastSelectedIndex)")
        if(3 == item.tag) {
            print("----- bar item 2 selected")
            if !ProtocolUser.shared.logged {
                self.selectedIndex = lastSelectedIndex
                
                let alertController = UIAlertController(title: "登陸提示", message: "您還未登錄，是否前往登陸？", preferredStyle: UIAlertControllerStyle.alert)
                let cancelAction = UIAlertAction(title: "不了，謝謝", style:UIAlertActionStyle.destructive) { (_ : UIAlertAction) in self.cancelLogin() }
                let okAction = UIAlertAction(title: "立即登陸", style: UIAlertActionStyle.default) { (_ : UIAlertAction) in self.gotoLogin() }
                alertController.addAction(cancelAction)
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
                return
            }
        }
        lastSelectedIndex = self.selectedIndex
    }
    
    private func cancelLogin() {
        
    }
    
    private func gotoLogin() {
        let loginSb = UIStoryboard(name: "Login", bundle: nil)
        let loginViewController = loginSb.instantiateViewController(withIdentifier: "Login")as! LoginViewController
        self.tabBarController?.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @IBAction func showMessage() {
        let alertController = UIAlertController(title: "Welcom to hello world", message: "Hello World", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive){ print("UIAction \($0.title!)") })
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ print("UIAction \($0.title!)") })
        self.present(alertController, animated: true, completion: nil)
    }
}

