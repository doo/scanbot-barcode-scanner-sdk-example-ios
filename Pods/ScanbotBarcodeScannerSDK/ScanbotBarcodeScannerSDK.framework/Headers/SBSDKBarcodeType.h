//
//  SBSDKBarcodeType.h
//  ScanbotSDK
//
//  Created by Sebastian Husche on 05.09.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * Class that represents a barcode type.
 */
@interface SBSDKBarcodeType: NSObject

/** Name of the barcode type. */
@property (nonatomic, readonly) NSString *name;

/** This class cannot be instantiated. */
- (instancetype)init NS_UNAVAILABLE;

/** Returns an array of all valid bar code types. */
+ (NSArray<SBSDKBarcodeType*>*)allTypes;

@end

/** The barcode type Aztec. */
extern SBSDKBarcodeType * const SBSDKBarcodeTypeAztec;

/** The barcode type Codabar. */
extern SBSDKBarcodeType * const SBSDKBarcodeTypeCodaBar;

/** The barcode type Code39. */
extern SBSDKBarcodeType * const SBSDKBarcodeTypeCode39;

/** The barcode type Code93. */
extern SBSDKBarcodeType * const SBSDKBarcodeTypeCode93;

/** The barcode type Code128. */
extern SBSDKBarcodeType * const SBSDKBarcodeTypeCode128;

/** The barcode type DataMatrix. */
extern SBSDKBarcodeType * const SBSDKBarcodeTypeDataMatrix;

/** The barcode type EAN-8. */
extern SBSDKBarcodeType * const SBSDKBarcodeTypeEAN8;

/** The barcode type EAN-13. */
extern SBSDKBarcodeType * const SBSDKBarcodeTypeEAN13;

/** The barcode type Interleaved two-of-five (ITF). */
extern SBSDKBarcodeType * const SBSDKBarcodeTypeITF;

/** The barcode type Maxicode. */
extern SBSDKBarcodeType * const SBSDKBarcodeTypeMaxicode;

/** The barcode type PDF-417. */
extern SBSDKBarcodeType * const SBSDKBarcodeTypePDF417;

/** The barcode type QR. */
extern SBSDKBarcodeType * const SBSDKBarcodeTypeQRCode;

/** The barcode type RSS14. */
extern SBSDKBarcodeType * const SBSDKBarcodeTypeRSS14;

/** The barcode type RSS Expanded. **/
extern SBSDKBarcodeType * const SBSDKBarcodeTypeRSSExpanded;

/** The barcode type UPC-A. */
extern SBSDKBarcodeType * const SBSDKBarcodeTypeUPCA;

/** The barcode type UPC-E. */
extern SBSDKBarcodeType * const SBSDKBarcodeTypeUPCE;

/** The barcode type UPC-EAN Extension. */
extern SBSDKBarcodeType * const SBSDKBarcodeTypeUPCEANExtension;

/** Not a known barcode type. */
extern SBSDKBarcodeType * const SBSDKBarcodeTypeUnknown;

NS_ASSUME_NONNULL_END
