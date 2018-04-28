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
        
        postTest()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func postTest() {
        let path = "http://open.hxintel.com/cms/querymedias"
        let params: [String : String] = [
            "Header" :"",
            "Function" : "",
            "Data" : ""
        ]
        
        HttpHelper.shared.post(path: path, params: params, success: { (result) in
            print("sucess = \(result)")
        }) { (err) in
            print("failed = \(err)")
        }
    }
    
    @IBAction func showMessage() {
        let alertController = UIAlertController(title: "Welcom to hello world", message: "Hello World", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive){ print("UIAction \($0.title!)") })
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ print("UIAction \($0.title!)") })
        self.present(alertController, animated: true, completion: nil)
    }
}

