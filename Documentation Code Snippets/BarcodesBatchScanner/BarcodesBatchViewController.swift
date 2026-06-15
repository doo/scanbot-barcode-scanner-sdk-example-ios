//
//  BarcodesBatchViewController.swift
//  ScanbotSDK Examples
//
//  Created by Danil Voitenko on 20.05.21.
//

import UIKit
import ScanbotBarcodeScannerSDK

// This is a simple, empty view controller which acts as a container and delegate for the `SBSDKBarcodeScannerViewController`.
class BarcodesBatchViewController: UIViewController {

    // The instance of the scanner view controller.
    var scannerViewController: SBSDKBarcodeScannerViewController!

    // Property to indicate whether you want scanner to detect barcodes or not.
    var shouldDetectBarcodes = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // The barcode formats to be scanned.
        let formatsToDetect = SBSDKBarcodeFormats.all
        
        // Create an instance of `SBSDKBarcodeFormatCommonConfiguration`, passing the desired barcode formats.
        let formatConfiguration = SBSDKBarcodeFormatCommonConfiguration(formats: formatsToDetect)
        
        // Create an instance of `SBSDKBarcodeScannerConfiguration`, passing the format configuration.
        let configuration = SBSDKBarcodeScannerConfiguration(barcodeFormatConfigurations: [formatConfiguration])
        
        // Enable the barcode image extraction.
        configuration.returnBarcodeImage = true
        
        // Create the `SBSDKBarcodeScannerViewController` instance
        self.scannerViewController = SBSDKBarcodeScannerViewController(parentViewController: self,
                                                                       parentView: self.view,
                                                                       configuration: configuration,
                                                                       delegate: self)
        
        // Enable the view finder.
        self.scannerViewController.viewModel.isViewFinderEnabled = true
        
        // Set the finder's aspect ratio.
        self.scannerViewController.viewModel.viewFinderAspectRatio = SBSDKAspectRatio(width: 2, height: 1)
        
        // Set the finder's minimum insets.
        self.scannerViewController.viewModel.viewFinderMinimumInset = UIEdgeInsets(top: 100, left: 50, bottom: 100, right: 50)
        
        // Configure the view finder colors and line properties.
        self.scannerViewController.viewFinderLineColor = UIColor.red
        self.scannerViewController.viewModel.viewFinderBackgroundColor = UIColor.red.withAlphaComponent(0.1)
        self.scannerViewController.viewModel.viewFinderLineWidth = 2
        self.scannerViewController.viewModel.viewFinderLineCornerRadius = 8

        // Get current energy configuration.
        let energyConfig = self.scannerViewController.energyConfiguration

        // Set detection rate.
        energyConfig.detectionRate = 5
        
        // Set the energy configuration to apply it.
        self.scannerViewController.energyConfiguration = energyConfig
    }
}

// The implementation of the SBSDKBarcodeScannerViewControllerDelegate.
extension BarcodesBatchViewController: SBSDKBarcodeScannerViewControllerDelegate {
    
    func barcodeScannerController(_ controller: SBSDKBarcodeScannerViewController,
                                  didScanBarcodes codes: [SBSDKBarcodeItem]) {
        // Process the detected barcodes.
        
        for code in codes {
            // Get the source image.
            let sourceImage = try? code.sourceImage?.toUIImage()
        }
    }
    
    // Implement this function when you need to pause the detection (e.g. when showing results)
    func barcodeScannerControllerShouldScanBarcodes(_ controller: SBSDKBarcodeScannerViewController) -> Bool {
        return self.shouldDetectBarcodes
    }
    
    func barcodeScannerController(_ controller: SBSDKBarcodeScannerViewController,
                                  didFailScanning error: any Error) {
        // Handle the error.
        print("Error scanning barcode: \(error.localizedDescription)")
    }
}
