//
//  BarcodeGeneralConfiguration.swift
//  ScanbotSDK Examples
//
//  Created by Rana Sohaib on 15.07.25.
//

import Foundation
import ScanbotBarcodeScannerSDK

class BarcodeGeneralConfiguration {
    
    func configIndividualSymbology() {
        
        // The barcode formats to be scanned.
        let formatsToDetect = [SBSDKBarcodeFormat.qrCode, SBSDKBarcodeFormat.aztec, SBSDKBarcodeFormat.code11]
        
        // Create an instance of `SBSDKBarcodeFormatCommonConfiguration`.
        let formatConfiguration = SBSDKBarcodeFormatCommonConfiguration(formats: formatsToDetect)
        
        // Create an instance of `SBSDKBarcodeScannerConfiguration`.
        let configuration = SBSDKBarcodeScannerConfiguration(barcodeFormatConfigurations: [formatConfiguration])
    }
    
    func configIndividualSymbologyAdvance() {
        
        // Create qrCode format configuration.
        let qrCodeFormatConfiguration = SBSDKBarcodeFormatQRCodeConfiguration(
            regexFilter: "",
            minimumSizeScore: 10,
            addAdditionalQuietZone: false,
            gs1Handling: .parse,
            strictMode: true,
            qr: true,
            microQr: false,
            rmqr: false
        )
        
        // Create code11 format configuration.
        let code11FormatConfiguration = SBSDKBarcodeFormatCode11Configuration(
            regexFilter: "",
            minimumSizeScore: 10,
            addAdditionalQuietZone: false,
            minimum1DQuietZoneSize: 6,
            stripCheckDigits: false,
            minimumTextLength: 1, maximumTextLength: 0,
            checksum: true
        )
        
        // Create an array of all the desired format configurations.
        let detectionFormatConfigurations = [qrCodeFormatConfiguration, code11FormatConfiguration]
        
        // Create an instance of `SBSDKBarcodeScannerConfiguration`.
        let configuration = SBSDKBarcodeScannerConfiguration(barcodeFormatConfigurations: detectionFormatConfigurations)
    }
    
    func configGroupedSymbology() {
        
        // The barcode formats to be scanned.
        
        // Common
        var formatsToDetect: [SBSDKBarcodeFormat]
        
        // Common barcodes.
        formatsToDetect = SBSDKBarcodeFormats.common
        
        // One-D barcodes.
        formatsToDetect = SBSDKBarcodeFormats.oned
        
        // Two-D barcodes.
        formatsToDetect = SBSDKBarcodeFormats.twod
        
        // Postal barcodes.
        formatsToDetect = SBSDKBarcodeFormats.postal
        
        // Pharma barcodes.
        formatsToDetect = SBSDKBarcodeFormats.pharma
        
        // All barcode formats
        formatsToDetect = SBSDKBarcodeFormats.all
        
        // Create an instance of `SBSDKBarcodeFormatCommonConfiguration`.
        let formatConfiguration = SBSDKBarcodeFormatCommonConfiguration(formats: formatsToDetect)
        
        // Create an instance of `SBSDKBarcodeScannerConfiguration`.
        let configuration = SBSDKBarcodeScannerConfiguration(barcodeFormatConfigurations: [formatConfiguration])
    }
    
    func configDocumentParsers() {
        
        // The barcode document formats to be scanned.
        let documentFormatsToDetect = [SBSDKBarcodeDocumentFormat.swissQr]
        
        // Get the supported barcode formats for the document formats set above.
        let barcodeFormats = SBSDKBarcodeDocumentFormat.supportedBarcodeFormats(for: documentFormatsToDetect)
        
        // Create an instance of `SBSDKBarcodeFormatCommonConfiguration`.
        let formatConfiguration = SBSDKBarcodeFormatCommonConfiguration(formats: barcodeFormats)
        
        // Create an instance of `SBSDKBarcodeScannerConfiguration`.
        let configuration = SBSDKBarcodeScannerConfiguration(barcodeFormatConfigurations: [formatConfiguration],
                                                             extractedDocumentFormats: documentFormatsToDetect)
    }
    
    func configRegularExpression() {
        
        // Configure the regex.
        // You can use `SBSDKBarcodeFormatCommonConfiguration` to create common barcode configuration which
        // provides a convenient way to configure common configurations for all desired formats.
        let commonConfiguration = SBSDKBarcodeFormatCommonConfiguration(
            regexFilter: "\\b[0-5]+\\b",
            minimumSizeScore: 0.0,
            addAdditionalQuietZone: false,
            minimum1DQuietZoneSize: 6,
            stripCheckDigits: false,
            minimumTextLength: 1,
            maximumTextLength: 0,
            gs1Handling: .parse,
            strictMode: true,
            formats: SBSDKBarcodeFormats.common // Set the desired barcodes formats to detect.
        )
        
        // Create an instance of `SBSDKBarcodeScannerConfiguration`.
        let configuration = SBSDKBarcodeScannerConfiguration(barcodeFormatConfigurations: [commonConfiguration])
    }
}
