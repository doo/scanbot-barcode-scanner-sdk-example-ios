//
//  SBSDKUIMachineCodeScannerUIConfiguration.h
//  ScanbotSDKBundle
//
//  Created by Yevgeniy Knizhnik on 4/17/18.
//  Copyright © 2018 doo GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

/** Subconfiguration for user interface of the detector screens for bar codes, QR codes and machine readable zones. */
@interface SBSDKUIMachineCodeScannerUIConfiguration : NSObject

/** Foreground color of the cancel button. */
@property (nonnull, nonatomic, strong) UIColor *topBarButtonsColor;

/** Background color of the top bar. */
@property (nonnull, nonatomic, strong) UIColor *topBarBackgroundColor;

/** Background color of the detection overlay. */
@property (nonnull, nonatomic, strong) UIColor *cameraOverlayColor;

/** Foreground color of the detection overlay. */
@property (nonnull, nonatomic, strong) UIColor *finderLineColor;

/** Width of finder frame border. Default is 2. */
@property (nonatomic) CGFloat finderLineWidth;

/**
 * Relative width of finder frame. Together with `finderHeight` it defines the aspect ratio, which is used to build actual finder frame. Default is 1.
 * For example if `finderWidth` and `finderHeight` both equals 1 - it will make a square frame, which is good for QR capturing.
 */
@property (nonatomic) CGFloat finderWidth;

/**
 * Relative height of finder frame. Together with `finderWidth` it defines the aspect ratio, which is used to build actual finder frame. Default is 1.
 * For example if `finderWidth` and `finderHeight` both equals 1 - it will make a square frame, which is good for QR capturing.
 */
@property (nonatomic) CGFloat finderHeight;

/** Foreground color of the description label. */
@property (nonnull, nonatomic, strong) UIColor *finderTextHintColor;

/** Foreground color of the flash button when flash is off. */
@property (nonnull, nonatomic, strong) UIColor *bottomButtonsInactiveColor;

/** Foreground color of the flash button when flash is on. */
@property (nonnull, nonatomic, strong) UIColor *bottomButtonsActiveColor;

/** Whether the cancel button is hidden or not. */
@property (nonatomic, assign, getter=isCancelButtonHidden) BOOL cancelButtonHidden;

/** Allowed orientations for automatic interface rotations. **/
@property (nonatomic, assign) UIInterfaceOrientationMask allowedInterfaceOrientations;

@end
