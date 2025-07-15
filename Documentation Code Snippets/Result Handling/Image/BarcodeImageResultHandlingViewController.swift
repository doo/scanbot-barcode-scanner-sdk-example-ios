//
//  BarcodeImageResultHandlingViewController.swift
//  ScanbotSDK Examples
//
//  Created by Rana Sohaib on 15.07.25.
//

import Foundation
import ScanbotBarcodeScannerSDK

class BarcodeImageResultHandlingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the `SBSDKBarcodeScanner` instance.
        let scanner = SBSDKBarcodeScanner()
        
        let image = UIImage(named: "test_image")!
        
        // Run the scanner passing the image.
        let result = scanner.scan(from: image)
        
        // Handle the result.
        result?.barcodes.forEach({ barcode in
            handle(barcode: barcode)
        })
    }
    
    // Handle the resulting barcode item's image.
    func handle(barcode: SBSDKBarcodeItem) {
        
        // Retrieve the barcode image.
        let image = barcode.sourceImage
        
        // Since the image is of type `SBSDKImageRef`, it provides some useful operations.
        // e.g
        
        // Convert to UIImage.
        let uiImage = image?.toUIImage()
        
        // Information about the stored image.
        let info = image?.info()
        
        // Save the image.
        let success = image?.saveImage(path: "<path_to_save_at>",
                                       options: SBSDKSaveImageOptions(quality: 70, encryptionMode: .disabled))
    }
}
