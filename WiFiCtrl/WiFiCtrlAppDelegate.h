//
//  WiFiCtrlAppDelegate.h
//  WiFiCtrl
//
//  Created by Jameson Proctor on 11/10/11.
//  Copyright 2011 JP1971. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WiFiCtrlAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    NSString *port;
}

@property (nonatomic, retain) NSString *port;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
