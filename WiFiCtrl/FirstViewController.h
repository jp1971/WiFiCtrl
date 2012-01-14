//
//  FirstViewController.h
//  WiFiCtrl
//
//  Created by Jameson Proctor on 11/10/11.
//  Copyright 2011 JP1971. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncUdpSocket.h"
#import "MySingleton.h"

@interface FirstViewController : UIViewController <AsyncUdpSocketDelegate> {
    IBOutlet UIButton *fwdBtn;
    IBOutlet UIButton *lftBtn;
    IBOutlet UIButton *stpBtn;
    IBOutlet UIButton *rtBtn;
    IBOutlet UIButton *revBtn;
    AsyncUdpSocket *sock;
    MySingleton *mySingleton;
    NSData *tstDat;
}

- (IBAction)fwdBtnDwn;
- (IBAction)lftBtnDwn;
- (IBAction)stpBtnDwn;
- (IBAction)rtBtnDwn;
- (IBAction)revBtnDwn;
- (IBAction)btnUp;

@end
