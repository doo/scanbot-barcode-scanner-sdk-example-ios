//
//  SBSDKBarCodeScannerSearchResult.h
//  ScanbotSDKBeta
//
//  Created by Andrew Petrus on 17.01.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBSDKPolygon.h"
#import "SBSDKBarCodeScannerDocumentFormat.h"
#import "SBSDKBarcodeType.h"

#import "SBSDKAAMVADocumentFormat.h"
#import "SBSDKIDCardPDF417DocumentFormat.h"
#import "SBSDKSEPADocumentFormat.h"
#import "SBSDKDisabilityCertificateDocumentFormat.h"
#import "SBSDKBoardingPassDocumentFormat.h"
#import "SBSDKMedicalPlanDocumentFormat.h"
#import "SBSDKVCardDocumentFormat.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * Class that encapsulates bar code search and decode result.
 */
@interface SBSDKBarcodeScannerResult : NSObject

/** SBSDKPolygon instance where the bar code was found. */
@property (nonatomic, strong, readonly) SBSDKPolygon *polygon;

/** Bar code type. */
@property (nonatomic, readonly) SBSDKBarcodeType *type;

/** Extracted and warped bar code image. */
@property (nonatomic, strong, readonly) UIImage *barcodeImage;

/** Raw string decoded from found bar code. */
@property (nonatomic, strong, readonly) NSString *rawTextString;

/** Formatted result object depending on scanned bar code document type (if supported). */
@property (nonatomic, strong) SBSDKBarCodeScannerDocumentFormat *formattedResult;

/** Initializer */
- (instancetype)initWithPolygon:(SBSDKPolygon *)poly
                           type:(SBSDKBarcodeType *)type
                   barcodeImage:(UIImage *)image
                  rawTextString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
