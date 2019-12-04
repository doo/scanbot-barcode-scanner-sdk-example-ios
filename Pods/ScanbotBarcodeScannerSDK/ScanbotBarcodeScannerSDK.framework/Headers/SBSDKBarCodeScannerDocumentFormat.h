//
//  SBSDKBarCodeScannerFormattedResult.h
//  ScanbotSDK
//
//  Created by Andrew Petrus on 20.05.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SBSDKBarCodeScannerDocumentFormat : NSObject

@property (nonatomic) BOOL parsedSuccessful;

- (instancetype)initWithString:(NSString *)rawString;

@end

NS_ASSUME_NONNULL_END
