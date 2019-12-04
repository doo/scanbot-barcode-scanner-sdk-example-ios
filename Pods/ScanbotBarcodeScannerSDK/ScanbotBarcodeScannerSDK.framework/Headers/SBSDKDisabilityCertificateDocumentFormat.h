//
//  SBSDKDisabilityCertificateDocumentFormat.h
//  ScanbotSDKBeta
//
//  Created by Andrew Petrus on 20.05.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBSDKBarCodeScannerDocumentFormat.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * DC document field types
 */
typedef NS_ENUM(NSInteger, SBSDKDisabilityCertificateDocumentFieldType) {
    SBSDKDisabilityCertificateDocumentFieldTypeRequiresCare,
    SBSDKDisabilityCertificateDocumentFieldTypeAccident,
    SBSDKDisabilityCertificateDocumentFieldTypeInitialCertificate,
    SBSDKDisabilityCertificateDocumentFieldTypeRenewedCertificate,
    SBSDKDisabilityCertificateDocumentFieldTypeWorkAccident,
    SBSDKDisabilityCertificateDocumentFieldTypeAssignedToAccidentInsuranceDoctor,
    SBSDKDisabilityCertificateDocumentFieldTypeIncapableOfWorkSince,
    SBSDKDisabilityCertificateDocumentFieldTypeIncapableOfWorkUntil,
    SBSDKDisabilityCertificateDocumentFieldTypeDiagnosedOn,
    SBSDKDisabilityCertificateDocumentFieldTypeDocumentDate,
    SBSDKDisabilityCertificateDocumentFieldTypeBirthDate,
    SBSDKDisabilityCertificateDocumentFieldTypeFirstName,
    SBSDKDisabilityCertificateDocumentFieldTypeLastName,
    SBSDKDisabilityCertificateDocumentFieldTypeDiagnose,
    SBSDKDisabilityCertificateDocumentFieldTypeHealthInsuranceNumber,
    SBSDKDisabilityCertificateDocumentFieldTypeInsuredPersonNumber,
    SBSDKDisabilityCertificateDocumentFieldTypeStatus,
    SBSDKDisabilityCertificateDocumentFieldTypePlaceOfOperationNumber,
    SBSDKDisabilityCertificateDocumentFieldTypeDoctorNumber
};

/**
 * Field description
 */
@interface SBSDKDisabilityCertificateDocumentField : NSObject
    
/** Field type */
@property (nonatomic) SBSDKDisabilityCertificateDocumentFieldType type;

/** Human-readable field type name */
@property (nonatomic, strong, readonly) NSString *typeHumanReadableString;
    
/** Field value */
@property (nonatomic, strong) NSString *value;

@end

/**
 * Class for parsing data obtained from QR code on disability certificates
 */
@interface SBSDKDisabilityCertificateDocumentFormat : SBSDKBarCodeScannerDocumentFormat

@property (nonatomic, strong) NSArray<SBSDKDisabilityCertificateDocumentField *> *fields;

@end

NS_ASSUME_NONNULL_END
