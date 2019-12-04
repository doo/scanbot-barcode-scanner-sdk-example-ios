//
//  SBSDKUICameraViewController.h
//  ScanbotSDKBundle
//
//  Created by Yevgeniy Knizhnik on 11/20/18.
//  Copyright © 2018 doo GmbH. All rights reserved.
//

#import "SBSDKUIViewController.h"
#import <UIKit/UIKit.h>
#import "SBSDKUIEnableCameraTextConfiguration.h"
#import "SBSDKUIEnableCameraUIConfiguration.h"

/**
 * A SBSDKUIViewController subclass which adds support for enabled and disabled camera permission.
 **/
@interface SBSDKUICameraViewController : SBSDKUIViewController

/**
 * A container where Enable Camera View should be put.
 **/
- (nonnull UIView *)containerForEnableCameraView;

/**
 * A method for subclassing. Override to perform custom actions before appearing of Enable Camera View.
 * For example - show container or hide some buttons.
 **/
- (void)willShowEnableCameraView;

/**
 * A method for subclassing. Override to perform custom actions after disappearing of Enable Camera View.
 * For example - hide container or show some buttons.
 **/
- (void)didHideEnableCameraView;

/**
 Is called when the application became active
 */
- (void)applicationDidBecomeActive;

/**
 * A text configuration, used for Enable Camera View.
 **/
- (nullable SBSDKUIEnableCameraTextConfiguration *)enableCameraTextConfiguration;

/**
 * A UI configuration, used for Enable Camera View.
 **/
- (nullable SBSDKUIEnableCameraUIConfiguration *)enableCameraUIConfiguration;

@end
