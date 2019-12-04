//
//  SBSDKSEPADocumentFormat.h
//  ScanbotSDKBeta
//
//  Created by Andrew Petrus on 20.05.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBSDKBarCodeScannerDocumentFormat.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * SEPA document field types
 */
typedef NS_ENUM(NSInteger, SBSDKSEPADocumentFieldType) {
    SBSDKSEPADocumentFieldTypeServiceTag,
    SBSDKSEPADocumentFieldTypeVersion,
    SBSDKSEPADocumentFieldTypeCharacterSet,
    SBSDKSEPADocumentFieldTypeIdentification,
    SBSDKSEPADocumentFieldTypeReceiverIBAN,
    SBSDKSEPADocumentFieldTypeReceiverBIC,
    SBSDKSEPADocumentFieldTypeReceiverName,
    SBSDKSEPADocumentFieldTypeAmount,
    SBSDKSEPADocumentFieldTypeReference,
    SBSDKSEPADocumentFieldTypeHint
};

/**
 * SEPA field
 */
@interface SBSDKSEPADocumentField : NSObject
    
/** Field type */
@property (nonatomic) SBSDKSEPADocumentFieldType type;
    
/** Human-readable field type name */
@property (nonatomic, strong, readonly) NSString *typeHumanReadableString;

/** Field value */
@property (nonatomic, strong) NSString *value;

@end

    
/**
 * SEPA parsed document information
 */
@interface SBSDKSEPADocumentFormat : SBSDKBarCodeScannerDocumentFormat

@property (nonatomic, strong) NSArray<SBSDKSEPADocumentField *> *fields;

@end

NS_ASSUME_NONNULL_END
