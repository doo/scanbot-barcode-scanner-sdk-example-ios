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
                                                                        delegate: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.scannerController.acceptedBarcodeTypes = Array(SharedParameters.acceptedBarcodeTypes)
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
                             didDetectBarcodes codes: [SBSDKBarcodeScannerResult]) {
        codes.forEach { code in
            guard let existingCode = self.countedBarcodes.first(where: {
                $0.code.type == code.type && $0.code.rawTextString == code.rawTextString
            }) else {
                self.countedBarcodes.append(SBSDKBarcodeScannerAccumulatingResult(barcodeResult: code))
                return
            }
            existingCode.scanCount += 1
            existingCode.code.dateOfDetection = code.dateOfDetection
        }
        let count = countedBarcodes.reduce(0) { $0 + $1.scanCount }
        listCountLabel.text = String(count)
    }
    
    func barcodeScanAndCount(_ controller: SBSDKBarcodeScanAndCountViewController,
                             polygonStyleForBarcode code: SBSDKBarcodeScannerResult) -> SBSDKScanAndCountPolygonStyle {
        
        let style = SBSDKScanAndCountPolygonStyle()
        style.polygonDrawingEnabled = true
        style.cornerRadius = 4.0
        style.polygonColor = UIColor.systemBlue
        style.polygonFillColor = UIColor.systemBlue.withAlphaComponent(0.3)
        return style
        
    }
    
    func barcodeScanAndCount(_ controller: SBSDKBarcodeScanAndCountViewController,
                             overlayForBarcode code: SBSDKBarcodeScannerResult) -> UIView? {
        UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
    }
}
