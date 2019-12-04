//
//  SBSDKUIMachineCodeScannerBehaviorConfiguration.h
//  ScanbotSDK
//
//  Created by Yevgeniy Knizhnik on 5/16/18.
//  Copyright © 2018 doo GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBSDKBarcodeImageGenerationType.h"

/**
 * Subconfiguration for the behavior of  bar codes, QR codes
 * and machine readable zones scanners.
 */
@interface SBSDKUIMachineCodeScannerBehaviorConfiguration : NSObject

/**
 * Specifies the way of barcode images generation or disables this generation at all.
 * Use, if you want to receive a full sized image with barcodes.
 * Defaults to SBSDKBarcodeImageGenerationTypeNone.
 */
@property (nonatomic, assign) SBSDKBarcodeImageGenerationType barcodeImageGenerationType;

/** Whether flash is toggled on or off. */
@property (nonatomic, assign, getter=isFlashEnabled) BOOL flashEnabled;

/** Whether scanner screen should make a sound on successful barcode or MRZ detection. */
@property (nonatomic, assign, getter=isSuccessBeepEnabled) BOOL successBeepEnabled;

@end
