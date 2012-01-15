//
//  FirstViewController.h
//  WiFiCtrl
//
//  Created by Jameson Proctor on 11/10/11.
//  Copyright 2011 JP1971. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCDAsyncUdpSocket.h"
#import "MySingleton.h"

@interface FirstViewController : UIViewController <GCDAsyncUdpSocketDelegate> {
    IBOutlet UIButton *fwdBtn;
    IBOutlet UIButton *lftBtn;
    IBOutlet UIButton *stpBtn;
    IBOutlet UIButton *rtBtn;
    IBOutlet UIButton *revBtn;
    GCDAsyncUdpSocket *listen;
    GCDAsyncUdpSocket *socket;
    MySingleton *mySingleton;
    NSData *bcast;
    NSData *fwdDat;
    NSData *rgtDat;
    NSData *revDat;
    NSData *lftDat;
    NSData *stpDat;
    
}

- (IBAction)fwdBtnDwn;
- (IBAction)lftBtnDwn;
- (IBAction)stpBtnDwn;
- (IBAction)rtBtnDwn;
- (IBAction)revBtnDwn;
- (IBAction)btnUp;

@end
