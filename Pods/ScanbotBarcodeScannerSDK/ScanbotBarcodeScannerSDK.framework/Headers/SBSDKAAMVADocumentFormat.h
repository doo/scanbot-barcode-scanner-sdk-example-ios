//
//  SBSDKAAMVADocument.h
//  ScanbotSDK
//
//  Created by Andrew Petrus on 20.05.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBSDKBarCodeScannerDocumentFormat.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, SBSDKAAMVARecordFieldType) {
    SBSDKAAMVARecordFieldTypeUnknown,
    SBSDKAAMVARecordFieldTypeFullName,
    SBSDKAAMVARecordFieldTypeLastName,
    SBSDKAAMVARecordFieldTypeFamilyName,
    SBSDKAAMVARecordFieldTypeFirstName,
    SBSDKAAMVARecordFieldTypeMiddleNameOrInitial,
    SBSDKAAMVARecordFieldTypeNameSuffix,
    SBSDKAAMVARecordFieldTypeNamePrefix,
    SBSDKAAMVARecordFieldTypeMailingStreetAddress1,
    SBSDKAAMVARecordFieldTypeMailingStreetAddress2,
    SBSDKAAMVARecordFieldTypeMailingCity,
    SBSDKAAMVARecordFieldTypeMailingJurisdictionCode,
    SBSDKAAMVARecordFieldTypeMailingPostalCode,
    SBSDKAAMVARecordFieldTypeResidenceStreetAddress1,
    SBSDKAAMVARecordFieldTypeResidenceStreetAddress2,
    SBSDKAAMVARecordFieldTypeResidenceCity,
    SBSDKAAMVARecordFieldTypeResidenceJurisdictionCode,
    SBSDKAAMVARecordFieldTypeResidencePostalCode,
    SBSDKAAMVARecordFieldTypeLicenseOrIdNumber,
    SBSDKAAMVARecordFieldTypeLicenseClassificationCode,
    SBSDKAAMVARecordFieldTypeLicenseRestrictionCode,
    SBSDKAAMVARecordFieldTypeLicenseEndorsementsCode,
    SBSDKAAMVARecordFieldTypeHeightInFeetInches,
    SBSDKAAMVARecordFieldTypeHeightInCM,
    SBSDKAAMVARecordFieldTypeWeightInLBS,
    SBSDKAAMVARecordFieldTypeWeightInKG,
    SBSDKAAMVARecordFieldTypeEyesColor,
    SBSDKAAMVARecordFieldTypeHairColor,
    SBSDKAAMVARecordFieldTypeLicenseExpirationDate,
    SBSDKAAMVARecordFieldTypeDateOfBirth,
    SBSDKAAMVARecordFieldTypeSex,
    SBSDKAAMVARecordFieldTypeLicenseOrIdDocumentIssueDate,
    SBSDKAAMVARecordFieldTypeIssueTimestamp,
    SBSDKAAMVARecordFieldTypeNumberOfDuplicates,
    SBSDKAAMVARecordFieldTypeMedicalIndicatorCodes,
    SBSDKAAMVARecordFieldTypeOrganDonor,
    SBSDKAAMVARecordFieldTypeNonResidentIndicator,
    SBSDKAAMVARecordFieldTypeUniqueCustomerIdentifier,
    SBSDKAAMVARecordFieldTypeSocialSecurityNumber,
    SBSDKAAMVARecordFieldTypeSuffix,
    SBSDKAAMVARecordFieldTypePrefix,
    SBSDKAAMVARecordFieldTypeVirginiaSpecificClass,
    SBSDKAAMVARecordFieldTypeVirginiaSpecificRestrictions,
    SBSDKAAMVARecordFieldTypeVirginiaSpecificEndorsements,
    SBSDKAAMVARecordFieldTypePhysicalDescriptionWeightRange,
    SBSDKAAMVARecordFieldTypeDocumentDiscriminator,
    SBSDKAAMVARecordFieldTypeCountryTerritoryOfIssuance,
    SBSDKAAMVARecordFieldTypeFederalCommercialVehicleCodes,
    SBSDKAAMVARecordFieldTypePlaceOfBirth,
    SBSDKAAMVARecordFieldTypeAuditInformation,
    SBSDKAAMVARecordFieldTypeInventoryControlNumber,
    SBSDKAAMVARecordFieldTypeRaceEthnicity,
    SBSDKAAMVARecordFieldTypeStandardVehicleClassification,
    SBSDKAAMVARecordFieldTypeStandardEndorsementCode,
    SBSDKAAMVARecordFieldTypeStandardRestrictionCode,
    SBSDKAAMVARecordFieldTypeJurisdictionSpecificVehicleClassificationDescription,
    SBSDKAAMVARecordFieldTypeJurisdictionSpecific,
    SBSDKAAMVARecordFieldTypeJurisdictionSpecificRestrictionCodeDescription,
    SBSDKAAMVARecordFieldTypeComplianceType,
    SBSDKAAMVARecordFieldTypeCardRevisionDate,
    SBSDKAAMVARecordFieldTypeHazMatEndorsementExpiryDate,
    SBSDKAAMVARecordFieldTypeLimitedDurationDocumentIndicator,
    SBSDKAAMVARecordFieldTypeFamilyNameTruncation,
    SBSDKAAMVARecordFieldTypeFirstNamesTruncation,
    SBSDKAAMVARecordFieldTypeMiddleNamesTruncation,
    SBSDKAAMVARecordFieldTypeUnder18Until,
    SBSDKAAMVARecordFieldTypeUnder19Until,
    SBSDKAAMVARecordFieldTypeUnder21Until,
    SBSDKAAMVARecordFieldTypeOrganDonorIndicator,
    SBSDKAAMVARecordFieldTypeVeteranIndicator,
    SBSDKAAMVARecordFieldTypePermitClassificationCode,
    SBSDKAAMVARecordFieldTypePermitExpirationDate,
    SBSDKAAMVARecordFieldTypePermitIdentifier,
    SBSDKAAMVARecordFieldTypePermitIssueDate,
    SBSDKAAMVARecordFieldTypePermitRestrictionCode,
    SBSDKAAMVARecordFieldTypePermitEndorsementCode,
    SBSDKAAMVARecordFieldTypeCourtRestrictionCode,
};

/**
 * AAMVA document subfile field
 */
@interface SBSDKAAMVADocumentSubfileField : NSObject
    
/** Field type */
@property (nonatomic) SBSDKAAMVARecordFieldType type;

/** Field type string */
@property (nonatomic, strong) NSString *typeString;

/** Human-readable field type name */
@property (nonatomic, strong, readonly) NSString *typeHumanReadableString;
    
/** Field formatted value */
@property (nonatomic, strong) NSString *value;

/** Field raw value */
@property (nonatomic, strong) NSString *rawValue;

@end

/**
 * AAMVA document subfile
 */
@interface SBSDKAAMVADocumentSubfile : NSObject

/** Type of this subfile */
@property (nonatomic, strong) NSString *subFileType;

/** Subfile raw header string */
@property (nonatomic, strong) NSString *subFileRawHeaderString;

/** Parsed fields */
@property (nonatomic, strong) NSArray<SBSDKAAMVADocumentSubfileField *> *fields;

@end

/**
 * AAMVA document
 */
@interface SBSDKAAMVADocumentFormat : SBSDKBarCodeScannerDocumentFormat

/** Raw header string */
@property (nonatomic, strong) NSString *headerRawString;

/** AAMVA file type */
@property (nonatomic, strong) NSString *fileType;

/** Issuer identification number */
@property (nonatomic, strong) NSString *issuerIdentificationNumber;

/** Document version string */
@property (nonatomic, strong) NSString *AAMVAVersionNumber;

/** Jurisdiction version string */
@property (nonatomic, strong) NSString *jurisdictionVersionNumber;

/** Number of entries in the documents */
@property (nonatomic) NSInteger numberOfEntries;

/** Vector of document's subfiles */
@property (nonatomic, strong) NSArray<SBSDKAAMVADocumentSubfile *> *subfiles;

@end

NS_ASSUME_NONNULL_END
