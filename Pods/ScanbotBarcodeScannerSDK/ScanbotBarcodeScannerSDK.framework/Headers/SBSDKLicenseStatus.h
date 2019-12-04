//
//  SBSDKLicenseStatus.h
//  ScanbotSDK
//
//  Created by Sebastian Husche on 27.09.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

#ifndef LicenseStatus_h
#define LicenseStatus_h

typedef enum: int64_t {
    LicenseStatusOkay = 0,
    LicenseStatusTrial = 1,
    LicenseStatusFailureNotSet = 10,
    LicenseStatusFailureCorrupted = 11,
    LicenseStatusFailureWrongOS = 12,
    LicenseStatusFailureAppIDMismatch = 13,
    LicenseStatusFailureExpired = 14
    
} dooLicenseStatus;

#endif /* LicenseStatus_h */
