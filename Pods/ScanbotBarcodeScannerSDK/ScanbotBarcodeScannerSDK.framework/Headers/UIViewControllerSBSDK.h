//
//  UIViewControllerSBSDK.h
//  ScanbotSDK
//
//  Created by Sebastian Husche on 26.04.18.
//  Copyright © 2018 doo GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

/** Extension of UIViewController to help with embedding child view controllers. */
@interface UIViewController(SBSDK)

/**
 * Embedds a view controller as child view controller.
 * The child view controllers view is added to the container view, which must be an adjacent view of the receivers view.
 * @param viewController The view controller that be embedded into the receiver.
 * @param containerView The UIView that holds and layouts the embedded view controllers view.
 */
- (void)sbsdk_attachViewController:(nonnull UIViewController *)viewController inView:(nonnull UIView *)containerView;

/**
 * Detaches a child view controller from the receiver and removes its view from the view hierarchy.
 * @param viewController The child view controller that should be removed
 * from the receivers child view controllers hierarchy.
 */
- (void)sbsdk_detachViewController:(nonnull UIViewController *)viewController;

/**
 * Acquires video orientation for camera instance from interface orientation.
 */
- (AVCaptureVideoOrientation)videoOrientationFromInterfaceOrientation NS_EXTENSION_UNAVAILABLE_IOS("Use view controller based solutions where appropriate instead.");

@end
