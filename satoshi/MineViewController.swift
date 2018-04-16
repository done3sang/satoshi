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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
