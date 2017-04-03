#import "startapp.h"

@implementation startapp

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // initialize the SDK with your appID
    STAStartAppSDK* sdk = [STAStartAppSDK sharedInstance];
    sdk.appID = @"204613054";

    return YES;
}
