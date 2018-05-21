#import "QCloudTestAVersion.h"
NSString * const QCloudTestAModuleVersion = @"0.1.0";
NSString * const QCloudTestAModuleName = @"QCloudTestA";
@interface QCloudQCloudTestALoad : NSObject
@end

@implementation QCloudQCloudTestALoad
+ (void) load
{
    Class cla = NSClassFromString(@"QCloudSDKModuleManager");
    if (cla) {
        NSMutableDictionary* module = [@{
                                 @"name" : QCloudTestAModuleName,
                                 @"version" : QCloudTestAModuleVersion
                                 } mutableCopy];

          NSString* buglyID = @"";
          if (buglyID.length > 0) {
              module[@"crashID"] = buglyID;
          }

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
        id share = [cla performSelector:@selector(shareInstance)];
        [share performSelector:@selector(registerModuleByJSON:) withObject:module];
#pragma clang diagnostic pop
    }
}
@end