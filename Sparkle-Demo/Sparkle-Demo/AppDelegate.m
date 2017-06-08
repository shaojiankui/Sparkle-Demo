//
//  AppDelegate.m
//  Sparkle-Demo
//
//  Created by Jakey on 2017/6/8.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "AppDelegate.h"
#import <Sparkle/Sparkle.h>

@interface AppDelegate () <SUUpdaterDelegate>

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [SUUpdater sharedUpdater].delegate = self;
    [[SUUpdater sharedUpdater] setSendsSystemProfile:YES];
    //............
    [[SUUpdater sharedUpdater] checkForUpdatesInBackground];
}

- (NSString *)feedURLStringForUpdater:(SUUpdater *)updater
{
    NSLog(@"%s: Line-%d:", __func__, __LINE__);
    NSString *feedURLString = [NSBundle mainBundle].infoDictionary[@"SUFeedURL"];
    NSAssert(feedURLString != nil, @"A feed URL should be set in Info.plist");
    
    NSLog(@"feedURLString:%@",feedURLString);
    return feedURLString;
}
- (void)updater:(SUUpdater *)updater didFinishLoadingAppcast:(SUAppcast *)appcast{
    NSLog(@"%s: Line-%d:", __func__, __LINE__);
}
- (void)updater:(SUUpdater *)updater didFindValidUpdate:(SUAppcastItem *)item{
    NSLog(@"%s: Line-%d:", __func__, __LINE__);

}
- (void)updaterDidNotFindUpdate:(SUUpdater *)updater{
    NSLog(@"%s: Line-%d:", __func__, __LINE__);

}
- (void)updater:(SUUpdater *)updater willDownloadUpdate:(SUAppcastItem *)item withRequest:(NSMutableURLRequest *)request{

    NSLog(@"%s: Line-%d:", __func__, __LINE__);

}
- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
