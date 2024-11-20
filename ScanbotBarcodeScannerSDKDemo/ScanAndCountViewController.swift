//
//  ScanAndCountViewController.swift
//  ScanbotBarcodeScannerSDKDemo
//
//  Created by Danil Voitenko on 20.06.23.
//  Copyright © 2023 doo GmbH. All rights reserved.
//

import UIKit
import ScanbotBarcodeScannerSDK

final class ScanAndCountViewController: UIViewController {
    
    @IBOutlet private var listCountView: UIView!
    @IBOutlet private var listCountLabel: UILabel!
    
    private var countedBarcodes = [SBSDKBarcodeScannerAccumulatingResult]()
    private var scannerController: SBSDKBarcodeScanAndCountViewController!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listCountView.layer.cornerRadius = listCountView.bounds.height / 2
        self.scannerController = SBSDKBarcodeScanAndCountViewController(parentViewController: self,
                                                                        parentView: self.view,
                                                                        configuration: SBSDKBarcodeScannerConfiguration(),
                                                                        delegate: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let barcodeConfiguration = SBSDKBarcodeFormatCommonConfiguration(formats: Array(SharedParameters.acceptedBarcodeTypes))
        
        let scannerConfiguration = self.scannerController.configuration
        
        scannerConfiguration.barcodeFormatConfigurations = [barcodeConfiguration]
        
        self.scannerController.configuration = scannerConfiguration
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showScanAndCountResult",
           let destination = segue.destination as? ScanAndCountResultsViewController {
            destination.countedBarcodes = countedBarcodes
        }
    }
    
    @IBAction private func listButtonTapped(_ sender: UIButton) {
        guard !countedBarcodes.isEmpty else { return }
        performSegue(withIdentifier: "showScanAndCountResult", sender: self)
    }
}

extension ScanAndCountViewController: SBSDKBarcodeScanAndCountViewControllerDelegate {
    
    func barcodeScanAndCount(_ controller: SBSDKBarcodeScanAndCountViewController,
                             didDetectBarcodes codes: [SBSDKBarcodeItem]) {
        codes.forEach { code in
            guard let existingCode = self.countedBarcodes.first(where: {
                $0.item.format == code.format && $0.item.textWithExtension == code.textWithExtension
            }) else {
                self.countedBarcodes.append(SBSDKBarcodeScannerAccumulatingResult(barcodeItem: code))
                return
            }
            existingCode.scanCount += 1
            existingCode.dateOfLastDetection = Date()
        }
        let count = countedBarcodes.reduce(0) { $0 + $1.scanCount }
        listCountLabel.text = String(count)
    }
    
    func barcodeScanAndCount(_ controller: SBSDKBarcodeScanAndCountViewController,
                             polygonStyleForBarcode code: SBSDKBarcodeItem) -> SBSDKScanAndCountPolygonStyle {
        
        let style = SBSDKScanAndCountPolygonStyle()
        style.polygonDrawingEnabled = true
        style.cornerRadius = 4.0
        style.polygonColor = UIColor.systemBlue
        style.polygonFillColor = UIColor.systemBlue.withAlphaComponent(0.3)
        return style
        
    }
    
    func barcodeScanAndCount(_ controller: SBSDKBarcodeScanAndCountViewController,
                             overlayForBarcode code: SBSDKBarcodeItem) -> UIView? {
        UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
    }
}
