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
    private var detectedBarcodes: [SBSDKBarcodeScannerResult] = []
    private var shouldRecognizeBarcodes = true
    private var scannerController: SBSDKBarcodeScanAndCountViewController!
    private var selectedBarcode: SBSDKBarcodeScannerResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scannerController = SBSDKBarcodeScanAndCountViewController(parentViewController: self,
                                                                        parentView: self.view,
                                                                        delegate: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.scannerController.acceptedBarcodeTypes = Array(SharedParameters.acceptedBarcodeTypes)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BarcodeResultList",
           let destination = segue.destination as? BarcodeResultList {
            if let selectedBarcode {
                destination.barcodes = [selectedBarcode]
            }
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

extension ScanAndCountViewController: SBSDKBarcodeScanAndCountViewControllerDelegate {
    
    func barcodeScanAndCount(_ controller: SBSDKBarcodeScanAndCountViewController, didDetectBarcodes codes: [SBSDKBarcodeScannerResult]) {
        detectedBarcodes = codes
    }
    
    func barcodeScanAndCount(_ controller: SBSDKBarcodeScanAndCountViewController, overlayForBarcode code: SBSDKBarcodeScannerResult) -> UIView? {
        let button = UIButton()
        let image = UIImage(systemName: "checkmark.circle.fill")
        button.setImage(image, for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        button.tintColor = .green
        if let index = detectedBarcodes.firstIndex(of: code) {
            button.tag = index
        }
        button.addTarget(self, action: #selector(barcodeButtonTapped), for: .touchUpInside)
        return button
    }
    
    @objc private func barcodeButtonTapped(_ sender: UIButton) {
        if sender.tag < detectedBarcodes.count {
            selectedBarcode = detectedBarcodes[sender.tag]
            if selectedBarcode != nil {
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                    self.performSegue(withIdentifier: "BarcodeResultList", sender: self)
                }
            }
        }
    }
}
