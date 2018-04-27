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

        self.title = MyApp.shared.languageStringByKey("mineTitle")
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func gotoRegister() {
        MyApp.shared.gotoRegister(self, first: true)
    }
    
    @IBAction func gotoLogin() {
        MyApp.shared.gotoLogin(self, first: true)
    }
    
    @IBAction func gotoOrder() {
        if MyApp.shared.checkUserLogged(self) {
            
        }
    }
    
    @IBAction func gotoAddress() {
        if MyApp.shared.checkUserLogged(self) {
            
        }
    }
    
    @IBAction func gotoMoney() {
        if MyApp.shared.checkUserLogged(self) {
            
        }
    }
    
    @IBAction func gotoDevice() {
        if MyApp.shared.checkUserLogged(self) {
            
        }
    }
    
    @IBAction func gotoAbout() {
        let nibName = "About"
        let sb = UIStoryboard(name: nibName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: nibName) as! AboutViewController
        
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        //vc.hidesBottomBarWhenPushed = false
    }
}
