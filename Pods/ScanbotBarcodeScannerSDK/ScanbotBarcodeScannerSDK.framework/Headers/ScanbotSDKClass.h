//
//  ScanbotSDK.h
//  ScanbotSDK
//
//  Created by Sebastian Husche on 15.07.15.
//  Copyright (c) 2015 doo GmbH. All rights reserved.
//

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#import <Cocoa/Cocoa.h>
#endif

#import "SBSDKFeatures.h"
#import "SBSDKLicenseStatus.h"

/** Typealias for license failure handling block. **/
typedef void (^SBSDKLicenseFailureHandler)(dooLicenseStatus reason, dooFeature feature);

/**
 * Main class of Scanbot SDK. Lets you install the license and allows basic configuration.
 */
@interface ScanbotSDK : NSObject

/**
 * Enables or disables the Scanbot SDK logging. If enabled Scanbot SDK logs various warnings,
 * errors and info to the console. By default logging is off.
 * @param enabled YES, if Scanbot SDK should log, NO otherwise.
 */
+ (void)setLoggingEnabled:(BOOL)enabled;

/**
 * Enables or disables the Scanbot SDK license logging.
 * If enabled Scanbot SDK logs information about the license to the console. By default license logging is enabled.
 * @param enabled YES, if Scanbot SDK should log the license, NO otherwise.
 */
+ (void)setLicenseLoggingEnabled:(BOOL)enabled;


/**
 * A block that is being called when the license or trial time expired.
 * For example you can show an alert to inform your users and the terminate the app.
 * Note: Once the license has expired or is otherwise invalid, none of the SDK classes and functions will
 * return meaningful results.
 */
+ (void)setLicenseFailureHandler:(SBSDKLicenseFailureHandler _Nullable)handler;


/**
 * Sets up the default license failure handler which is being called when the license or trial time expired.
 * The default handler shows an alert to inform your users and terminates the app once the user presses OK.
 */
+ (void)setupDefaultLicenseFailureHandler;

/**
 * Installs the Scanbot SDK license from a string.
 * @param licenseString The string containing the license.
 * @return YES, if the license was installed and is active, NO otherwise.
 */
+ (BOOL)setLicense:(nonnull NSString *)licenseString;

/**
 * Checks the active license.
 * @return YES, if a valid license is installed and not expired or if the trial period is running. NO otherwise.
 */
+ (BOOL)isLicenseValid;


/**
 * The current license status.
 * @return the status of the currently set license.
 */
+ (dooLicenseStatus)licenseStatus;

/**
 * Sets the bundle that contains the additional ScanbotSDK data bundles,
 * which usually is your applications bundle.In this case you dont need to call this function.
 * If you embedded the data bundles in another bundle you must specify it here.
 */
+ (void)setResourceBundle:(NSBundle *_Nonnull)resourceBundle;

/**
 * The bundle that ScanbotSDK searches for its additional data bundles.
 * Defaults to [NSBundle mainBundle].
 */
+ (NSBundle *_Nullable)resourceBundle;


#if TARGET_OS_IPHONE
/**
 Sets the current UIApplication object to ScanbotDK.
 Helps the SDK creating background tasks when performing long running tasks.
 If not set, background tasks cannot be performed.
 @param application The shared application object of the app. Usually this is set to [UIApplication sharedApplication].
 */
+ (void)setSharedApplication:(nonnull UIApplication *)application;

/** @return The current UIApplication object set to the ScanbotDK. */
+ (nullable UIApplication *)sharedApplication;
#endif

@end
