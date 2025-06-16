//
//  SceneDelegate.swift
//  ScanbotBarcodeScannerSDKDemo
//
//  Created by seifeddine bouzid on 16/6/2025.
//  Copyright © 2025 doo GmbH. All rights reserved.
//

import UIKit
import ScanbotBarcodeScannerSDK

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        // Setup the default license failure handler for demo purposes.
        // In case of expired license or expired trial period it will present an alert dialog.
        // See also the Scanbot.setLicenseFailureHandler(..) to setup a custom handler.
        Scanbot.setupDefaultLicenseFailureHandler()
        
        Scanbot.setLoggingEnabled(true)
        
        // TODO: Add the Scanbot Barcode SDK license key here.
        // Please note: The Scanbot Barcode SDK will run without a license key for one minute per session!
        // After the trial period is over all Scanbot SDK functions as well as the UI components will stop working.
        // You can get an unrestricted "no-strings-attached" 30 day trial license key for free.
        // Please submit the trial license form (https://scanbot.io/en/sdk/demo/trial) on our website by using
        // the app identifier (aka. bundle identifier) "io.scanbot.example.sdk.ios.barcode" of this example app
        // or of your own app (see "Bundle Identifier" in your Xcode project settings).
        //Scanbot.setLicense("YOUR_SCANBOT_SDK_LICENSE_KEY")
    }
}
