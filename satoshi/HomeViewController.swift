//
//  HomeViewController.swift
//  satoshi
//
//  Created by xy on 13/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate, AutoPageControlDelegate, UITextFieldDelegate  {
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var searchLogo: UIImageView!
    @IBOutlet var bannerScrollView: UIScrollView!
    @IBOutlet var bannerPageControl: UIPageControl!
    @IBOutlet var mainScrollView: UIScrollView!
    @IBOutlet var buyWiFiButton: UIButton!
    @IBOutlet var buyTrafficButton: UIButton!
    @IBOutlet var mainStackView: UIStackView!
    
    var searchBackgroudView: UIView?
    var searchEditing = false
    var bannerPageScroll: AutoPageScroll?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let attr = [NSAttributedStringKey.foregroundColor: UIColor.orange]
        tabBarItem.setTitleTextAttributes(attr, for: UIControlState.selected)
        self.navigationController?.tabBarItem?.setTitleTextAttributes(attr, for: UIControlState.selected)
        self.title = MyApp.shared.languageStringByKey("homeTitle")
        
        searchBar.delegate = self
        initPageScroll()
        initMainScrollView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var contentRect = CGRect.zero
        for view in mainScrollView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        contentRect.size.height = contentRect.height
        mainScrollView.contentSize = CGSize(width: contentRect.size.width, height: contentRect.size.height)
    }
    
    private func initMainScrollView() {
        buyWiFiButton.imageView?.layer.borderWidth = 4
        buyWiFiButton.imageView?.layer.borderColor = UIColor.white.cgColor
        buyTrafficButton.imageView?.layer.borderWidth = 4
        buyTrafficButton.imageView?.layer.borderColor = UIColor.white.cgColor
    }
    
    private func initPageScroll() {
        bannerPageScroll = AutoPageScroll(scrollView: bannerScrollView, pageControl: bannerPageControl)
        bannerPageScroll?.delegate = self
        bannerPageScroll?.setNamedImages(images: ["banner1", "banner2"])
        bannerPageScroll?.startAnimating()
    }
    
    func pageClicked(pageNum: Int) {
        print("--------page click \(pageNum)")
    }
    
    private func searchProduct() {
        if searchEditing {
            finishSearchEditing(searchBar)
        }
        
        //let productName = searchBar.text!
    }
    
    func beginSearchEditing() {
        searchBackgroudView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        searchBackgroudView?.backgroundColor = UIColor.black
        searchBackgroudView?.alpha = 0.5
        let tapGesture  = UITapGestureRecognizer(target: self, action: #selector(tapSearchBackground))
        searchBackgroudView?.addGestureRecognizer(tapGesture)
        self.view.addSubview(searchBackgroudView!)
         self.view.bringSubview(toFront: searchBar)
        self.view.bringSubview(toFront: searchLogo)
    }
    
    @objc func tapSearchBackground() {
        endSearchEditing()
        finishSearchEditing(searchBar)
    }
    
    func endSearchEditing() {
        if let backView = searchBackgroudView {
            backView.removeFromSuperview()
            searchBackgroudView = nil
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        beginSearchEditing()
        searchEditing = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchEditing = false
        endSearchEditing()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        finishSearchEditing(searchBar)
        searchProduct()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        finishSearchEditing(searchBar)
    }
    
    private func finishSearchEditing(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
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
