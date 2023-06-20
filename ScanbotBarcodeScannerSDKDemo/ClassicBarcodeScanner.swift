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
    private var detectedBarcodes: [SBSDKBarcodeScannerResult] = []
    private var shouldRecognizeBarcodes = true
    private var scannerController: SBSDKBarcodeScannerViewController!
    private var selectedBarcode: SBSDKBarcodeScannerResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scannerController = SBSDKBarcodeScannerViewController(parentViewController: self,
                                                                   parentView: self.view)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.selectedBarcode = nil
        self.scannerController.acceptedBarcodeTypes = Array(SharedParameters.acceptedBarcodeTypes)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BarcodeResultList",
            let destination = segue.destination as? BarcodeResultList {
            destination.barcodes = self.detectedBarcodes
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
                                  didDetectBarcodes codes: [SBSDKBarcodeScannerResult]) {
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
    
    func barcodeScannerController(_ controller: SBSDKBarcodeScannerViewController, didTapOnBarcode code: SBSDKBarcodeScannerResult) {
        self.selectedBarcode = code
    }
    
    func barcodeScannerController(_ controller: SBSDKBarcodeScannerViewController, shouldHighlight code: SBSDKBarcodeScannerResult) -> Bool {
        guard let selectedBarcode else { return false }
        return selectedBarcode == code
    }
}
