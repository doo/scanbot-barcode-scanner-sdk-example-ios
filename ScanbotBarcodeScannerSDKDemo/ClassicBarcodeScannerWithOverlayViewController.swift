//
//  ClassicBarcodeScannerWithOverlayViewController.swift
//  ScanbotBarcodeScannerSDKDemo
//
//  Created by Sebastian Husche on 17.03.23.
//  Copyright © 2023 doo GmbH. All rights reserved.
//

import UIKit
import ScanbotBarcodeScannerSDK

class ClassicBarcodeScannerWithOverlayViewController: UIViewController {
    
    @IBOutlet var modeSwitch: UISwitch!
    private var scannerController: SBSDKBarcodeScannerViewController!
    private var shouldRecognizeBarcodes = true
    private var detectedBarcodes: [SBSDKBarcodeScannerResult] = []

    private var useCustomCellsMode: Bool = false {
        didSet {
            if isViewLoaded {
                updateCustomCellsMode()
            }
        }
    }
    
    @IBAction func modeSwitchToggled(_ sender: Any) {
        useCustomCellsMode = modeSwitch.isOn
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createScanner()
        updateCustomCellsMode()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        shouldRecognizeBarcodes = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BarcodeResultList",
            let destination = segue.destination as? BarcodeResultList {
            destination.barcodes = detectedBarcodes
        }
    }

    private func createScanner() {
        
        scannerController = SBSDKBarcodeScannerViewController(parentViewController: self, 
                                                              parentView: self.view, 
                                                              delegate: self)
        
        scannerController.selectionOverlayEnabled = true
        scannerController.automaticSelectionEnabled = false
    }
    
    private func updateCustomCellsMode() {
        
        modeSwitch.isOn = useCustomCellsMode 
        
        if useCustomCellsMode {
            
        } else {
            scannerController.disableSelectionOverlayCustomCellMode()
        }
    }
}

extension ClassicBarcodeScannerWithOverlayViewController: SBSDKBarcodeScannerViewControllerDelegate {
    
    func barcodeScannerControllerShouldDetectBarcodes(_ controller: SBSDKBarcodeScannerViewController) -> Bool {
        return shouldRecognizeBarcodes
    }
    
    func barcodeScannerController(_ controller: SBSDKBarcodeScannerViewController, 
                                  didDetectBarcodes codes: [SBSDKBarcodeScannerResult]) {
        
        if codes.count == 0 {
            return
        }
        
        detectedBarcodes = codes
        shouldRecognizeBarcodes = false
        
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
            self.performSegue(withIdentifier: "BarcodeResultList", sender: self)
        }
    }
}
