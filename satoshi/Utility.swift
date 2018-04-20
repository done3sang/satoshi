//
//  Utility.swift
//  satoshi
//
//  Created by xy on 16/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import Foundation
import UIKit

final class Utility {
    open class func scaleImage(image: UIImage, newSize: CGSize) -> UIImage {
        let imageSize = image.size
        let width = imageSize.width
        let height = imageSize.height
        let widthFactor = newSize.width/width
        let heightFactor = newSize.height/height
        let scaleFactor = widthFactor < heightFactor ? widthFactor: heightFactor
        let scaledWidth = width * scaleFactor
        let scaledHeight = height * scaleFactor
        let scaledSize = CGSize(width: scaledWidth, height: scaledHeight)
        
        UIGraphicsBeginImageContext(scaledSize)
        image.draw(in: CGRect(x: 0, y: 0, width: scaledWidth, height: scaledHeight))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()!
        //UIGraphicsEndImageContext()
        
        return scaledImage
    }
    
    open class func scaleImageWithWidthFactor(image: UIImage, newSize: CGSize) -> UIImage {
        let imageSize = image.size
        let width = imageSize.width
        let height = imageSize.height
        let widthFactor = newSize.width/width
        let scaleFactor = widthFactor
        let scaledWidth = width * scaleFactor
        let scaledHeight = height * scaleFactor
        let scaledSize = CGSize(width: scaledWidth, height: scaledHeight)
        
        UIGraphicsBeginImageContext(scaledSize)
        image.draw(in: CGRect(x: 0, y: 0, width: scaledWidth, height: scaledHeight))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()!
        //UIGraphicsEndImageContext()
        
        return scaledImage
    }
    
    open class func scaleImageWithoutFactor(image: UIImage, newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        //UIGraphicsEndImageContext()
        return scaledImage
    }
    
    open class func navigationImage(_ rect: CGRect) -> UIImage {
        /*let context = UIGraphicsGetCurrentContext()
        let startX = rect.origin.x + rect.width
        let startY = rect.origin.y + rect.height/2.0
        
        context?.move(to: CGPoint(x: startX, y: startY))
        context?.addLine(to: rect.origin)
        context?.addLine(to: CGPoint(x: rect.origin.x, y: rect.origin.y + rect.height))
        context?.closePath()
        
        context?.drawPath(using: CGPathDrawingMode.fillStroke)
 */
        
        let startX = rect.origin.x + rect.width
        let startY = rect.origin.y + rect.height/2.0
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 1.0)
        
        let context = UIGraphicsGetCurrentContext()
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: startX, y: startY))
        path.addLine(to: rect.origin)
        path.addLine(to: CGPoint(x: rect.origin.x, y: rect.origin.y + rect.height))
        context?.addPath(path)
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.setLineWidth(5)
        context?.move(to: CGPoint(x: startX, y: startY))
        context?.addLine(to: rect.origin)
        context?.addLine(to: CGPoint(x: rect.origin.x, y: rect.origin.y + rect.height))
        context?.strokePath()
 
        let navigationImage =  UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        return navigationImage
    }
}
