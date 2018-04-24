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
        MyApp.shared.gotoWebsite(self,
                                 urlLink: MyApp.shared.languageStringByKey("introductionUrl"),
                                 title:MyApp.shared.languageStringByKey("introductionTitle"))
    }
    
    @IBAction func gotoContact() {
        MyApp.shared.gotoWebsite(self,
                                 urlLink: MyApp.shared.languageStringByKey("contactUrl"),
                                 title:MyApp.shared.languageStringByKey("contactTitle"))
    }
    
    @IBAction func gotoRecharge() {
        MyApp.shared.gotoWebsite(self,
                                 urlLink: MyApp.shared.languageStringByKey("rechargeProcedureUrl"),
                                 title:MyApp.shared.languageStringByKey("rechargeProcedureTitle"))
    }
    
    @IBAction func gotoFaq() {
        MyApp.shared.gotoWebsite(self,
                                 urlLink: MyApp.shared.languageStringByKey("faqUrl"),
                                 title:MyApp.shared.languageStringByKey("faqTitle"))
    }
    
    @IBAction func gotoPrivacy() {
        MyApp.shared.gotoWebsite(self,
                                 urlLink: MyApp.shared.languageStringByKey("privacyUrl"),
                                 title:MyApp.shared.languageStringByKey("privacyTitle"))
    }
    
    @IBAction func gotoClause() {
        MyApp.shared.gotoWebsite(self,
                                 urlLink: MyApp.shared.languageStringByKey("clauseUrl"),
                                 title:MyApp.shared.languageStringByKey("clauseTitle"))
    }
}
