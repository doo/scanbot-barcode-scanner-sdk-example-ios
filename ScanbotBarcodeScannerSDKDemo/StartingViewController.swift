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
    

    
    private func showBarcodeScannerFromClassicComponent() {
        self.performSegue(withIdentifier: "ClassicBarcodeScanner", sender: self)
    }
    
    private func showSetAcceptedBarcodesScreen() {
        self.performSegue(withIdentifier: "BarcodeTypesListViewController", sender: self)
    }
    
    private func showBarcodeScannerFromRTUUI() {
        self.detectedBarcodes = []
        self.barcodeImage = nil
        
        let configuration = SBSDKUIMachineCodeScannerConfiguration.default()
        configuration.uiConfiguration.finderHeight = 1
        configuration.uiConfiguration.finderWidth = 1
        if self.shouldCaptureBarcodeImage {
            configuration.behaviorConfiguration.barcodeImageGenerationType = .capturedImage
        }
        
        SBSDKUIBarcodeScannerViewController.present(on: self,
                                                    withAcceptedMachineCodeTypes: Array(SharedParameters.acceptedBarcodeTypes),
                                                    configuration: configuration,
                                                    andDelegate: self)
    }
    
    private func showImagePicker() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .savedPhotosAlbum
        self.present(picker, animated: true, completion: nil)
    }
    
    private func detectBarcodesOnImage(_ image: UIImage) {
        let scanner = SBSDKBarcodeScanner(types: Array(SharedParameters.acceptedBarcodeTypes))
        let result = scanner.detectBarCodes(on: image)
        self.detectedBarcodes = result!
        self.barcodeImage = nil
    }
}

extension StartingViewController {
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
    
    @IBAction func scanImageFromLibraryButtonTapped(_ sender: UIButton) {
        self.showImagePicker()
    }
    
    @IBAction func setAcceptedBarcodesButtonTapped(_ sender: UIButton) {
        self.showSetAcceptedBarcodesScreen()
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

extension StartingViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.dismiss(animated: true) {
                self.detectBarcodesOnImage(image)
                self.performSegue(withIdentifier: "BarcodeResultList", sender: self)
            }
        }
    }
}
