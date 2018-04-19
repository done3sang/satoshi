//
//  CartViewController.swift
//  satoshi
//
//  Created by xy on 13/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let attr = [NSAttributedStringKey.foregroundColor: UIColor.orange]
        tabBarItem.setTitleTextAttributes(attr, for: UIControlState.selected)
        
        self.title = "購物車"
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !ProtocolUser.shared.logged {
            let alertController = UIAlertController(title: "登陸提示", message: "您還未登錄，是否前往登陸？", preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: "不了，謝謝", style:UIAlertActionStyle.destructive) { (_ : UIAlertAction) in self.cancelLogin() }
            let okAction = UIAlertAction(title: "立即登陸", style: UIAlertActionStyle.default) { (_ : UIAlertAction) in self.gotoLogin() }
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
            return
        }
    }
    
    private func cancelLogin() {
        
    }
    
    private func gotoLogin() {
        let nibName = "Login"
        let sb = UIStoryboard(name: nibName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: nibName) as! LoginViewController
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
