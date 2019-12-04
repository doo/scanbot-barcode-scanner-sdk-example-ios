//
//  SBSDKBarcodeScannerViewController.h
//  ScanbotSDK
//
//  Created by Yevgeniy Knizhnik on 29.11.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBSDKBarcodeScannerResult.h"
#import "SBSDKBarcodeImageGenerationType.h"

@class SBSDKBarcodeScannerViewController;

@protocol SBSDKBarcodeScannerViewControllerDelegate <NSObject>
@optional
/**
 * Asks the delegate if the receiver should detect barcodes.
 * Optional.
 * @param controller The calling SBSDKScannerViewController.
 */
- (BOOL)barcodeScannerControllerShouldDetectBarcodes:(nonnull SBSDKBarcodeScannerViewController *)controller;

/**
 * Informs the delegate that the receiver has detected some barcodes.
 * Optional.
 * @param controller The calling SBSDKBarcodeScannerViewController.
 * @param codes Array of SBSDKBarcodeScannerResult containing the detected barcodes.
 */
- (void)barcodeScannerController:(nonnull SBSDKBarcodeScannerViewController *)controller
didDetecBarcodes:(nonnull NSArray<SBSDKBarcodeScannerResult *> *)codes;


/**
 * Returns captured barcode image. Will fire only if `barcodeImageGenerationType` parameter is not `SBSDKBarcodeImageGenerationTypeNone`.
 * Optional.
 * @param controller The calling SBSDKBarcodeScannerViewController.
 * @param barcodeImage A captured device-orientation-corrected barcode image.
 */
- (void)barcodeScannerController:(nonnull SBSDKBarcodeScannerViewController *)controller
didCaptureBarcodeImage:(nonnull UIImage *)barcodeImage;

@end

NS_ASSUME_NONNULL_BEGIN


/**
* UIViewController subclass showing a camera screen and barcode detector.
* This class cannot be instanced from a storyboard.
* Instead it is installing itself as a child view controller onto a given parent view controller.
*/
@interface SBSDKBarcodeScannerViewController : UIViewController
/**
 * The delegate. See SBSDKBarcodeScannerViewControllerDelegate protocol. Weak.
 */
@property (nonatomic, weak, nullable) id<SBSDKBarcodeScannerViewControllerDelegate> delegate;

/** The desired maximum detection rate of the receicer. The maximum number of video frames per second to
 * be analyzed. Defaults to 20.
 */
@property (nonatomic, assign) NSUInteger detectionRate;

/**
 * If set to YES (default), the camera session will be stopped entirely,
 * when the receiver disappears and restarts when the receiver reappears.
 * There is no CPU usage while the receiver is not on screen.
 *
 * NO will NOT stop the camera session, but pause the delivery of video frames and barcodes.
 * There is some very low CPU activity while the receiver is not on screen, but there is also no
 * lag when the receiver returns to the screen.
 */
@property (nonatomic, assign) BOOL stopsCameraSessionWhenDisappeared;

/**
Specifies the way of barcode images generation or disables this generation at all.
Use, if you want to receive a full sized image with barcodes.
Defaults to SBSDKBarcodeImageGenerationTypeNone.
*/
@property (nonatomic, assign) SBSDKBarcodeImageGenerationType barcodeImageGenerationType;

/**
 * Machine code types (EAN, DataMatrix, Aztec, QR, etc) that can be returned in `didDetectBarcodes`
 * delegate method. When nil - all codes can be returned.
 * Default is nil.
 */
@property (nonatomic, strong, nullable) NSArray<SBSDKBarcodeType *> *acceptedBarcodeTypes;

/**
 * A transparent view that lies over the preview layer. You can add custom UI here. Read-only.
 */
@property (nonatomic, strong, readonly, nonnull) UIView *HUDView;

/**
 * Defines if barcodeScanner should use limiting frame for detection. Alternatively all camera frame will be used.
 */
@property (nonatomic, assign) BOOL shouldUseFinderFrame;

/**
 * Defines the region of interest when scanning barcodes or other machine readable codes.
 * Machine readable codes found outside this region of interest are discarded and ignored during detection.
 * The property describes the aspect ratio (capturingFrameSize.width / capturingFrameSize.height) of the region of
 * interest. This aspect ratio, in conjunction with the screen size and `capturingFrameMinimumInset` parameter, is used to create an absolute region of
 * interest and render a view finder like rounded rectangle on screen.
 * Setting this property to (0.0, 0.0) or `CGSizeZero` effectively disables the region of interest.
 *
 * Example: (1.0, 1.0) will create a quadratic region of interest, filling most of the screen area,
 * a good match for scanning barcodes.
 *
 * Note: Only effective if `shouldUseFinderFrame` is set to `YES`.
 */
@property (nonatomic, assign) CGSize capturingFrameSize;

/**
 * Defines a minimum inset for capturing frame. Width goes for horizontal inset, height - for vertical. Default is 32 for both parameters.
 *
 * To calculate maximum size of the finder frame you need to take the corresponding inset, multiply it by 2, and subtract it from finder's container corresponding side.
 * Example: If `capturingFrameMinimumInset.width == 32` and finder's container width == 320, the maximum width of finder frame will be `320 - (32 * 2) = 256`
 *
 * Note: Only effective if `shouldUseFinderFrame` is set to `YES`.
*/
@property (nonatomic, assign) CGSize capturingFrameMinimumInset;

/**
 * Background color of camera preview. Default is black. Can be nil.
 */
@property (nonatomic, strong, nullable) UIColor *previewBackgroundColor;

/**
 * Background color of the view finder. Default is white with 0.66 alpha. Must not be nil.
 */
@property (nonatomic, strong, nonnull) UIColor *viewFinderBackgroundColor;

/**
 * Line color of the view finder. Default is nil, which draws no border line for the view finder.
 */
@property (nonatomic, strong, nullable) UIColor *viewFinderLineColor;

/**
 * Line width of the view finder. Default is 2.
 */
@property (nonatomic, assign) CGFloat viewFinderLineWidth;

/** Not available. */
- (nonnull instancetype)init NS_UNAVAILABLE;

/** Not available. */
+ (nonnull instancetype)new NS_UNAVAILABLE;

/**
* Desginated initializer. Installs the receiver as child view controller onto the parent view controllers
* view using its entire bounds area.
* @param parentViewController The view controller the newly created instance is embedded into.
* If parentViewController conforms to SBSDKBarcodeScannerViewControllerDelegate, it is automatically set as delegate.
*/
- (nullable instancetype)initWithParentViewController:(nonnull UIViewController *)parentViewController
                                           parentView:(nullable UIView *)containerView;

@end

NS_ASSUME_NONNULL_END
