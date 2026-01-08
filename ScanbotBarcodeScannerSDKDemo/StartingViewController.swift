//
//  StartingViewController.swift
//  SBBarcodeSDKDemo
//
//  Created by Yevgeniy Knizhnik on 28.11.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

import UIKit
import ScanbotBarcodeScannerSDK
import UniformTypeIdentifiers

class StartingViewController: UITableViewController {
    private var shouldCaptureBarcodeImage = false
    private var detectedBarcodes: [BarcodeResult] = []
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
    
    // Classic components
    
    private func showBarcodeScannerFromClassicComponent() {
        self.performSegue(withIdentifier: "ClassicBarcodeScanner", sender: self)
    }
    
    private func showScanAndCountScannerFromClassicComponent() {
        self.performSegue(withIdentifier: "ClassicScanAndCount", sender: self)
    }
    
    private func showBatchBarcodeScannerFromClassicComponent() {
        self.performSegue(withIdentifier: "ClassicBatchBarcodeScanner", sender: self)
    }
    
    private func showSetAcceptedBarcodesScreen() {
        self.performSegue(withIdentifier: "BarcodeTypesListViewController", sender: self)
    }
    
    // RTU UI components
    
    private func showSingleBarcodeScannerFromRTUUI() {
        self.detectedBarcodes = []
        
        let config = SBSDKUI2BarcodeScannerScreenConfiguration()
        config.scannerConfiguration.setBarcodeFormats(SBSDKBarcodeFormats.all)
        
        let usecase = SBSDKUI2SingleScanningMode()
        usecase.confirmationSheetEnabled = true
        usecase.barcodeInfoMapping.barcodeItemMapper = self
        usecase.arOverlay.visible = false
        usecase.arOverlay.automaticSelectionEnabled = false
        
        config.useCase = usecase
        
        SBSDKUI2BarcodeScannerViewController.present(on: self,
                                                     configuration: config) { controller, result, error in
            
            if let items = result?.items {
                self.detectedBarcodes = items.map({ item in
                    return BarcodeResult(type: item.barcode.format,
                                         rawTextString: item.barcode.text,
                                         rawTextStringWithExtension: item.barcode.textWithExtension)
                })
                
                self.dismiss(animated: true, completion: nil)
                self.performSegue(withIdentifier: "BarcodeResultList", sender: self)
                
            } else if let sdkError = error as? SBSDKError, sdkError.isCanceled {
                // Canceled. Do nothing.
                controller.presentingViewController?.dismiss(animated: true)
            } else if let error {
                // Show an error alert.
                controller.presentingViewController?.dismiss(animated: true)
                self.sbsdk_showError(error)
            }
        }
    }
    
    private func showSingleARBarcodeScannerFromRTUUI() {
        self.detectedBarcodes = []
        
        let config = SBSDKUI2BarcodeScannerScreenConfiguration()
        config.scannerConfiguration.setBarcodeFormats(SBSDKBarcodeFormats.all)
        
        let usecase = SBSDKUI2SingleScanningMode()
        usecase.confirmationSheetEnabled = true
        usecase.arOverlay.visible = true
        usecase.arOverlay.automaticSelectionEnabled = false
        usecase.barcodeInfoMapping.barcodeItemMapper = self
        
        config.useCase = usecase
        
        SBSDKUI2BarcodeScannerViewController.present(on: self,
                                                     configuration: config) { controller, result, error in
            
            if let items = result?.items {
                self.detectedBarcodes = items.map({ item in
                    return BarcodeResult(type: item.barcode.format,
                                         rawTextString: item.barcode.text,
                                         rawTextStringWithExtension: item.barcode.textWithExtension)
                })
                
                self.dismiss(animated: true, completion: nil)
                self.performSegue(withIdentifier: "BarcodeResultList", sender: self)
                
            } else if let sdkError = error as? SBSDKError, sdkError.isCanceled {
                // Canceled. Do nothing.
                controller.presentingViewController?.dismiss(animated: true)
            } else if let error {
                // Show an error alert.
                controller.presentingViewController?.dismiss(animated: true)
                self.sbsdk_showError(error)
            }
        }
    }
    
    private func showSingleARAutoSelectBarcodeScannerFromRTUUI() {
        self.detectedBarcodes = []
        
        let config = SBSDKUI2BarcodeScannerScreenConfiguration()
        config.scannerConfiguration.setBarcodeFormats(SBSDKBarcodeFormats.all)
        
        let usecase = SBSDKUI2SingleScanningMode()
        usecase.confirmationSheetEnabled = true
        usecase.arOverlay.visible = true
        usecase.arOverlay.automaticSelectionEnabled = true
        
        config.useCase = usecase
        
        SBSDKUI2BarcodeScannerViewController.present(on: self,
                                                     configuration: config) { controller, result, error in
            
            if let items = result?.items {
                self.detectedBarcodes = items.map({ item in
                    return BarcodeResult(type: item.barcode.format,
                                         rawTextString: item.barcode.text,
                                         rawTextStringWithExtension: item.barcode.textWithExtension)
                })
                
                self.dismiss(animated: true, completion: nil)
                self.performSegue(withIdentifier: "BarcodeResultList", sender: self)
                
            } else if let sdkError = error as? SBSDKError, sdkError.isCanceled {
                // Canceled. Do nothing.
                controller.presentingViewController?.dismiss(animated: true)
            } else if let error {
                // Show an error alert.
                controller.presentingViewController?.dismiss(animated: true)
                self.sbsdk_showError(error)
            }
        }
    }
    
    private func showMultiBarcodeScannerFromRTUUI() {
        self.detectedBarcodes = []
        
        let config = SBSDKUI2BarcodeScannerScreenConfiguration()
        config.scannerConfiguration.setBarcodeFormats(SBSDKBarcodeFormats.all)
        
        let usecase = SBSDKUI2MultipleScanningMode()
        usecase.mode = .unique
        usecase.sheet.mode = .button
        usecase.arOverlay.visible = false
        
        config.useCase = usecase
        
        SBSDKUI2BarcodeScannerViewController.present(on: self,
                                                     configuration: config) { controller, result, error in
            
            if let items = result?.items {
                self.detectedBarcodes = items.map({ item in
                    return BarcodeResult(type: item.barcode.format,
                                         rawTextString: item.barcode.text,
                                         rawTextStringWithExtension: item.barcode.textWithExtension)
                })
                
                self.dismiss(animated: true, completion: nil)
                self.performSegue(withIdentifier: "BarcodeResultList", sender: self)
                
            } else if let sdkError = error as? SBSDKError, sdkError.isCanceled {
                // Canceled. Do nothing.
                controller.presentingViewController?.dismiss(animated: true)
            } else if let error {
                // Show an error alert.
                controller.presentingViewController?.dismiss(animated: true)
                self.sbsdk_showError(error)
            }
        }
    }
    
    private func showMultiSheetBarcodeScannerFromRTUUI() {
        self.detectedBarcodes = []
        
        let config = SBSDKUI2BarcodeScannerScreenConfiguration()
        config.scannerConfiguration.setBarcodeFormats(SBSDKBarcodeFormats.all)
        
        let usecase = SBSDKUI2MultipleScanningMode()
        usecase.mode = .unique
        usecase.sheet.mode = .collapsedSheet
        usecase.sheet.collapsedVisibleHeight = .small
        usecase.arOverlay.visible = false
        
        config.useCase = usecase
        
        SBSDKUI2BarcodeScannerViewController.present(on: self,
                                                     configuration: config) { controller, result, error in
            
            if let items = result?.items {
                self.detectedBarcodes = items.map({ item in
                    return BarcodeResult(type: item.barcode.format,
                                         rawTextString: item.barcode.text,
                                         rawTextStringWithExtension: item.barcode.textWithExtension)
                })
                
                self.dismiss(animated: true, completion: nil)
                self.performSegue(withIdentifier: "BarcodeResultList", sender: self)
                
            } else if let sdkError = error as? SBSDKError, sdkError.isCanceled {
                // Canceled. Do nothing.
                controller.presentingViewController?.dismiss(animated: true)
            } else if let error {
                // Show an error alert.
                controller.presentingViewController?.dismiss(animated: true)
                self.sbsdk_showError(error)
            }
        }
    }
    
    private func showMultiSheetARCountBarcodeScannerFromRTUUI() {
        self.detectedBarcodes = []
        
        let config = SBSDKUI2BarcodeScannerScreenConfiguration()
        config.scannerConfiguration.setBarcodeFormats(SBSDKBarcodeFormats.all)
        
        let usecase = SBSDKUI2MultipleScanningMode()
        usecase.mode = .counting
        usecase.sheet.mode = .collapsedSheet
        usecase.sheet.collapsedVisibleHeight = .small
        usecase.sheetContent.manualCountChangeEnabled = true
        usecase.arOverlay.visible = true
        usecase.arOverlay.automaticSelectionEnabled = false
        usecase.barcodeInfoMapping.barcodeItemMapper = self
        
        config.useCase = usecase
        
        SBSDKUI2BarcodeScannerViewController.present(on: self,
                                                     configuration: config) { controller, result, error in
            
            if let items = result?.items {
                self.detectedBarcodes = items.map({ item in
                    return BarcodeResult(type: item.barcode.format,
                                         rawTextString: item.barcode.text,
                                         rawTextStringWithExtension: item.barcode.textWithExtension)
                })
                
                self.dismiss(animated: true, completion: nil)
                self.performSegue(withIdentifier: "BarcodeResultList", sender: self)
                
            } else if let sdkError = error as? SBSDKError, sdkError.isCanceled {
                // Canceled. Do nothing.
                controller.presentingViewController?.dismiss(animated: true)
            } else if let error {
                // Show an error alert.
                controller.presentingViewController?.dismiss(animated: true)
                self.sbsdk_showError(error)
            }
        }
    }
    
    private func showMultiSheetARCountAutoSelectBarcodeScannerFromRTUUI() {
        self.detectedBarcodes = []
        
        let config = SBSDKUI2BarcodeScannerScreenConfiguration()
        config.scannerConfiguration.setBarcodeFormats(SBSDKBarcodeFormats.all)
        
        let usecase = SBSDKUI2MultipleScanningMode()
        usecase.mode = .counting
        usecase.sheet.mode = .collapsedSheet
        usecase.sheet.collapsedVisibleHeight = .large
        usecase.sheetContent.manualCountChangeEnabled = true
        usecase.arOverlay.visible = true
        usecase.arOverlay.automaticSelectionEnabled = true
        
        config.useCase = usecase
        
        SBSDKUI2BarcodeScannerViewController.present(on: self,
                                                     configuration: config) { controller, result, error in
            
            if let items = result?.items {
                self.detectedBarcodes = items.map({ item in
                    return BarcodeResult(type: item.barcode.format,
                                         rawTextString: item.barcode.text,
                                         rawTextStringWithExtension: item.barcode.textWithExtension)
                })
                
                self.dismiss(animated: true, completion: nil)
                self.performSegue(withIdentifier: "BarcodeResultList", sender: self)
                
            } else if let sdkError = error as? SBSDKError, sdkError.isCanceled {
                // Canceled. Do nothing.
                controller.presentingViewController?.dismiss(animated: true)
            } else if let error {
                // Show an error alert.
                controller.presentingViewController?.dismiss(animated: true)
                self.sbsdk_showError(error)
            }
        }
    }
    
    private func showFindAndPickBarcodeScannerFromRTUUI() {
        self.detectedBarcodes = []
        
        let config = SBSDKUI2BarcodeScannerScreenConfiguration()
        config.userGuidance.title.text = "Please align the QR-/Barcode in the frame above to scan it."
        
        let usecase = SBSDKUI2FindAndPickScanningMode()
        usecase.arOverlay.automaticSelectionEnabled = false
        usecase.arOverlay.visible = true
        usecase.allowPartialScan = true
        
        usecase.expectedBarcodes = [
            SBSDKUI2ExpectedBarcode(barcodeValue: "ScanbotSDK", title: "ScanbotSDK", image: "https://avatars.githubusercontent.com/u/1454920?s=280&v=4", count: 4),
            SBSDKUI2ExpectedBarcode(barcodeValue: "Hello world!", title: "Hello world!", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/HelloWorld_in_black_and_white.svg/240px-HelloWorld_in_black_and_white.svg.png", count: 3)
        ]
        
        config.useCase = usecase
        
        SBSDKUI2BarcodeScannerViewController.present(on: self,
                                                     configuration: config) { controller, result, error in
            if let items = result?.items {
                self.detectedBarcodes = items.map({ item in
                    return BarcodeResult(type: item.barcode.format,
                                         rawTextString: item.barcode.text,
                                         rawTextStringWithExtension: item.barcode.textWithExtension)
                })
                
                self.dismiss(animated: true, completion: nil)
                self.performSegue(withIdentifier: "BarcodeResultList", sender: self)
                
            } else if let sdkError = error as? SBSDKError, sdkError.isCanceled {
                // Canceled. Do nothing.
                controller.presentingViewController?.dismiss(animated: true)
            } else if let error {
                // Show an error alert.
                controller.presentingViewController?.dismiss(animated: true)
                self.sbsdk_showError(error)
            }
        }
    }
    
    private func detectBarcodesOnImage(_ image: SBSDKImageRef) {
        detectedBarcodes.removeAll()
        
        let barcodeConfiguration = SBSDKBarcodeFormatCommonConfiguration(formats: Array(SharedParameters.acceptedBarcodeTypes))
        let configuration = SBSDKBarcodeScannerConfiguration(barcodeFormatConfigurations: [barcodeConfiguration])
        
        do {
            let scanner = try SBSDKBarcodeScanner(configuration: configuration)
            let result = try scanner.run(image: image)
            result.barcodes.forEach({ barcode in
                let barcodeResult = BarcodeResult(type: barcode.format,
                                                  rawTextString: barcode.text,
                                                  rawTextStringWithExtension: barcode.textWithExtension)
                detectedBarcodes.append(barcodeResult)
            })
            self.barcodeImage = nil
        } catch {
            sbsdk_showError(error) { [weak self] _ in
                guard let self else { return }
                self.sbsdk_forceClose(animated: true, completion: nil)
            }
        }
    }
    
    private func showImagePicker() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .savedPhotosAlbum
        self.present(picker, animated: true, completion: nil)
    }
}

extension StartingViewController {
    
    @IBAction func classicBarcodeScannerButtonTapped(_ sender: UIButton) {
        self.showBarcodeScannerFromClassicComponent()
    }
    
    @IBAction func classicBatchBarcodeScannerButtonTapped(_ sender: UIButton) {
        self.showBatchBarcodeScannerFromClassicComponent()
    }
    
    @IBAction func classicScanAndCountButtonTapped(_ sender: UIButton) {
        self.showScanAndCountScannerFromClassicComponent()
    }
    
    @IBAction func rtuUISingleScannerButtonTapped(_ sender: UIButton) {
        self.showSingleBarcodeScannerFromRTUUI()
    }
    
    @IBAction func rtuUISingleARScannerButtonTapped(_ sender: UIButton) {
        self.showSingleARBarcodeScannerFromRTUUI()
    }
    
    @IBAction func rtuUISingleARAutoSelectScannerButtonTapped(_ sender: UIButton) {
        self.showSingleARAutoSelectBarcodeScannerFromRTUUI()
    }
    
    @IBAction func rtuUIMultiScannerButtonTapped(_ sender: UIButton) {
        self.showMultiBarcodeScannerFromRTUUI()
    }
    
    @IBAction func rtuUIMultiSheetScannerButtonTapped(_ sender: UIButton) {
        self.showMultiSheetBarcodeScannerFromRTUUI()
    }
    
    @IBAction func rtuUIMultiSheetARCountScannerButtonTapped(_ sender: UIButton) {
        self.showMultiSheetARCountBarcodeScannerFromRTUUI()
    }
    
    @IBAction func rtuUIMultiSheetARCountAutoSelectScannerButtonTapped(_ sender: UIButton) {
        self.showMultiSheetARCountAutoSelectBarcodeScannerFromRTUUI()
    }
    
    @IBAction func rtuUIFindAndPickScannerButtonTapped(_ sender: UIButton) {
        self.showFindAndPickBarcodeScannerFromRTUUI()
    }
    
    @IBAction func scanImageFromLibraryButtonTapped(_ sender: UIButton) {
        self.scanFromPdfFile()
    }
    
    @IBAction func setAcceptedBarcodesButtonTapped(_ sender: UIButton) {
        self.showSetAcceptedBarcodesScreen()
    }
}

extension StartingViewController : SBSDKUI2BarcodeItemMapper {
    func mapBarcodeItem(item: ScanbotBarcodeScannerSDK.SBSDKBarcodeItem,
                        onResult: @escaping (ScanbotBarcodeScannerSDK.SBSDKUI2BarcodeMappedData) -> Void,
                        onError: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if item.format == .qrCode {
                onError()
            } else {
                
                let subtitle = item.format.name
                
                let mappedData = SBSDKUI2BarcodeMappedData(title: item.textWithExtension,
                                                           subtitle: subtitle,
                                                           barcodeImage: SBSDKUI2BarcodeMappedData.barcodeImageKey)
                onResult(mappedData)
            }
        }
    }
}

extension StartingViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.dismiss(animated: true) {
                let imageRef = SBSDKImageRef.fromUIImage(image: image)
                self.detectBarcodesOnImage(imageRef)
                self.performSegue(withIdentifier: "BarcodeResultList", sender: self)
            }
        }
    }
}


extension StartingViewController :  UIDocumentPickerDelegate {
    
    func documentPicker(
        _ controller: UIDocumentPickerViewController,
        didPickDocumentsAt urls: [URL]
    ) {
        guard let sourceURL = urls.first else { return }
        
        let extractor = SBSDKPDFImageExtractor()
        let imageRefs = extractor.extract(from: sourceURL)
        
        guard imageRefs.count != 0 else { return }
        
        let viewController = ViewImageRefViewController()
        viewController.imageRef = imageRefs.first!
        self.navigationController?.pushViewController(viewController, animated: true)
        
        
    }
    
    func documentPickerWasCancelled(
        _ controller: UIDocumentPickerViewController
    ) {
        print("User cancelled PDF picker")
    }
    
    func scanFromPdfFile() {
        var picker : UIDocumentPickerViewController
        if #available(iOS 14.0, *) {
            picker = UIDocumentPickerViewController(
                forOpeningContentTypes: [.pdf],
                asCopy: true
            )
        } else {
            picker = UIDocumentPickerViewController()
            picker.allowsMultipleSelection = false
        }
        
        picker.delegate = self
        picker.allowsMultipleSelection = false
        
        present(picker, animated: true)
        
    }
}
