//
//  ViewImageRefViewController.swift
//  ScanbotBarcodeScannerSDKDemo
//
//  Created by Mayank Patil on 07/01/26.
//  Copyright © 2026 doo GmbH. All rights reserved.
//

import UIKit
import ScanbotBarcodeScannerSDK

class ViewImageRefViewController: UIViewController {
    var imageRef :  SBSDKImageRef? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let imageView = UIImageView(frame: CGRect(x: 10,
                                                  y: 10,
                                                  width: view.frame.width - 10,
                                                  height: view.frame.height - 10))
        
        imageView.image = try! self.imageRef?.toUIImage()
        imageView.backgroundColor = UIColor.red
        self.view.addSubview(imageView)
        self.view.backgroundColor = UIColor.lightGray
    }
}
