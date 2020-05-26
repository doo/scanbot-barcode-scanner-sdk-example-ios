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
        
        // TODO: Add the Scanbot Barcode SDK license key here.
        // Please note: The Scanbot Barcode SDK will run without a license key for one minute per session!
        // After the trial period is over all Scanbot SDK functions as well as the UI components will stop working.
        // You can get an unrestricted "no-strings-attached" 30 day trial license key for free.
        // Please submit the trial license form (https://scanbot.io/sdk/trial.html) on our website by using
        // the app identifier (aka. bundle identifier) "io.scanbot.example.sdk.barcode.ios" of this example app
        // or of your own app (see "Bundle Identifier" in your Xcode project settings).
        //ScanbotSDK.setLicense("YOUR_SCANBOT_SDK_LICENSE_KEY")
        
        // trial license key, valid until 2020-06-26
        ScanbotSDK.setLicense(
        "UAgn+sPVU80cQAwgRmvVIuqKy4Ko6z" +
        "fs1/ndIlOTDLSv/QAeD73x7YlYePb9" +
        "Aj/4SOp1kCCpYSUXf0g81ssa0DrnWi" +
        "vzy8rs1OrFHPLEczgvLH71crnwJ+Ey" +
        "mOKCM7XNLjSn72KTXpowzpp6rc+QFL" +
        "QDv4EWkkAqp5ZKAIjcIDQpvzQbjscR" +
        "c2lLNaz+rBMwm0wNiQ8llo5XARAqIR" +
        "MnEffZ1TtxDbn0goa2XHvZdasX/MV5" +
        "UTPIgLlbchA744UhyLdRGW0Q1UkMGd" +
        "i3aTZZZXlPcl2qXgS3Z2Yj99XZQLlX" +
        "6ZSsFSi6RwThiX/o7KRCriXqvUfSb5" +
        "GSwEGngHpUmw==\nU2NhbmJvdFNESw" +
        "ppby5zY2FuYm90LmV4YW1wbGUuc2Rr" +
        "LmJhcmNvZGUuaW9zLjIKMTU5MzIxNT" +
        "k5OQo1MTIKMQ==\n")
        
        return true
    }
}

