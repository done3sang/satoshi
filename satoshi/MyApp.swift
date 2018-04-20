//
//  MyApp.swift
//  satoshi
//
//  Created by xy on 20/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import Foundation

class MyApp {
    open class func checkUserLogged(showAlert: Bool = true) -> Bool {
        if showAlert && !ProtocolUser.shared.logged {
            
        }
        
        return false
    }
}
