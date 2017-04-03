#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "STAStartAppSDK.h"
#import "STAAbstractAd.h"
#import "STAStartAppAd.h"
#import "STAStartAppNativeAd.h"
#import "STANativeAdDetails.h"
#import "STABannerSize.h"
#import "STABannerView.h"
#import "STASplashPreferences.h"


@interface startapp : CDVPlugin <STADelegateProtocol>
{
    
STAStartAppAd *startAppAd_autoLoad;
STAStartAppAd *startAppAd_loadShow;
STABannerView *startAppBanner_auto;
STABannerView *startAppBanner_fixed;
    
}
@end