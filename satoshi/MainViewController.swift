//
//  MainViewController.swift
//  satoshi
//
//  Created by xy on 12/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    //}
    
    @IBAction func showMessage() {
        let alertController = UIAlertController(title: "Welcom to hello world", message: "Hello World", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive){ print("UIAction \($0.title!)") })
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ print("UIAction \($0.title!)") })
        self.present(alertController, animated: true, completion: nil)
    }
}

