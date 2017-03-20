//
//  UIImageView+Extension.swift
//  BRNetworking
//
//  Created by Brammanand Soni on 3/20/17.
//  Copyright © 2017 Brammanand Soni. All rights reserved.
//

import Foundation

extension UIImageView {
    typealias DownloadCompletionBlock = (UIImage?, NSError?) -> Void
    
    func setImage(_ imageUrlString: String, placeholder: UIImage?, withCompletionBlock completionBlock: DownloadCompletionBlock?) {
        
        self.image = placeholder
        if let url = URL(string: imageUrlString) {
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config, delegate: nil, delegateQueue: OperationQueue.main)
            let request = URLRequest(url: url)
            
            let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                guard let imageData = data, error == nil else {
                    completionBlock?(nil, error as? NSError)
                    return
                }
                
                let image = UIImage(data: imageData)
                self.image = image
                completionBlock?(image, nil)
            })
            
            task.resume()
        }
    }
}
