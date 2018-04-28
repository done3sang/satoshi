//
//  HttpHelper.swift
//  satoshi
//
//  Created by xy on 28/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import Foundation

class HttpHelper {
    public static var shared = HttpHelper()
    
    func get(path: String, success: @escaping ((_ result: String) -> ()),failure: @escaping ((_ error: Error) -> ())) {
        let url = URL(string: path.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, respond, error) in
            if nil == error {
                if let result = String(data:data!, encoding:.utf8){
                    success(result)
                }
            } else {
                failure(error!)
            }
        }
        dataTask.resume()
    }
    
    func post(path: String, params: [String : String],success: @escaping ((_ result: String) -> ()), failure: @escaping ((_ error: Error) -> ())) {
        let url = URL(string: path)
        let jsonData = JsonHelper.shared.toJson(params)
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        request.httpBody = jsonData.data(using: .utf8)
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, respond, error) in
            if nil == error {
                if let result = String(data: data!, encoding:.utf8){
                    success(result)
                }
            } else {
                failure(error!)
            }
        }
        dataTask.resume()
    }
}
