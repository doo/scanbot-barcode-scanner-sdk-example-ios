//
//  ManualDataParser.swift
//  ScanbotSDK Examples
//
//  Created by Rana Sohaib on 25.10.24.
//

import UIKit
import ScanbotBarcodeScannerSDK

func parseDataManually() {
    
    // Some barcode raw string.
    let rawBarcodeString = "..."

    // Instantiate the parser.
    let parser = SBSDKBarcodeDocumentParser(acceptedFormats: [.swissQr])

    // Run the parser and check the result.
    if let document = parser.parseDocument(inputString: rawBarcodeString) {
        
        if let swissDocumentModel = SBSDKBarcodeDocumentModelSwissQR(document: document) {
            
            // Enumerate the Swiss QR code data fields.
            for field in document.fields {
                // Do something with the fields.
            }
        }
    }
}