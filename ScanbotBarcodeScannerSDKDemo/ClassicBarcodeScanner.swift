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
    private var shouldScanBarcodes = true
    private var scannerController: SBSDKBarcodeScannerViewController!
    private var selectedBarcode: SBSDKBarcodeScannerResult?
    private var isShowingError: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barcodeConfiguration = SBSDKBarcodeFormatCommonConfiguration(formats: [.australiaPost])
        barcodeConfiguration.gs1Handling = .validateFull
        
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
        
        let scannerConfiguration = self.scannerController.copyCurrentConfiguration()
        
        scannerConfiguration.barcodeFormatConfigurations = [barcodeConfiguration]
        
        self.scannerController.setConfiguration(scannerConfiguration)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BarcodeResultList",
            let destination = segue.destination as? BarcodeResultList {
            destination.barcodes = self.detectedBarcodes.map({ barcode in
                return BarcodeResult(type: barcode.format,
                                     rawTextString: barcode.text,
                                     rawTextStringWithExtension: barcode.textWithExtension,
                                     barcodeImage: try? barcode.sourceImage?.toUIImage(), 
                                     rawBytes: barcode.rawBytes,
                                     formattedDocument: barcode.extractedDocument)
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.shouldScanBarcodes = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.shouldScanBarcodes = false
    }
}

extension ClassicBarcodeScanner: SBSDKBarcodeScannerViewControllerDelegate {
    func barcodeScannerController(_ controller: SBSDKBarcodeScannerViewController, didFailScanning error: any Error) {
        if let error = error as? SBSDKError {
            guard !isShowingError else { return }
            
            isShowingError = true
            if error.isCanceled {
                print("Scanning was cancelled by the user")
            } else {
                sbsdk_showError(error) { [weak self] _ in
                    guard let self else { return }
                    self.sbsdk_forceClose(animated: true, completion: nil)
                }
            }
        }
    }
    
    func barcodeScannerControllerShouldScanBarcodes(_ controller: SBSDKBarcodeScannerViewController) -> Bool {
        return self.shouldScanBarcodes
    }
    
    func barcodeScannerController(_ controller: SBSDKBarcodeScannerViewController, 
                                  didScanBarcodes codes: [SBSDKBarcodeItem]) {
        if codes.count == 0 {
            return
        }
        
        self.detectedBarcodes = codes
        self.shouldScanBarcodes = false
        
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
            self.performSegue(withIdentifier: "BarcodeResultList", sender: self)
        }
    }
}
