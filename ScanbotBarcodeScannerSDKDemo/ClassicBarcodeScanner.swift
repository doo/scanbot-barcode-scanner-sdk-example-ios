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
    private var scannerController: SBSDKBarcodeScannerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scannerController = SBSDKBarcodeScannerViewController(parentViewController: self,
                                                                   parentView: self.view)
        self.scannerController?.barcodeAccumulatedFramesCount = 15;
        //self.scannerController?.flashLightEnabled = true;
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.scannerController?.acceptedBarcodeTypes = Array(SharedParameters.acceptedBarcodeTypes)
        self.shouldRecognizeBarcodes = true                 
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.shouldRecognizeBarcodes = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BarcodeResultList",
            let destination = segue.destination as? BarcodeResultList {
            destination.barcodes = self.detectedBarcodes
        }
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
        
        self.shouldRecognizeBarcodes = false
        self.detectedBarcodes = codes
        
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
            self.performSegue(withIdentifier: "BarcodeResultList", sender: self)
        }
    }
}
