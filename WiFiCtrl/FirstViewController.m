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
    socket = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    [socket beginReceiving:nil];
    //[socket  bindToPort:55555 error:nil];
    //[socket enableBroadcast:YES error:nil]; 
    //[socket receiveWithTimeout:-1 tag:0];
    //[socket connectToHost:@"192.168.1.15" onPort:2000 error:nil];

    
    mySingleton = [MySingleton sharedInstance];

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
    fwdDat = nil;
    [fwdDat release];
    rgtDat = nil;
    [rgtDat release];
    revDat = nil;
    [revDat release];
    lftDat = nil;
    [lftDat release];
    stpDat = nil;
    [revDat release];
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
    [fwdDat release];
    [rgtDat release];
    [revDat release];
    [lftDat release];
    [revDat release];
    [super dealloc];
}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didReceiveData:(NSData *)data fromAddress:(NSData *)address withFilterContext:(id)filterContext {
    
    NSData *addTmp = address;
    //mySingleton.port = port;
    NSLog(@"Host: %@", addTmp);
    //NSLog(@"Port: %i", mySingleton.port);
	NSString *msg = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
	if (msg)
	{
		NSLog(@"RECV: %@", msg);
	}
	else
	{
	}
}
//Servo commands.  Add error handling if host and/or port are not set.

- (IBAction)fwdBtnDwn {
    [socket sendData:[@"0" dataUsingEncoding:NSASCIIStringEncoding] toHost:mySingleton.host port:mySingleton.port withTimeout:-1 tag:0];
    
}

- (IBAction)rtBtnDwn {
    [socket sendData:[@"1" dataUsingEncoding:NSASCIIStringEncoding] toHost:mySingleton.host port:mySingleton.port withTimeout:-1 tag:0];
}

- (IBAction)revBtnDwn {
    [socket sendData:[@"2" dataUsingEncoding:NSASCIIStringEncoding] toHost:mySingleton.host port:mySingleton.port withTimeout:-1 tag:0];    
}

- (IBAction)lftBtnDwn {
    [socket sendData:[@"3" dataUsingEncoding:NSASCIIStringEncoding] toHost:mySingleton.host port:mySingleton.port withTimeout:-1 tag:0]; 
}


- (IBAction)stpBtnDwn {
    [socket sendData:[@"4" dataUsingEncoding:NSASCIIStringEncoding] toHost:mySingleton.host port:mySingleton.port withTimeout:-1 tag:0];
}

-(IBAction)btnUp {
    
}

@end
