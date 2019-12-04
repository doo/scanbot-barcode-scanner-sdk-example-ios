//
//  SBSDKUIViewController.h
//  ScanbotSDK
//
//  Created by Sebastian Husche on 27.04.18.
//  Copyright © 2018 doo GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SBSDKUIViewController;

/** General delegate protocol for SBSDKUViewController-based classes. */
@protocol SBSDKUIViewControllerDelegate <NSObject>

@optional

/**
 * Informs the delegate, that viewController wants to cancel. If you implement this method and return NO, you are
 * responsible for dismissing the view controller.
 * @param viewController The SBSDKUIViewController instance that wants to cancel.
 * @return YES, if you want to automatically dismiss the view controller. Other delegate methods are called.
 * If you return NO, you are responsible for dismissing the view controller and specific delegate calls.
 */
- (BOOL)viewControllerShouldCancel:(SBSDKUIViewController *_Nonnull)viewController;

/**
 * Informs the delegate, that viewController wants to finish. If you implement this method and return NO, you are
 * responsible for dismissing the view controller.
 * @param viewController The SBSDKUIViewController instance that wants to finish.
 * @return YES, if you want to automatically dismiss the view controller. Other delegate methods are called.
 * If you return NO, you are responsible for dismissing the view controller and specific delegate calls.
 */
- (BOOL)viewControllerShouldFinish:(SBSDKUIViewController *_Nonnull)viewController;

@end

/**
 Abstract base class for SBSDKUI view controllers. Do not use/subclass directly.
 */
@interface SBSDKUIViewController : UIViewController

/** If set to YES, the receiver shows the status bar. Otherwise the status bar is hidden. */
@property (nonatomic, assign) BOOL shouldShowStatusBar;

/** Style of the status bar. */
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

/**
 * The receiver automatically hides the home indicator if set to YES.
 * Does only apply to devices with no home button.
 */
@property (nonatomic, assign) BOOL shouldHideHomeIndicator;

/**
 * Dismisses the receiver. Subclasses should override here and call its delegates.
 * @param cancelled Whether the receiver was cancelled or finished.
 */
- (void)dismiss:(BOOL)cancelled;

/**
 * Automatically closes the receiver if possible.
 * If the receiver is the topViewController of a UINavigationController this method pops the receiver
 * from the navigation stack. If the receiver is presented modally it is dismissed.
 */
- (void)didFinish;

/**
 * Automatically closes the receiver if possible.
 * If the receiver is the topViewController of a UINavigationController this method pops the receiver
 * from the navigation stack. If the receiver is presented modally it is dismissed.
 */
- (void)didCancel;

@end
