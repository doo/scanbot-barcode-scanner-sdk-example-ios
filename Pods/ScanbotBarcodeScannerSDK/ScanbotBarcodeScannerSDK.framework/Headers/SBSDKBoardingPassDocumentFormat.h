//
//  SBSDKBoardingPassDocumentFormat.h
//  ScanbotSDKBeta
//
//  Created by Andrew Petrus on 20.05.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBSDKBarCodeScannerDocumentFormat.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * Boarding pass field types
 */
typedef NS_ENUM(NSInteger, SBSDKBoardingPassDocumentFieldType) {
    SBSDKBoardingPassDocumentFieldTypeOperatingCarrierPNRCode,
    SBSDKBoardingPassDocumentFieldTypeDepartureAirportCode,
    SBSDKBoardingPassDocumentFieldTypeDestinationAirportCode,
    SBSDKBoardingPassDocumentFieldTypeOperatingCarrierDesignator,
    SBSDKBoardingPassDocumentFieldTypeFlightNumber,
    SBSDKBoardingPassDocumentFieldTypeDateOfFlightJulian,
    SBSDKBoardingPassDocumentFieldTypeCompartmentCode,
    SBSDKBoardingPassDocumentFieldTypeSeatNumber,
    SBSDKBoardingPassDocumentFieldTypeCheckInSequenceNumber,
    SBSDKBoardingPassDocumentFieldTypePassengerStatus,
    SBSDKBoardingPassDocumentFieldTypeVersionNumber,
    SBSDKBoardingPassDocumentFieldTypePassengerDescription,
    SBSDKBoardingPassDocumentFieldTypeSourceOfCheckIn,
    SBSDKBoardingPassDocumentFieldTypeSourceOfBoardingPassIssuance,
    SBSDKBoardingPassDocumentFieldTypeDateOfBoardingPassIssuanceJulian,
    SBSDKBoardingPassDocumentFieldTypeDocumentType,
    SBSDKBoardingPassDocumentFieldTypeAirlineDesignatorOfBoardingPassIssuer,
    SBSDKBoardingPassDocumentFieldTypeBaggageTagLicencePlateNumbers,
    SBSDKBoardingPassDocumentFieldTypeFirstNonConsecutiveBaggageTagLicenscePlateNumber,
    SBSDKBoardingPassDocumentFieldTypeSecongNonConsecutiveBaggageTagLicenscePlateNumber,
    SBSDKBoardingPassDocumentFieldTypeAirlineNumericCode,
    SBSDKBoardingPassDocumentFieldTypeDocumentFormSerialNumber,
    SBSDKBoardingPassDocumentFieldTypeSelecteeIndicator,
    SBSDKBoardingPassDocumentFieldTypeInternationalDocumentationVerification,
    SBSDKBoardingPassDocumentFieldTypeMarketingCarrierDesignator,
    SBSDKBoardingPassDocumentFieldTypeFrequentFlyerAirlineDesignator,
    SBSDKBoardingPassDocumentFieldTypeFrequentFlyerNumber,
    SBSDKBoardingPassDocumentFieldTypeIDADIndicator,
    SBSDKBoardingPassDocumentFieldTypeFreeBaggageAllowance,
    SBSDKBoardingPassDocumentFieldTypeFastTrack,
    SBSDKBoardingPassDocumentFieldTypeForIndividualAirlineUse
};

/**
 * Boarding pass leg field description
 */
@interface SBSDKBoardingPassLegField : NSObject
    
/** Field type */
@property (nonatomic) SBSDKBoardingPassDocumentFieldType type;

/** Human-readable field type name */
@property (nonatomic, strong, readonly) NSString *typeHumanReadableString;
    
/** Field value */
@property (nonatomic, strong) NSString *value;

@end

/**
 * Boarding pass leg
 */
@interface SBSDKBoardingPassLeg : NSObject
    
/** Fields vector */
@property (nonatomic, strong) NSArray<SBSDKBoardingPassLegField *> *fields;

@end

/**
 * Boarding pass document description
 */
@interface SBSDKBoardingPassDocumentFormat : SBSDKBarCodeScannerDocumentFormat

/** Number of legs in document */
@property (nonatomic) NSInteger numberOfLegs;

/** Passenger name */
@property (nonatomic, strong) NSString *name;

/** Value indicates that this ticket is an electronic ticket */
@property (nonatomic) BOOL electronicTicket;

/** Security data string */
@property (nonatomic, strong) NSString *securityData;

/** Legs information */
@property (nonatomic, strong) NSArray<SBSDKBoardingPassLeg *> *legs;

@end

NS_ASSUME_NONNULL_END
