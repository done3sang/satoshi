//
//  ProtocolUser.swift
//  satoshi
//
//  Created by xy on 18/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import Foundation
import UIKit

class ProtocolUser: NSObject {
    static var shared: ProtocolUser = ProtocolUser()
    static var count = 0
    
    var logged = false
    
    override init() {
        super.init()
        ProtocolUser.count += 1
    }
}
