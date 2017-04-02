#import <UIKit/UIKit.h>
#import <StartApp/StartApp.h>

@interface startapp : CDVPlugin <STADelegateProtocol>
{
    
STAStartAppAd *startAppAd_autoLoad;
STAStartAppAd *startAppAd_loadShow;
STABannerView *startAppBanner_auto;
STABannerView *startAppBanner_fixed;
    
}
@end