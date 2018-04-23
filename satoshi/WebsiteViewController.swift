//
//  WebsiteViewController.swift
//  satoshi
//
//  Created by xy on 23/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import UIKit
import WebKit

class WebsiteViewController: UIViewController {
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(webView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadUrl(_ urlString: String) {
        webView?.load(NSURLRequest(url:NSURL.init(string:urlString)! as URL) as URLRequest)
    }
}
