//
//  SBSDKUIEnableCameraTextConfiguration.h
//  ScanbotSDKBundle
//
//  Created by Yevgeniy Knizhnik on 11/20/18.
//  Copyright © 2018 doo GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Subconfiguration for the textual contents of camera based view controllers.
 */
@interface SBSDKUIEnableCameraTextConfiguration : NSObject

/** String being displayed on the label describing the camera access requirement. */
@property (nonnull, nonatomic, strong) NSString *enableCameraExplanationText;

/** String being displayed on the button to request camera access. */
@property (nonnull, nonatomic, strong) NSString *enableCameraButtonTitle;

@end
