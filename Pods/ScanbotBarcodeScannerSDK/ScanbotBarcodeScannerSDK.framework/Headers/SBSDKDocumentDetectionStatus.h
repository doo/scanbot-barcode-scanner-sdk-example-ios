//
// SBSDKDocumentDetectionStatus.h
//  doo-ios
//
//  Created by Sebastian Husche on 09.01.14.
//  Copyright (c) 2014 doo GmbH. All rights reserved.
//

#ifndef doo_ios_DocumentDetectionStatus_h
#define doo_ios_DocumentDetectionStatus_h

/**
 The status of the latest document detection.
 */
typedef enum SBSDKDocumentDetectionStatus: int {
    /** The status is unknown, detection has not yet happened. */
    SBSDKDocumentDetectionStatusNotAcquired = 0,
    /** An acceptable polygon was detected. */
    SBSDKDocumentDetectionStatusOK = 100,
    /** A polygon was detected, but its size is too small. */
    SBSDKDocumentDetectionStatusOK_SmallSize = 101,
    /** A polygon was detected, but it has too much perspective distortion. */
    SBSDKDocumentDetectionStatusOK_BadAngles = 102,
    /** A polygon was detected, but its aspect ratio should be landscape/portrait but is portrait/landscape. */
    SBSDKDocumentDetectionStatusOK_BadAspectRatio = 103,
    /** A polygon was detected, but its center is too far away from the image center. */
    SBSDKDocumentDetectionStatusOK_OffCenter = 104,
    /** No polygon detected at all. */
    SBSDKDocumentDetectionStatusError_NothingDetected = 200,
    /** No polygon detected, image too dark. */
    SBSDKDocumentDetectionStatusError_Brightness = 201,
    /** No polygon detected, image too noisy (background). */
    SBSDKDocumentDetectionStatusError_Noise = 202
} SBSDKDocumentDetectionStatus;

/**
 Checks, if the status is on of the OK statuses.
 @param status The status to check.
 @return True, if the status in one of the OK statuses. False otherwise.
 */
bool isDetectionStatusOK(SBSDKDocumentDetectionStatus status);

#endif
