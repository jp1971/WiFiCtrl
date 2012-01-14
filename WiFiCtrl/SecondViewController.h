//
//  SecondViewController.h
//  WiFiCtrl
//
//  Created by Jameson Proctor on 11/10/11.
//  Copyright 2011 JP1971. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MySingleton.h"

@interface SecondViewController : UIViewController <UITextFieldDelegate> {
    IBOutlet UITextField *hostField;
    IBOutlet UITextField *portField;
    MySingleton* mySingleton;
}

@property (nonatomic, retain) UITextField *hostField;
@property (nonatomic, retain) UITextField *portField;

@end
