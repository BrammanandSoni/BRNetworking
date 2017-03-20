//
//  BRImageLoader.swift
//  BRNetworking
//
//  Created by Brammanand Soni on 3/20/17.
//  Copyright © 2017 Brammanand Soni. All rights reserved.
//

import Foundation
import Alamofire

public class BRImageLoader {
    
    public init() {
        
    }
    
    public func loadImageOnImageView(_ imageView: UIImageView, imageUrlString string: String) {
        imageView.setImage(string, placeholder: nil, withCompletionBlock: nil)
    }
    
    public func getJSONFromURL(_ urlString: String, completionHandler: @escaping (Data?, Error?) -> Swift.Void) {
        Alamofire.request(urlString).response { response in
            completionHandler(response.data, response.error)
        }
    }
    
}
