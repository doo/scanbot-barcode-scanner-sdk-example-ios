//
//  SBSDKUIEnableCameraUIConfiguration.h
//  ScanbotSDKBundle
//
//  Created by Yevgeniy Knizhnik on 11/21/18.
//  Copyright © 2018 doo GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * Subconfiguration for the user interface of camera based view controllers.
 */
@interface SBSDKUIEnableCameraUIConfiguration : NSObject

/** Color of the Enable Camera button. */
@property (nonnull, nonatomic, strong) UIColor *enableCameraButtonColor;

/** Color of the description text and icon in EnableCamera view. */
@property (nonnull, nonatomic, strong) UIColor *enableCameraDesctiptionColor;

/**  Color of the background in EnableCamera view. */
@property (nonnull, nonatomic, strong) UIColor *enableCameraBackgroundColor;

@end
