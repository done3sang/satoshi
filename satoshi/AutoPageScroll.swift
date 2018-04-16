//
//  AutoPageScroll.swift
//  satoshi
//
//  Created by xy on 13/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import Foundation
import UIKit

protocol AutoPageControlDelegate {
    func pageClicked(pageNum: Int)
}

class AutoPageScroll: NSObject, UIScrollViewDelegate {
    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    var namedImages: [String] = []
    var delegate: AutoPageControlDelegate?
    lazy var animeTimer: Timer? = nil
    
    init(scrollView: UIScrollView, pageControl: UIPageControl) {
        super.init()
        
        self.scrollView = scrollView
        self.pageControl = pageControl
        
        self.scrollView.isPagingEnabled = true
        self.scrollView.bounces = false
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.scrollsToTop = false
        self.scrollView.delegate = self
        
        self.pageControl.backgroundColor = UIColor.clear
        self.pageControl.currentPage = 0
        self.pageControl.addTarget(self, action: #selector(pageChanged), for: UIControlEvents.valueChanged)
    }
    
    func startAnimating() {
        if nil == animeTimer {
            animeTimer = Timer(timeInterval: 2, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
            RunLoop.main.add(animeTimer!, forMode: RunLoopMode.defaultRunLoopMode)
        }
    }
    
    func isAnimating() -> Bool {
        return nil != animeTimer
    }
    
    func stopAnimating() {
        if (animeTimer?.isValid)! {
            animeTimer?.invalidate()
            animeTimer = nil
        }
    }
    
    @objc func timerAction() {
        var nextPage = pageControl.currentPage + 1
        if nextPage >= namedImages.count {
            nextPage = 0
        }
        var rect = scrollView.frame
        rect.origin.x = rect.width * CGFloat(nextPage)
        rect.origin.y = 0
        //scrollView.scrollRectToVisible(rect, animated: true)
        
        let offsetX = CGFloat(nextPage) * scrollView.frame.width
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        pageControl.currentPage = nextPage
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x/scrollView.frame.width)
        pageControl.currentPage = page
    }
    
    @objc func pageChanged(_ sender: UIPageControl) {
        var frame = scrollView.frame
        frame.origin.x = frame.size.width * CGFloat(sender.currentPage)
        frame.origin.y = 0
        scrollView.scrollRectToVisible(frame, animated: true)
    }
    
    func setNamedImages(images: [String]) {
        if !namedImages.isEmpty {
            clear();
        }
        
        namedImages = images
        initialize()
    }
    
    func initialize() {
        pageControl.numberOfPages = namedImages.count
        pageControl.currentPage = 0
        
        for (seq, name) in namedImages.enumerated() {
            addImage(imageName: name, pageNum: seq)
        }
        
        scrollView.contentSize = CGSize(width: CGFloat(namedImages.count) * scrollView.frame.width, height: scrollView.frame.height)
    }
    
    func addImage(imageName: String, pageNum: Int) {
        let image = Utility.scaleImageWithoutFactor(image: UIImage(named: imageName)!, newSize: scrollView.frame.size)
        let imageView = UIImageView(image: image)
        let rect = CGRect(x: CGFloat(pageNum) * scrollView.frame.width, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
        imageView.frame = rect
        
        imageView.tag = pageNum
        imageView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        imageView.addGestureRecognizer(tapGesture)
        
        scrollView.addSubview(imageView)
    }
    
    @objc func tapImage(_ sender: UITapGestureRecognizer) {
        delegate?.pageClicked(pageNum: sender.view?.tag ?? 0)
    }
    
    func clear() {
        if !scrollView.subviews.isEmpty {
            scrollView.subviews.forEach() { $0.removeFromSuperview() }
        }
        
        animeTimer?.invalidate()
        
        namedImages = []
        pageControl.numberOfPages = 0
    }
}
