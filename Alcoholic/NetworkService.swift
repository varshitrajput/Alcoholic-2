//
//  NetworkService.swift
//  Duc Blog
//
//  Created by Duc Tran on 4/3/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import Foundation

class NetworkService
{
    lazy var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session: URLSession = URLSession(configuration: self.configuration)
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    typealias ImageDataHandler = ((Data) -> Void)
    
    func downloadImage(_ completion: @escaping ImageDataHandler)
    {
        let request = URLRequest(url: self.url)
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
            
            if error == nil {
                if let httpResponse = response as? HTTPURLResponse {
                    switch (httpResponse.statusCode) {
                    case 200:
                        if let data = data {
                            completion(data)
                        }
                    default:
                        print(httpResponse.statusCode)
                    }
                }
            } else {
                print("Error")
            }
        }) 
        
        dataTask.resume()
    }
}

extension NetworkService
{
    static func parseJSONFromData(_ jsonData: Data?) -> [String : AnyObject]?
    {
        if let data = jsonData {
            do {
                let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : AnyObject]
                return jsonDictionary
                
            } catch let error as NSError {
                print("error processing json data: \(error.localizedDescription)")
            }
        }
        
        return nil
    }
}




















