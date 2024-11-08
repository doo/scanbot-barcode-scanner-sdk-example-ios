//
//  ClassicBatchBarcodeScanner.swift
//  SBBarcodeSDKDemo
//
//  Created by Yevgeniy Knizhnik on 28.11.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

import UIKit
import ScanbotBarcodeScannerSDK

class ClassicBatchBarcodeScannerTableCell: UITableViewCell {
    @IBOutlet var barcodeImageView: UIImageView!
    @IBOutlet var barcodeLabel: UILabel!
    @IBOutlet var barcodeTypeLabel: UILabel!
}

class ClassicBatchBarcodeScanner: UIViewController {
    @IBOutlet var cameraContainer: UIView!
    @IBOutlet var tableView: UITableView!
    
    private var detectedBarcodes: [SBSDKBarcodeItem] = []
    private var scannerController: SBSDKBarcodeScannerViewController!
    private var isScrolling: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barcodeConfiguration = SBSDKBarcodeFormatCommonConfiguration(formats: SBSDKBarcodeFormats.common)
        
        let scannerConfiguration = SBSDKBarcodeScannerConfiguration(barcodeFormatConfigurations: [barcodeConfiguration])
        
        self.scannerController = SBSDKBarcodeScannerViewController(parentViewController: self,
                                                                   parentView: self.cameraContainer, 
                                                                   configuration: scannerConfiguration)
        
        self.scannerController.trackingOverlayController.delegate = self
        
        // Enable the tracking overlay here.
        //self.scannerController.isTrackingOverlayEnabled = true
        
        let energyConfiguration = self.scannerController.energyConfiguration
        energyConfiguration.detectionRate = 10
        self.scannerController.energyConfiguration = energyConfiguration
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let barcodeConfiguration = SBSDKBarcodeFormatCommonConfiguration(formats: Array(SharedParameters.acceptedBarcodeTypes))
        
        let scannerConfiguration = self.scannerController.configuration
        
        scannerConfiguration.barcodeFormatConfigurations = [barcodeConfiguration]
        
        self.scannerController.configuration = scannerConfiguration
    }
}

extension ClassicBatchBarcodeScanner: SBSDKBarcodeTrackingOverlayControllerDelegate {
    func barcodeTrackingOverlay(_ controller: SBSDKBarcodeTrackingOverlayController,
                                didTapOnBarcode barcode: SBSDKBarcodeItem) {
        
        if !self.detectedBarcodes.contains(barcode) {
            self.detectedBarcodes.insert(barcode, at: 0)
        } else {
            self.detectedBarcodes.removeAll(where: { $0 == barcode })
        }
        self.tableView.reloadData()
    }
    
}

extension ClassicBatchBarcodeScanner: SBSDKBarcodeScannerViewControllerDelegate {
    
    func barcodeScannerControllerShouldDetectBarcodes(_ controller: SBSDKBarcodeScannerViewController) -> Bool {
        return !self.isScrolling
    }
    
    func barcodeScannerController(_ controller: SBSDKBarcodeScannerViewController,
                                  didDetectBarcodes codes: [SBSDKBarcodeItem]) {
        
        if codes.count == 0 || controller.isTrackingOverlayEnabled {
            return
        }
        for code in codes.reversed() {
            if !self.detectedBarcodes.contains(code) {
                self.detectedBarcodes.insert(code, at: 0)
            }
        }
        self.tableView.reloadData()
    }
}

extension ClassicBatchBarcodeScanner: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.detectedBarcodes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "barcodeCell") as! ClassicBatchBarcodeScannerTableCell
        let code = self.detectedBarcodes[indexPath.row]
        
        cell.barcodeImageView.image = code.sourceImage?.toUIImage()
        cell.barcodeLabel.text = code.textWithExtension
        cell.barcodeTypeLabel.text = code.format.name
        return cell
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.isScrolling = true
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        self.isScrolling = false
    }
}
