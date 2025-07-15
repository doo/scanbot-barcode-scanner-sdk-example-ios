//
//  BarcodeResultHandlingViewController.swift
//  ScanbotSDK Examples
//
//  Created by Rana Sohaib on 15.07.25.
//

import Foundation
import ScanbotBarcodeScannerSDK

class BarcodeResultHandlingViewController: UIViewController {
    
    // The instance of the scanner view controller.
    var scannerViewController: SBSDKBarcodeScannerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the `SBSDKBarcodeScannerViewController` instance.
        self.scannerViewController = SBSDKBarcodeScannerViewController(parentViewController: self,
                                                                       parentView: self.view,
                                                                       configuration: .init(),
                                                                       delegate: self)
    }
}

extension BarcodeResultHandlingViewController: SBSDKBarcodeScannerViewControllerDelegate {
    
    func barcodeScannerController(_ controller: SBSDKBarcodeScannerViewController,
                                  didScanBarcodes codes: [SBSDKBarcodeItem]) {
        
        // Process result
        codes.forEach({ barcode in
            
            // Retrieve raw text
            print("Raw text: \(barcode.text)")
            
            // Raw text with extension
            print("Raw text with extension: \(barcode.textWithExtension)")
            
            // Some barcode formats are able to encode binary data. If a barcode contains binary data, it's provided as a list
            // of bytes in the rawBytes field.
            print("Raw bytes: \(barcode.rawBytes)")
            
            // Encoding information for the rawBytes field. Each element of this list covers some portion of the rawBytes array.
            print("Raw byte encodings: \(barcode.rawBytesEncodings)")
            
            // True if this is a 1D barcode that is printed upside-down, that is, the barcode was scanned right-to-left.
            print("Is Upside Down: \(barcode.isUpsideDown)")
            
            // The size score is a floating point value between 0 and 1 that represents the relative size of the barcode in the
            // input image.
            // Barcodes taking up a small portion of the input image will have a score close to 0, while barcodes that take a
            // large portion will have a score close to 1.
            print("Size Score: \(barcode.sizeScore)")
            
            // The index of the barcode to uniquely identify it.
            // In case of frame accumulation, the index remains the same across frames.
            print("Global index: \(barcode.globalIndex)")
            
            // Following properties are helpful to determine the position of the scanned barcode in the input image.
            print("Quad: \(barcode.quad)")
            print("Quad Normalized: \(barcode.quadNormalized)")
            print("Extended Quad: \(barcode.extendedQuad)")
            print("Extended Quad Normalized: \(barcode.extendedQuadNormalized)")
            
            // Also some use case specific properties. Please do read the inline documentation of these properties to not
            // miss some important details about different behavior depending on the configuration provided to the scanner.
            print("upcEanExtension: \(barcode.upcEanExtension)")
            print("isGS1Message: \(barcode.isGS1Message)")
            print("isGS1CompositePart: \(barcode.isGS1CompositePart)")
            print("dataBarStackSize: \(barcode.dataBarStackSize)")
        })
    }
}
