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
    
    private var detectedBarcodes: [SBSDKBarcodeScannerResult] = []
    private var shouldRecognizeBarcodes = true
    private var scannerController: SBSDKBarcodeScannerViewController?
    private var isScrolling: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scannerController = SBSDKBarcodeScannerViewController(parentViewController: self,
                                                                   parentView: self.cameraContainer)
        self.scannerController?.detectionRate = 10
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
}

extension ClassicBatchBarcodeScanner: SBSDKBarcodeScannerViewControllerDelegate {
    
    func barcodeScannerControllerShouldDetectBarcodes(_ controller: SBSDKBarcodeScannerViewController) -> Bool {
        return self.shouldRecognizeBarcodes && !self.isScrolling
    }
    
    func barcodeScannerController(_ controller: SBSDKBarcodeScannerViewController,
                                  didDetectBarcodes codes: [SBSDKBarcodeScannerResult]) {
        if codes.count == 0 {
            return
        }
        
        self.shouldRecognizeBarcodes = false

        for code in codes.reversed() {
            if !self.detectedBarcodes.contains(code) {
                self.detectedBarcodes.insert(code, at: 0)
            }
        }
        self.tableView.reloadData()
        self.shouldRecognizeBarcodes = true
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
        
        cell.barcodeImageView.image = code.barcodeImage
        cell.barcodeLabel.text = code.rawTextString
        cell.barcodeTypeLabel.text = code.type.name
        return cell
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.isScrolling = true
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        self.isScrolling = false
    }
}
