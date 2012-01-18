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
    socket = [[AsyncUdpSocket alloc] initWithDelegate:self];
    [socket enableBroadcast:YES error:nil];
    [socket  bindToAddress:@"0.0.0.0" port:55555 error:nil];
    [socket receiveWithTimeout:-1 tag:0];
    //[socket sendData:[@"Hello" dataUsingEncoding:NSASCIIStringEncoding] toHost:@"255.255.255.255" port:2000 withTimeout:-1 tag:0];

    mySingleton = [MySingleton sharedInstance];
    mySingleton.host = @"0.0.0.0";
    mySingleton.port = 0;
    
    if (mySingleton.host == @"0.0.0.0") {
        statusView.image = [UIImage imageNamed:@"status_led_off.png"];
    }

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

- (BOOL)onUdpSocket:(AsyncUdpSocket *)sock didReceiveData:(NSData *)data withTag:(long)tag fromHost:(NSString *)host port:(UInt16)port
{
    mySingleton.host = host;
    mySingleton.port = port;
    
    if (mySingleton.host != @"0.0.0.0") {
        statusView.image = [UIImage imageNamed:@"status_led_on.png"];
    }
    
    unsigned char buffer [data.length];
    NSMutableData *truncData = [[NSMutableData alloc] init];
    
    [data getBytes:buffer range:NSMakeRange(60, 32)];
    [truncData appendBytes:&buffer length:32];
     
    
//    for (int i = 0; i < data.length; i++) {
//        [data getBytes:buffer range:NSMakeRange(i, 1)];
//        if (buffer[i] != 0 && buffer[i+1] != 0) {
//            [truncData appendBytes:&buffer length:1];
//        }
//    }
    
    NSString *msg = [[NSString alloc] initWithBytes:truncData.bytes length:truncData.length encoding:1 ];
    //NSString *msg = [[[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding] autorelease];
    NSString *search = @"NOT";
    
    if ([msg rangeOfString:search].location != NSNotFound) {
        NSLog(@"%@ found", search);
    }
    
    
    
    NSLog(@"%@", msg);
    
    NSLog(@"Data: %@",data);
    
    NSLog(@"Host: %@", host);

    
//    //NSString *msg = [[[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding] autorelease];
//    NSString *msg = [[NSString alloc] initWithBytes:truncData.bytes length:data.length encoding:1];
//    
//    int strLen = msg.length;
//    NSLog(@"String length: %i", strLen);
//    
//    NSLog(@"%@", msg);
//    
//    if (msg)
//	{
//		NSLog(@"RECV: %@", msg);
//	}
//	else
//	{
//		
//		NSLog(@"RECV: Unknown message from: %@:%hu", host, port);
//	}
    
    return YES;
}

//Servo commands.  Add error handling if host and/or port are not set.

- (IBAction)fwdBtnDwn 
{
    [socket sendData:[@"I" dataUsingEncoding:NSASCIIStringEncoding] toHost:mySingleton.host port:mySingleton.port withTimeout:-1 tag:0];
    
}

- (IBAction)rtBtnDwn 
{
    [socket sendData:[@"L" dataUsingEncoding:NSASCIIStringEncoding] toHost:mySingleton.host port:mySingleton.port withTimeout:-1 tag:0];
}

- (IBAction)revBtnDwn 
{
    [socket sendData:[@"M" dataUsingEncoding:NSASCIIStringEncoding] toHost:mySingleton.host port:mySingleton.port withTimeout:-1 tag:0];    
}

- (IBAction)lftBtnDwn 
{
    [socket sendData:[@"J" dataUsingEncoding:NSASCIIStringEncoding] toHost:mySingleton.host port:mySingleton.port withTimeout:-1 tag:0]; 
}


- (IBAction)stpBtnDwn 
{
    [socket sendData:[@"K" dataUsingEncoding:NSASCIIStringEncoding] toHost:mySingleton.host port:mySingleton.port withTimeout:-1 tag:0];
}

-(IBAction)btnUp 
{
    
}

@end
