//
//  AboutViewController.swift
//  satoshi
//
//  Created by xy on 23/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gotoIntroduction() {
        MyApp.shared.gotoWebsite(self, urlLink: "http://m.gogowifi.hk/Public/content.html?ID=5", title:"1")
    }
    
    @IBAction func gotoContact() {
        MyApp.shared.gotoWebsite(self, urlLink: "http://m.gogowifi.hk/Public/content.html?ID=6", title:"1")
    }
    
    @IBAction func gotoRecharge() {
        MyApp.shared.gotoWebsite(self, urlLink: "http://m.gogowifi.hk/Public/content.html?ID=19", title:"1")
    }
    
    @IBAction func gotoFaq() {
        MyApp.shared.gotoWebsite(self, urlLink: "http://m.gogowifi.hk/Public/content.html?ID=7", title:"1")
    }
    
    @IBAction func gotoPrivacy() {
        MyApp.shared.gotoWebsite(self, urlLink: "http://m.gogowifi.hk/Public/content.html?ID=9", title:"1")
    }
    
    @IBAction func gotoClause() {
        MyApp.shared.gotoWebsite(self, urlLink: "http://m.gogowifi.hk/Public/content.html?ID=10", title:"1")
    }
}
