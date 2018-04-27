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
    var urlString: String = ""
    
    init(urlString: String) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        self.view.addSubview(webView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadUrl(urlString)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadUrl(_ urlString: String) {
        webView?.load(NSURLRequest(url:NSURL(string:urlString)! as URL) as URLRequest)
    }
}
