//
//  BarcodeScannerSwiftUIScannerView.swift
//  ScanbotSDK Examples
//
//  Pure-SwiftUI counterpart of `BarcodeScannerViewController`.
//

import SwiftUI
import ScanbotBarcodeScannerSDK

struct BarcodeScannerSwiftUIScannerView: View {

    // The variable to indicate whether you want the scanner to detect barcodes or not.
    @State private var shouldDetectBarcodes = true

    // The scanner model backing the `SBSDKScannerView` below. It owns the camera session, the
    // scanner configuration and the frame-engine state, and is the SwiftUI equivalent of the
    // Classic UI `SBSDKBarcodeScannerViewController`.
    @State private var model: SBSDKBarcodeScannerModel = {

        // The barcode formats to be scanned.
        let formatsToDetect = SBSDKBarcodeFormats.all

        // Create an instance of `SBSDKBarcodeFormatCommonConfiguration`.
        let formatConfiguration = SBSDKBarcodeFormatCommonConfiguration(formats: formatsToDetect)

        // Create an instance of `SBSDKBarcodeScannerConfiguration`.
        let configuration = SBSDKBarcodeScannerConfiguration(barcodeFormatConfigurations: [formatConfiguration])

        // Enable the barcode image extraction.
        configuration.returnBarcodeImage = true

        return try! SBSDKBarcodeScannerModel(scannerConfiguration: configuration)
    }()

    var body: some View {

        // Embed the `SBSDKBarcodeScannerModel`-driven camera/detection UI.
        SBSDKScannerView(viewModel: model)
            .onAppear {
                // Enable the view finder.
                model.configuration.isViewFinderEnabled = true

                // Set the finder's aspect ratio.
                model.configuration.viewFinderAspectRatio = SBSDKAspectRatio(width: 2, height: 1)

                // Set the finder's minimum insets.
                model.configuration.viewFinderMinimumInset = UIEdgeInsets(top: 100, left: 50, bottom: 100, right: 50)

                // Configure the view finder colors and line properties.
                model.configuration.viewFinderLineColor = UIColor.red
                model.configuration.viewFinderBackgroundColor = UIColor.red.withAlphaComponent(0.1)
                model.configuration.viewFinderLineWidth = 2
                model.configuration.viewFinderLineCornerRadius = 8

                // Set the detection rate.
                model.configuration.detectionRate = 5

                // Implement this to pause the detection (e.g. when showing the results).
                model.configuration.isScanningEnabled = shouldDetectBarcodes
            }
            // Subscribe to the frame engine's result/failure events. This replaces
            // `SBSDKBarcodeScannerViewControllerDelegate`.
            .onReceive(model.barcodeFrameEngine.events) { event in
                switch event {
                case .result(let snapshot):
                    // Process the detected barcodes.
                    print(snapshot.barcodes)

                    for code in snapshot.barcodes {
                        // Get the source image.
                        let sourceImage = try? code.sourceImage?.toUIImage()
                    }

                case .failure(let error):
                    // Handle the error.
                    print("Error scanning barcode: \(error.localizedDescription)")
                }
            }
    }
}

#Preview {
    BarcodeScannerSwiftUIScannerView()
}
