//
//  HomeViewController.swift
//  satoshi
//
//  Created by xy on 13/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate, UIScrollViewDelegate {
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var searchBtn: UIButton!
    @IBOutlet var searchLogo: UIImageView!
    @IBOutlet var bannerScrollview: UIScrollView!
    @IBOutlet var bannerPageControl: UIPageControl!
    var searchBackgroudView: UIView?
    var searchEditing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchBar.delegate = self
        bannerScrollview.delegate = self
        initPageScroll()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func initPageScroll() {
        bannerScrollview.isPagingEnabled = true
        bannerScrollview.bounces = false
        let slidedImages = ["banner_0", "banner_1"]
        let contentSize = bannerScrollview.contentSize
        var xpos = CGFloat()
        for imageName in slidedImages {
            let imageView = UIImageView(image: UIImage(named: imageName))
            imageView.frame = CGRect(x: xpos * contentSize.width, y: 0,
                                     width: contentSize.width, height: contentSize.height)
            xpos = xpos + 1.0
            bannerScrollview.addSubview(imageView)
        }
        bannerPageControl.numberOfPages = slidedImages.count
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x/scrollView.contentSize.width)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x/scrollView.contentSize.width) + 1
        bannerPageControl.currentPage = page
    }
    
    @IBAction func pageAction(_ pageControl: UIPageControl) {
        let page = CGFloat(pageControl.currentPage - 1)
        bannerScrollview.setContentOffset(CGPoint(x: page * bannerScrollview.contentSize.width, y: 0), animated: true)
    }
    
    @IBAction func searchProduct() {
        if searchEditing {
            finishSearchEditing(searchBar)
        }
        
        let productName = searchBar.text!
        print("----search product \(productName)")
    }
    
    func beginSearchEditing() {
        searchBackgroudView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        searchBackgroudView?.backgroundColor = UIColor.black
        searchBackgroudView?.alpha = 0.5
        let tapGesture  = UITapGestureRecognizer(target: self, action: #selector(tapSearchBackground))
        searchBackgroudView?.addGestureRecognizer(tapGesture)
        self.view.addSubview(searchBackgroudView!)
        self.view.bringSubview(toFront: searchLogo)
        self.view.bringSubview(toFront: searchBar)
        self.view.bringSubview(toFront: searchBtn)
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
