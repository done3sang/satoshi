//
//  JsonHelper.swift
//  satoshi
//
//  Created by xy on 28/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import Foundation

class JsonHelper {
    public static let shared = JsonHelper()
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    func toJson<T:Codable>(_ obj: T) -> String {
        let data = try! self.encoder.encode(obj)
        let str = String(data:data,encoding:.utf8)!
        
        return str
    }
    
    func toObject<T:Codable>(_ data: String) -> T{
        let obj = try! self.decoder.decode(T.self, from: data.data(using: .utf8)!)
        return obj
    }
    
    func getData(_ str: String) -> Data {
        return str.data(using: .utf8)!
    }
    
    func getJson(_ data: Data) -> String {
        return String(data:data, encoding:.utf8)!
    }
}
