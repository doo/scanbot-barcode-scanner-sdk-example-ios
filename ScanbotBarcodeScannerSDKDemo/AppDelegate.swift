//
//  AppDelegate.swift
//  ScanbotBarcodeScannerSDKDemo
//
//  Created by Yevgeniy Knizhnik on 04.12.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

import UIKit
import ScanbotBarcodeScannerSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        
        // Setup the default license failure handler for demo purposes. In case of expired license or expired trial period it will present an alert dialog.
        // See also the ScanbotSDK.setLicenseFailureHandler(..) to setup a custom handler.
        ScanbotSDK.setupDefaultLicenseFailureHandler()
        
        ScanbotSDK.setLoggingEnabled(true)
        
        // TODO: Set your license key here
        //ScanbotSDK.setLicense("YOUR_SCANBOT_SDK_LICENSE_KEY")
        
        return true
    }
}

