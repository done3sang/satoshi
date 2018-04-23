//
//  ProtocolViewController.swift
//  satoshi
//
//  Created by xy on 19/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import UIKit

class ProtocolViewController: UIViewController {
    @IBOutlet var protocolLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*
        let protocolLabel = UILabel()
        let protocolText = NSAttributedString(string: "協議條款及細則內容", attributes: [NSAttributedStringKey.foregroundColor : UIColor.black, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16.0)])
        protocolLabel.attributedText = protocolText
        protocolScrollView.addSubview(protocolLabel)*/
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.tintColor = UIColor.orange
        //self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
