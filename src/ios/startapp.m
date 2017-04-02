#import "startapp.h"

@implementation startapp

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    /*
     Init of the startapp interstitials
     NOTE: replace the ApplicationID and the PublisherID with your own IDs
     */
    STAStartAppSDK* sdk = [STAStartAppSDK sharedInstance];
    sdk.devID = @"107816600";
    sdk.appID = @"204613054";
    
      STASplashPreferences *splashPreferences = [[STASplashPreferences alloc] init];
      splashPreferences.splashMode = STASplashModeTemplate;
       splashPreferences.splashTemplateTheme = STASplashTemplateThemeOcean;
       splashPreferences.splashLoadingIndicatorType = STASplashLoadingIndicatorTypeDots;
       splashPreferences.splashTemplateIconImageName = @"icon";
       splashPreferences.splashTemplateAppName = @"Smarts El-Wady Games";
    
      [sdk showSplashAdWithPreferences:splashPreferences];
    
    
    startAppAd_autoLoad = [[STAStartAppAd alloc] init];
    startAppAd_loadShow = [[STAStartAppAd alloc] init];
    
}


#pragma mark View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    // View defaults to full size.  If you want to customize the view's size, or its subviews (e.g. webView),
    // you can do so here.
    
    [super viewWillAppear:animated];
    
    // loading the StartApp Ad
    [startAppAd_autoLoad loadAdWithDelegate:self];
    
    
    /*
     
     
     if (startAppBanner_auto == nil) {
     startAppBanner_auto = [[STABannerView alloc] initWithSize:STA_AutoAdSize
     autoOrigin:STAAdOrigin_Bottom
     withView:self.view withDelegate:nil];
     [self.view addSubview:startAppBanner_auto];
     }
    
     
     
     */

    
    
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
    // notify StartApp auto Banner orientation change
    [startAppBanner_auto didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    
    // notify StartApp fixed position Banner orientation change
    [startAppBanner_fixed didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation ];
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

// Tell the system It should autorotate
- (BOOL) shouldAutorotate{
    return YES && (startAppAd_loadShow.STAShouldAutoRotate || startAppAd_autoLoad.STAShouldAutoRotate);
}

// StartApp Ad loaded successfully
- (void) didLoadAd:(STAAbstractAd*)ad;
{
    NSLog(@"StartApp Ad had been loaded successfully");
    
    // Show the Ad
    if (startAppAd_loadShow == ad) {
        [startAppAd_loadShow showAd];
    }
}

// StartApp Ad failed to load
- (void) failedLoadAd:(STAAbstractAd*)ad withError:(NSError *)error;
{
    NSLog(@"StartApp Ad had failed to load");
}

// StartApp Ad is being displayed
- (void) didShowAd:(STAAbstractAd*)ad;
{
    NSLog(@"StartApp Ad is being displayed");
}

// StartApp Ad failed to display
- (void) failedShowAd:(STAAbstractAd*)ad withError:(NSError *)error;
{
    
    NSLog(@"StartApp Ad is failed to display");
    if (startAppAd_autoLoad == ad) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Can't show ad" message:@"Ad is not loaded yet, please try again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}

- (void) didCloseAd:(STAAbstractAd*)ad {
    if (startAppAd_autoLoad == ad) {
        [startAppAd_autoLoad loadAd:STAAdType_Automatic withDelegate:self];
    }
}
