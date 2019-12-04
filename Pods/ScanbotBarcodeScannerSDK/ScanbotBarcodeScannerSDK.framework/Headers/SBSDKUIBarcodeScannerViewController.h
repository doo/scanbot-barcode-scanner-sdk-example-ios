//
//  SBSDKUIBarcodeScannerViewController.h
//  ScanbotSDKBundle
//
//  Created by Yevgeniy Knizhnik on 3/28/18.
//  Copyright © 2018 doo GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBSDKUIMachineCodeScannerConfiguration.h"
#import "SBSDKMachineReadableCode.h"
#import "SBSDKUIViewController.h"
#import "SBSDKUICameraViewController.h"
#import "SBSDKBarcodeScanner.h"

@class SBSDKUIBarcodeScannerViewController;

/** Delegate protocol for 'SBSDKUIBarcodeScannerViewController'. */
@protocol SBSDKUIBarcodeScannerViewControllerDelegate <SBSDKUIViewControllerDelegate>

@optional


/**
 * Informs the delegate that one or more barcodes have been detected.
 * @param viewController The detection view controller that detected barcode(s).
 * @param results An array of SBSDKBarcodeScannerResult objects containing recently detected barcodes.
 *
 * Implementing this delegate function will use the new Scanbot barcode detector: see 'SBSDKBarcodeType'.
 */
- (void)qrBarcodeDetectionViewController:(nonnull SBSDKUIBarcodeScannerViewController *)viewController
                        didDetectResults:(nonnull NSArray<SBSDKBarcodeScannerResult *> *)barcodeResults;

/**
 * Informs the delegate about capturing barcode image. Fires only if `barcodeImageGenerationType` behavior parameter is not SBSDKBarcodeImageGenerationTypeNone
 * @param viewController The detection view controller that detected barcode(s).
 * @param barcodeImage A device-orientation-corrected barcode image.
 * @param imageURL URL, where frameImage is saved. Stored in default storage of SBSDKUIPageFileStorage.
 *
 * Implementing this delegate function will use the new Scanbot barcode detector: see 'SBSDKBarcodeType'.
 */
- (void)qrBarcodeDetectionViewController:(nonnull SBSDKUIBarcodeScannerViewController *)viewController
                  didCaptureBarcodeImage:(nullable UIImage *)barcodeImage
                                imageURL:(nullable NSURL *)imageURL;

/**
 * Optional: informs the delegate that the 'SBSDKUIBarcodeScannerViewController' has been cancelled and dismissed.
 * @param viewController The 'SBSDKUIBarcodeScannerViewController' that did dismiss.
 */
- (void)qrBarcodeDetectionViewControllerDidCancel:(nonnull SBSDKUIBarcodeScannerViewController *)viewController;

@end

/**
 * A configurable view controller for camera-based detection of QR and bar codes.
 */
@interface SBSDKUIBarcodeScannerViewController : SBSDKUICameraViewController

/**
 * Creates a new instance of 'SBSDKUIBarcodeScannerViewController' and presents it modally.
 * @param presenter The view controller the new instance should be presented on.
 * @param machineCodeTypes The types of codes to be detected.
 * @param configuration The configuration to define look and feel of the new detection view controller.
 * @param delegate The delegate of the new detection view controller.
 * @return A new instance of 'SBSDKUIBarcodeScannerViewController'.
 */
+ (nonnull instancetype)presentOn:(nonnull UIViewController *)presenter
     withAcceptedMachineCodeTypes:(nullable NSArray<SBSDKBarcodeType *> *)machineCodeTypes
                    configuration:(nonnull SBSDKUIMachineCodeScannerConfiguration *)configuration
                      andDelegate:(nullable id<SBSDKUIBarcodeScannerViewControllerDelegate>)delegate;

/**
 * Creates a new instance of 'SBSDKUIBarcodeScannerViewController'.
 * @param machineCodeTypes The types of codes to be detected.
 * @param configuration The configuration to define look and feel of the new detection view controller.
 * @param delegate The delegate of the new detection view controller.
 * @return A new instance of 'SBSDKUIBarcodeScannerViewController'.
 */
+ (nonnull instancetype)createNewWithAcceptedMachineCodeTypes:(nullable NSArray<SBSDKBarcodeType *> *)machineCodeTypes
                                                configuration:(nonnull SBSDKUIMachineCodeScannerConfiguration *)configuration
                                                  andDelegate:(nullable id<SBSDKUIBarcodeScannerViewControllerDelegate>)delegate;

/** Enables or disables the QR/bar code detection. */
@property (nonatomic, getter=isRecognitionEnabled) BOOL recognitionEnabled;

/** The receivers delegate. */
@property (nullable, nonatomic, weak) id <SBSDKUIBarcodeScannerViewControllerDelegate> delegate;

@end

