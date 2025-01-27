//
//  SharedParameters.swift
//  SBBarcodeSDKDemo
//
//  Created by Yevgeniy Knizhnik on 05.12.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

import Foundation
import ScanbotBarcodeScannerSDK

enum SharedParameters {
    static var acceptedBarcodeTypes: Set<SBSDKBarcodeFormat> = Set(SBSDKBarcodeFormats.all)
}
