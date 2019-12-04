//
//  StartingViewController.swift
//  SBBarcodeSDKDemo
//
//  Created by Yevgeniy Knizhnik on 28.11.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

import UIKit
import ScanbotBarcodeScannerSDK

class StartingViewController: UITableViewController {
    private var shouldCaptureBarcodeImage = false
    private var detectedBarcodes: [SBSDKBarcodeScannerResult] = []
    private var barcodeImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BarcodeResultList",
            let destination = segue.destination as? BarcodeResultList {
            destination.barcodeImage = self.barcodeImage
            destination.barcodes = self.detectedBarcodes
        }
    }
    
    @IBAction func rtuUIButtonTapped(_ sender: UIButton) {
        self.shouldCaptureBarcodeImage = false
        self.showBarcodeScannerFromRTUUI()
    }
    
    @IBAction func classicBarcodeScannerButtonTapped(_ sender: UIButton) {
        self.showBarcodeScannerFromClassicComponent()
    }
    
    @IBAction func rtuUIWithBarcodeImageButtonTapped(_ sender: UIButton) {
        self.shouldCaptureBarcodeImage = true
        self.showBarcodeScannerFromRTUUI()
    }
    
    private func showBarcodeScannerFromClassicComponent() {
        self.performSegue(withIdentifier: "ClassicBarcodeScanner", sender: self)
    }
    
    private func showBarcodeScannerFromRTUUI() {
        self.detectedBarcodes = []
        self.barcodeImage = nil
        
        let configuration = SBSDKUIMachineCodeScannerConfiguration.default()
        configuration.uiConfiguration.finderHeight = 0.5
        configuration.uiConfiguration.finderWidth = 1
        if self.shouldCaptureBarcodeImage {
            configuration.behaviorConfiguration.barcodeImageGenerationType = .capturedImage
        }
        
        SBSDKUIBarcodeScannerViewController.present(on: self,
                                                    withAcceptedMachineCodeTypes: nil,
                                                    configuration: configuration,
                                                    andDelegate: self)
    }
    
}

extension StartingViewController: SBSDKUIBarcodeScannerViewControllerDelegate {
    func qrBarcodeDetectionViewController(_ viewController: SBSDKUIBarcodeScannerViewController,
                                          didDetect barcodeResults: [SBSDKBarcodeScannerResult]) {
        if barcodeResults.count == 0 {
            return
        }
        
        viewController.isRecognitionEnabled = false
        self.detectedBarcodes = barcodeResults
        
        if self.shouldCaptureBarcodeImage {
            return
        }
        
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
            self.performSegue(withIdentifier: "BarcodeResultList", sender: self)
        }
    }
    
    func qrBarcodeDetectionViewController(_ viewController: SBSDKUIBarcodeScannerViewController,
                                          didCaptureBarcodeImage barcodeImage: UIImage?,
                                          imageURL: URL?) {
        self.barcodeImage = barcodeImage
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
            self.performSegue(withIdentifier: "BarcodeResultList", sender: self)
        }
    }
}
