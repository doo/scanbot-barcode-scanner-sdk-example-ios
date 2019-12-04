//
//  SBSDKBarcodeImageGenerationType.h
//  ScanbotSDK
//
//  Created by Yevgeniy Knizhnik on 25.11.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

/**
 * The type of barcode image generation.
 */
typedef NS_ENUM(NSUInteger, SBSDKBarcodeImageGenerationType) {
    /**
     * No barcode image generation.
     */
    SBSDKBarcodeImageGenerationTypeNone,
    
    /**
     * Generating barcode image from the last video frame. Faster, but has lower resolution.
     */
    SBSDKBarcodeImageGenerationTypeFromVideoFrame,
    
    /**
     * Generating barcode image from separately captured frame. Higher resolution, but might have a slight delay.
     */
    SBSDKBarcodeImageGenerationTypeCapturedImage
};
