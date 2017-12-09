#import <Foundation/Foundation.h>

@interface QrCodeWrapper: NSObject

typedef NS_ENUM(NSInteger, ErrorTolerance) {
    Low,
    Medium,
    Quartile,
    High
};

+(NSString *)toSVGXML:(NSString *)text withErrorTolerance:(ErrorTolerance) errorTolerance;

@end
