//
//  SBSDKMedicalPlanDocumentFormat.h
//  ScanbotSDK
//
//  Created by Andrew Petrus on 5/23/19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBSDKBarCodeScannerDocumentFormat.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * German medical plan document subheading receipe information description field type
 */
typedef NS_ENUM(NSInteger, SBSDKMedicalPlanSubheadingReceipeFieldType){
    SBSDKMedicalPlanSubheadingReceipeFieldTypeGeneralInformation,
    SBSDKMedicalPlanSubheadingReceipeFieldTypeReceipeFreeText
};

/**
 * German medical plan document subheading receipe information description field
 */
@interface SBSDKMedicalPlanSubheadingReceipeField : NSObject

/** Field value */
@property (nonatomic, strong) NSString *value;

/** Field type */
@property (nonatomic) SBSDKMedicalPlanSubheadingReceipeFieldType type;

/** Human-readable field type name */
@property (nonatomic, strong, readonly) NSString *typeHumanReadableString;

@end

/**
 * German medical plan document subheading receipe information description
 */
@interface SBSDKMedicalPlanSubheadingReceipe : NSObject

/** Fields */
@property (nonatomic, strong) NSArray<SBSDKMedicalPlanSubheadingReceipeField *> *fields;

@end

/**
 * German medical plan document medicine substance information description field type
 */
typedef NS_ENUM(NSInteger, SBSDKMedicalPlanMedicineSubstanceFieldType) {
    SBSDKMedicalPlanMedicineSubstanceFieldTypeActiveSubstance,
    SBSDKMedicalPlanMedicineSubstanceFieldTypePotency
};

/**
 * German medical plan document medicine substance information description field
 */
@interface SBSDKMedicalPlanMedicineSubstanceField : NSObject

/** Field value */
@property (nonatomic, strong) NSString *value;

/** Field type */
@property (nonatomic) SBSDKMedicalPlanMedicineSubstanceFieldType type;

/** Human-readable field type name */
@property (nonatomic, strong, readonly) NSString *typeHumanReadableString;

@end

/**
 * German medical plan document medicine substance information description
 */
@interface SBSDKMedicalPlanMedicineSubstance : NSObject

/** Fields */
@property (nonatomic, strong) NSArray<SBSDKMedicalPlanMedicineSubstanceField *> *fields;

@end

/**
 * German medical plan document medicine information description field type
 */
typedef NS_ENUM(NSInteger, SBSDKMedicalPlanMedicineFieldType) {
    SBSDKMedicalPlanMedicineFieldTypePharmaceuticalNumber,
    SBSDKMedicalPlanMedicineFieldTypeDrugName,
    SBSDKMedicalPlanMedicineFieldTypeDosageForm,
    SBSDKMedicalPlanMedicineFieldTypeDosageFormFreeText,
    SBSDKMedicalPlanMedicineFieldTypeMorning,
    SBSDKMedicalPlanMedicineFieldTypeMidday,
    SBSDKMedicalPlanMedicineFieldTypeEvening,
    SBSDKMedicalPlanMedicineFieldTypeNight,
    SBSDKMedicalPlanMedicineFieldTypeDosageFreeText,
    SBSDKMedicalPlanMedicineFieldTypeDosingUnit,
    SBSDKMedicalPlanMedicineFieldTypeDosingUnitFreeText,
    SBSDKMedicalPlanMedicineFieldTypeRelevantInfo,
    SBSDKMedicalPlanMedicineFieldTypeReasonForTreatment,
    SBSDKMedicalPlanMedicineFieldTypeGeneralNotes,
};

/**
 * German medical plan document medicine information description field
 */
@interface SBSDKMedicalPlanMedicineField : NSObject

/** Field value */
@property (nonatomic, strong) NSString *value;

/** Field type */
@property (nonatomic) SBSDKMedicalPlanMedicineFieldType type;

/** Human-readable field type name */
@property (nonatomic, strong, readonly) NSString *typeHumanReadableString;

@end

/**
 * German medical plan document medicine information description
 */
@interface SBSDKMedicalPlanMedicine : NSObject

/** Fields */
@property (nonatomic, strong) NSArray<SBSDKMedicalPlanMedicineField *> *fields;

/** Substances */
@property (nonatomic, strong) NSArray<SBSDKMedicalPlanMedicineSubstance *> *substances;

@end

/**
 * German medical plan document subheading information description field type
 */
typedef NS_ENUM(NSInteger, SBSDKMedicalPlanStandardSubheadingFieldType) {
    SBSDKMedicalPlanStandardSubheadingFieldTypeKeyWords,
    SBSDKMedicalPlanStandardSubheadingFieldTypeSubheadingFreeText,
};

/**
 * German medical plan document subheading information description field
 */
@interface SBSDKMedicalPlanStandardSubheadingField : NSObject

/** Field value */
@property (nonatomic, strong) NSString *value;

/** Field type */
@property (nonatomic) SBSDKMedicalPlanStandardSubheadingFieldType type;

/** Human-readable field type name */
@property (nonatomic, strong, readonly) NSString *typeHumanReadableString;

@end

/**
 * German medical plan document subheading information description
 */
@interface SBSDKMedicalPlanStandardSubheading : NSObject

/** General notes */
@property (nonatomic, strong) NSArray<NSString *> *generalNotes;

/** Fields */
@property (nonatomic, strong) NSArray<SBSDKMedicalPlanStandardSubheadingField *> *fields;

/** Medicines */
@property (nonatomic, strong) NSArray<SBSDKMedicalPlanMedicine *> *medicines;

/** Receipes */
@property (nonatomic, strong) NSArray<SBSDKMedicalPlanSubheadingReceipe *> *receipes;

@end

/**
 * German medical plan document doctor information description field type
 */
typedef NS_ENUM(NSInteger, SBSDKMedicalPlanDoctorFieldType) {
    SBSDKMedicalPlanDoctorFieldTypeIssuerName,
    SBSDKMedicalPlanDoctorFieldTypeDoctorNumber,
    SBSDKMedicalPlanDoctorFieldTypePharmacyID,
    SBSDKMedicalPlanDoctorFieldTypeHospitalID,
    SBSDKMedicalPlanDoctorFieldTypeStreet,
    SBSDKMedicalPlanDoctorFieldTypePostalCode,
    SBSDKMedicalPlanDoctorFieldTypePlace,
    SBSDKMedicalPlanDoctorFieldTypeTelephoneNumber,
    SBSDKMedicalPlanDoctorFieldTypeEmail,
    SBSDKMedicalPlanDoctorFieldTypeIssuingDateAndTime
};

/**
 * German medical plan document doctor information description field
 */
@interface SBSDKMedicalPlanDoctorField : NSObject

/** Field value */
@property (nonatomic, strong) NSString *value;

/** Field type */
@property (nonatomic) SBSDKMedicalPlanDoctorFieldType type;

/** Human-readable field type name */
@property (nonatomic, strong, readonly) NSString *typeHumanReadableString;

@end

/**
 * German medical plan document doctor information description
 */
@interface SBSDKMedicalPlanDoctorInformation : NSObject

/** Fields */
@property (nonatomic, strong) NSArray<SBSDKMedicalPlanDoctorField *> *fields;

@end

/**
 * German medical plan document patient information description field type
 */
typedef NS_ENUM(NSInteger, SBSDKMedicalPlanPatientFieldType) {
    SBSDKMedicalPlanPatientFieldTypeFirstName,
    SBSDKMedicalPlanPatientFieldTypeLastName,
    SBSDKMedicalPlanPatientFieldTypeTitle,
    SBSDKMedicalPlanPatientFieldTypePreName,
    SBSDKMedicalPlanPatientFieldTypeSuffix,
    SBSDKMedicalPlanPatientFieldTypePatientID,
    SBSDKMedicalPlanPatientFieldTypeBirthDate,
    SBSDKMedicalPlanPatientFieldTypeGender,
    SBSDKMedicalPlanPatientFieldTypeWeight,
    SBSDKMedicalPlanPatientFieldTypeHeight,
    SBSDKMedicalPlanPatientFieldTypeCreatinineValue,
    SBSDKMedicalPlanPatientFieldTypeAllergysAndIntolerances,
    SBSDKMedicalPlanPatientFieldTypeBreastFeeding,
    SBSDKMedicalPlanPatientFieldTypePregnant,
    SBSDKMedicalPlanPatientFieldTypePatientFreeText
};

/**
 * German medical plan document patient information description field
 */
@interface SBSDKMedicalPlanPatientField : NSObject

/** Field value */
@property (nonatomic, strong) NSString *value;

/** Field type */
@property (nonatomic) SBSDKMedicalPlanPatientFieldType type;

/** Human-readable field type name */
@property (nonatomic, strong, readonly) NSString *typeHumanReadableString;

@end

/**
 * German medical plan document patient information description
 */
@interface SBSDKMedicalPlanPatientInformation : NSObject

/** Fields */
@property (nonatomic, strong) NSArray<SBSDKMedicalPlanPatientField *> *fields;

@end

/**
 * German medical plan document description structure
 */
@interface SBSDKMedicalPlanDocumentFormat : SBSDKBarCodeScannerDocumentFormat

/** Indentifier */
@property (nonatomic, strong) NSString *GUID;

/** Current page */
@property (nonatomic) NSInteger currentPage;

/** Total number of pages in document */
@property (nonatomic) NSInteger totalNumberOfPages;

/** Document version */
@property (nonatomic, strong) NSString *documentVersionNumber;

/** Patch version */
@property (nonatomic, strong) NSString *patchVersionNumber;

/** Language and country code */
@property (nonatomic, strong) NSString *languageCountryCode;

/** Patient information */
@property (nonatomic, strong) SBSDKMedicalPlanPatientInformation *patient;

/** Doctor information */
@property (nonatomic, strong) SBSDKMedicalPlanDoctorInformation *doctor;

/** Subheadings */
@property (nonatomic, strong) NSArray<SBSDKMedicalPlanStandardSubheading *> *subheadings;

@end

NS_ASSUME_NONNULL_END
