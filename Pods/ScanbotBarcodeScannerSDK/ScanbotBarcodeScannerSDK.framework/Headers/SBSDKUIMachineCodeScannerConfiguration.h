//
//  SBSDKUIMachineCodeScannerConfiguration.h
//  ScanbotSDKBundle
//
//  Created by Yevgeniy Knizhnik on 3/29/18.
//  Copyright © 2018 doo GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBSDKUIMachineCodeScannerUIConfiguration.h"
#import "SBSDKUIMachineCodeScannerTextConfiguration.h"
#import "SBSDKUIMachineCodeScannerBehaviorConfiguration.h"

/**
 * This class describes the look and feel, as well as the textual contents of the detection
 * screens for bar codes, QR codes and machine readable zones.
 * Use the 'defaultConfiguration' class method to retrieve an instance and modify it.
 */
@interface SBSDKUIMachineCodeScannerConfiguration : NSObject

/** Not available. */
- (nonnull instancetype)init NS_UNAVAILABLE;

/** Not available. */
+ (nonnull instancetype)new NS_UNAVAILABLE;

/**
 * Designated initializer. Creates a new instance of 'SBSDKUIMachineCodeScannerConfiguration' and returns it.
 * @param uiConfiguration A subconfiguration for the user interface. Defines colors and sizes.
 * @param textConfiguration A subconfiguration for text being displayed in the MRZ scanner screen.
 * @param behaviorConfiguration A subconfiguration for MRZ scanner behavior.
 */
- (nonnull instancetype)initWithUIConfiguration:(nonnull SBSDKUIMachineCodeScannerUIConfiguration *)uiConfiguration
                              textConfiguration:(nonnull SBSDKUIMachineCodeScannerTextConfiguration *)textConfiguration
                              behaviorConfiguration:(nonnull SBSDKUIMachineCodeScannerBehaviorConfiguration *)behaviorConfiguration
                              NS_DESIGNATED_INITIALIZER;

/**
 * The default configuration.
 * @return A mutable instance of 'SBSDKUIMachineCodeScannerConfiguration' with default values.
 */
+ (nonnull SBSDKUIMachineCodeScannerConfiguration *)defaultConfiguration;

/** The user interface subconfiguration. */
@property (nonnull, nonatomic, strong, readonly) SBSDKUIMachineCodeScannerUIConfiguration *uiConfiguration;

/** The subconfiguration for displayed texts. */
@property (nonnull, nonatomic, strong, readonly) SBSDKUIMachineCodeScannerTextConfiguration *textConfiguration;

/** The subconfiguration for behavior. */
@property (nonnull, nonatomic, strong, readonly) SBSDKUIMachineCodeScannerBehaviorConfiguration *behaviorConfiguration;

@end
