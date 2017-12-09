//
//  OCPP.cpp
//  SwiftAndCPP
//
//  Created by Fran on 12/8/17.
//  Copyright © 2017 franfernandez. All rights reserved.
//

#include "QrCodeWrapper.h"
#include "QrCode.hpp"

@implementation QrCodeWrapper

+ (NSString *)toSVGXML:(NSString *)text withErrorTolerance:(ErrorTolerance) tolerance {
    qrcodegen::QrCode::Ecc ecc = qrcodegen::QrCode::Ecc::LOW;
    switch (tolerance) {
        case Low:
            ecc = qrcodegen::QrCode::Ecc::LOW;
            break;
        case Medium:
            ecc = qrcodegen::QrCode::Ecc::MEDIUM;
            break;
        case Quartile:
            ecc = qrcodegen::QrCode::Ecc::QUARTILE;
            break;
        case High:
            ecc = qrcodegen::QrCode::Ecc::HIGH;
            break;
    }
    const char *data = [text UTF8String];
    qrcodegen::QrCode qrCode = qrcodegen::QrCode::encodeText(data, ecc);
    return [NSString stringWithCString:qrCode.toSvgString(4).c_str() encoding:NSUTF8StringEncoding];
}

@end
