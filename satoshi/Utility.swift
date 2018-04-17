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
        
        return UIGraphicsGetImageFromCurrentImageContext()!
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
        
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    open class func scaleImageWithoutFactor(image: UIImage, newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
}
