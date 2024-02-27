//
//  BarcodeResult.swift
//  ScanbotBarcodeScannerSDKDemo
//
//  Created by Rana Sohaib on 26.02.24.
//  Copyright © 2024 doo GmbH. All rights reserved.
//

import ScanbotBarcodeScannerSDK

class BarcodeResult {
    
    let type: SBSDKBarcodeType
    let rawTextString: String
    let rawTextStringWithExtension: String
    let barcodeImage: UIImage?
    var rawBytes: Data?
    var formattedResult: SBSDKBarCodeScannerDocumentFormat?
    
    init(type: SBSDKBarcodeType,
         rawTextString: String,
         rawTextStringWithExtension: String,
         barcodeImage: UIImage? = nil,
         rawBytes: Data? = nil,
         formattedResult: SBSDKBarCodeScannerDocumentFormat? = nil) {
        
        self.type = type
        self.rawTextString = rawTextString
        self.rawTextStringWithExtension = rawTextStringWithExtension
        self.barcodeImage = barcodeImage
        self.rawBytes = rawBytes
        self.formattedResult = formattedResult
    }
}
