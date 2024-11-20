//
//  ClassicBarcodeScanner.swift
//  SBBarcodeSDKDemo
//
//  Created by Yevgeniy Knizhnik on 28.11.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

import UIKit
import ScanbotBarcodeScannerSDK

class ClassicBarcodeScanner: UIViewController {
    private var detectedBarcodes: [SBSDKBarcodeItem] = []
    private var shouldRecognizeBarcodes = true
    private var scannerController: SBSDKBarcodeScannerViewController!
    private var selectedBarcode: SBSDKBarcodeScannerResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barcodeConfiguration = SBSDKBarcodeFormatCommonConfiguration(formats: Array(SharedParameters.acceptedBarcodeTypes))
        
        let scannerConfiguration = SBSDKBarcodeScannerConfiguration(barcodeFormatConfigurations: [barcodeConfiguration])
        scannerConfiguration.returnBarcodeImage = true
        self.scannerController = SBSDKBarcodeScannerViewController(parentViewController: self,
                                                                   parentView: self.view,
                                                                   configuration: scannerConfiguration)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.selectedBarcode = nil
        
        let barcodeConfiguration = SBSDKBarcodeFormatCommonConfiguration(formats: Array(SharedParameters.acceptedBarcodeTypes))
        
        let scannerConfiguration = self.scannerController.configuration
        
        scannerConfiguration.barcodeFormatConfigurations = [barcodeConfiguration]
        
        self.scannerController.configuration = scannerConfiguration
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BarcodeResultList",
            let destination = segue.destination as? BarcodeResultList {
            destination.barcodes = self.detectedBarcodes.map({ barcode in
                return BarcodeResult(type: barcode.format,
                                     rawTextString: barcode.text,
                                     rawTextStringWithExtension: barcode.textWithExtension,
                                     barcodeImage: barcode.sourceImage?.toUIImage(), 
                                     rawBytes: barcode.rawBytes,
                                     formattedDocument: barcode.parsedDocument)
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.shouldRecognizeBarcodes = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.shouldRecognizeBarcodes = false
    }
}

extension ClassicBarcodeScanner: SBSDKBarcodeScannerViewControllerDelegate {
    func barcodeScannerControllerShouldDetectBarcodes(_ controller: SBSDKBarcodeScannerViewController) -> Bool {
        return self.shouldRecognizeBarcodes
    }
    
    func barcodeScannerController(_ controller: SBSDKBarcodeScannerViewController, 
                                  didDetectBarcodes codes: [SBSDKBarcodeItem]) {
        if codes.count == 0 {
            return
        }
        
        self.detectedBarcodes = codes
        self.shouldRecognizeBarcodes = false
        
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
            self.performSegue(withIdentifier: "BarcodeResultList", sender: self)
        }
    }
}
