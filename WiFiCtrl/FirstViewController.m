//
//  FirstViewController.m
//  WiFiCtrl
//
//  Created by Jameson Proctor on 11/10/11.
//  Copyright 2011 JP1971. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    sock = [[AsyncUdpSocket alloc] initWithDelegate:self];
 
    [sock connectToHost:mySingleton.host onPort:mySingleton.port error:nil];
    
    mySingleton = [MySingleton sharedInstance];
    
    NSLog(@"View loaded.");
 
    [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload
{
    [fwdBtn release];
    fwdBtn = nil;
    [lftBtn release];
    lftBtn = nil;
    [stpBtn release];
    stpBtn = nil;
    [rtBtn release];
    rtBtn = nil;
    [revBtn release];
    revBtn = nil;
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc
{
    [fwdBtn release];
    [lftBtn release];
    [stpBtn release];
    [rtBtn release];
    [revBtn release];
    [super dealloc];
}

- (IBAction)fwdBtnDwn {
//    NSString *tstMsg = @"3";
//    tstDat = [tstMsg dataUsingEncoding:NSASCIIStringEncoding];
//    [sock sendData:tstDat withTimeout:-1 tag:0];
    NSLog(@"%@", mySingleton.host);
    
    //Add error handling if host and/or port are not set.
}

- (IBAction)lftBtnDwn {
    
}

- (IBAction)stpBtnDwn {
    
}

- (IBAction)rtBtnDwn {
    
}


- (IBAction)revBtnDwn {
    
}

-(IBAction)btnUp {
    
}

@end
