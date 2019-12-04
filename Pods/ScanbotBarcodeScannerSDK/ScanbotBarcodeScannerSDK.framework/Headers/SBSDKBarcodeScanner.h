//
//  SBSDKBarcodeScanner.h
//  ScanbotSDK
//
//  Created by Andrew Petrus on 17.01.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "SBSDKBarcodeScannerResult.h"

NS_ASSUME_NONNULL_BEGIN

@class SBSDKBarcodeScannerResult;

/**
 * Wrapper class for searching and decoding multiple types of barcodes. Recognition is performed on still UIImage
 * or SampleBufferRef, result is incapsulated in an array of SBSDKBarcodeScannerResult instances.
 */
@interface SBSDKBarcodeScanner : NSObject

/**
 * Creates an SBSDKBarcodeScanner with no frame accumulator for detecting all supported barcode types
 */
- (instancetype)init;

/**
 * Creates an SBSDKBarcodeScanner with no frame accumulator for detecting only the given barcode types
 * @param barCodeTypes Bar code types to limit detection results to.
 */
- (instancetype)initWithTypes:(NSArray<SBSDKBarcodeType *> *)barCodeTypes;

/**
 * Creates an SBSDKBarcodeScanner that accumulates multiple frames before returning a detection result.
 * The barcode scanner's detect* methods will return empty results until they've been called the
 * given number of times. Then, they will perform detection on the frame with the least
 * amount of blur. Intended for use with live detection.
 * @param accumulatedFrames Number of frames to accumulate before running detection on the sharpest one.
 * @param barCodeTypes Bar code types to limit detection results to.
 */
- (instancetype)initWithFrameAccumulator:(int)accumulatedFrames
                                   types:(NSArray<SBSDKBarcodeType *> *)barCodeTypes;


/**
 * Search and decode specified types of bar codes on given image.
 * @param image The image where search is to be done.
 * @param barCodeTypes Specified bar code types.
 * @return List of found barcodes.
 */
- (nonnull NSArray<SBSDKBarcodeScannerResult *> *)detectBarCodesOnImage:(nonnull UIImage *)image;

/**
 * Search and decode specified types of bar codes on given image.
 * @param image The image where search is to be done.
 * @param inRect Rectangle in image coordinates in which to perform the search. Must be inside the image.
 * @return List of found barcodes.
 */
- (nonnull NSArray<SBSDKBarcodeScannerResult *> *)detectBarCodesOnImage:(nonnull UIImage *)image
                                                                 inRect:(CGRect)rect;

- (NSArray<SBSDKBarcodeScannerResult *> *)detectBarCodesOnImage:(UIImage *)image
                                                    orientation:(AVCaptureVideoOrientation)videoOrientation
                                                         inRect:(CGRect)rect;

/**
 * Search and decode specified types of bar codes from sample buffer reference.
 * @param sampleBufferRef The sample buffer reference.
 * @param barCodeTypes Specified bar code types.
 * @param videoOrientation Video frame orientation.
 * @return List of found barcodes.
 */
- (nonnull NSArray<SBSDKBarcodeScannerResult *> *)detectBarCodesOnSampleBuffer:(nonnull CMSampleBufferRef)sampleBuffer
                                                                   orientation:(AVCaptureVideoOrientation)videoOrientation;

/**
 * Search and decode specified types of bar codes from sample buffer reference.
 * @param sampleBuffer The sample buffer reference.
 * @param videoOrientation Video frame orientation.
 * @param inRect Rectangle in image coordinates in which to perform the search. Must be inside the image.
 * @return List of found barcodes.
 */
- (nonnull NSArray<SBSDKBarcodeScannerResult *> *)detectBarCodesOnSampleBuffer:(nonnull CMSampleBufferRef)sampleBuffer
                                                                   orientation:(AVCaptureVideoOrientation)videoOrientation
                                                                        inRect:(CGRect)rect;


- (UIImage *)showOutput:(nonnull CMSampleBufferRef)sampleBuffer orientation:(AVCaptureVideoOrientation)videoOrientation;

@end

NS_ASSUME_NONNULL_END
