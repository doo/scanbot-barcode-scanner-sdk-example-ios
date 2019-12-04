//
//  SBSDKVCardDocumentFormat.h
//  ScanbotSDK
//
//  Created by Andrew Petrus on 02.07.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBSDKBarCodeScannerDocumentFormat.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * vCard document field type
 */
typedef NS_ENUM(NSInteger, SBSDKVCardDocumentFieldType) {
    SBSDKVCardDocumentFieldTypeVersion,
    SBSDKVCardDocumentFieldTypeSource,
    SBSDKVCardDocumentFieldTypeKind,
    SBSDKVCardDocumentFieldTypeXML,
    SBSDKVCardDocumentFieldTypeName,
    SBSDKVCardDocumentFieldTypeFirstName,
    SBSDKVCardDocumentFieldTypeNickname,
    SBSDKVCardDocumentFieldTypeBirthday,
    SBSDKVCardDocumentFieldTypeAnniversary,
    SBSDKVCardDocumentFieldTypeGender,
    SBSDKVCardDocumentFieldTypeDeliveryAddress,
    SBSDKVCardDocumentFieldTypePhoto,
    SBSDKVCardDocumentFieldTypeTelephoneNumber,
    SBSDKVCardDocumentFieldTypeEmail,
    SBSDKVCardDocumentFieldTypeIMPP,
    SBSDKVCardDocumentFieldTypeLanguages,
    SBSDKVCardDocumentFieldTypeTimeZone,
    SBSDKVCardDocumentFieldTypeGeoLocation,
    SBSDKVCardDocumentFieldTypeTitle,
    SBSDKVCardDocumentFieldTypeRole,
    SBSDKVCardDocumentFieldTypeLogo,
    SBSDKVCardDocumentFieldTypeOrganisation,
    SBSDKVCardDocumentFieldTypeMember,
    SBSDKVCardDocumentFieldTypeRelated,
    SBSDKVCardDocumentFieldTypeCategories,
    SBSDKVCardDocumentFieldTypeNote,
    SBSDKVCardDocumentFieldTypeProductId,
    SBSDKVCardDocumentFieldTypeRevision,
    SBSDKVCardDocumentFieldTypeSound,
    SBSDKVCardDocumentFieldTypeUID,
    SBSDKVCardDocumentFieldTypeClientPIDMap,
    SBSDKVCardDocumentFieldTypeURL,
    SBSDKVCardDocumentFieldTypePublicKey,
    SBSDKVCardDocumentFieldTypeBusyTimeURL,
    SBSDKVCardDocumentFieldTypeCallendarURIForRequests,
    SBSDKVCardDocumentFieldTypeCallendarURI,
    SBSDKVCardDocumentFieldTypeCustom
};

/**
 * vCard document field description
 */
@interface SBSDKVCardDocumentField : NSObject

/** Raw field value */
@property (nonatomic, strong) NSString *rawText;

/** Field type */
@property (nonatomic) SBSDKVCardDocumentFieldType type;

/** Field type modifiers */
@property (nonatomic, strong) NSArray<NSString *> *typeModifiers;

/** Field values */
@property (nonatomic, strong) NSArray<NSString *> *values;

/** Human-readable field type name */
@property (nonatomic, strong, readonly) NSString *typeHumanReadableString;

@end

/**
 * vCard document description
 */
@interface SBSDKVCardDocumentFormat : SBSDKBarCodeScannerDocumentFormat

/** Document fields */
@property (nonatomic, strong) NSArray<SBSDKVCardDocumentField *> *fields;

@end

NS_ASSUME_NONNULL_END
