//
//  ViewController.swift
//  BRNetworking
//
//  Created by BrammanandSoni on 03/20/2017.
//  Copyright (c) 2017 BrammanandSoni. All rights reserved.
//

import UIKit
import BRNetworking

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imageLoader = BRImageLoader()
        imageLoader.getJSONFromURL("https://httpbin.org/get") { (data, error) in
            
            if let repData = data, let utf8Text = String(data: repData, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

