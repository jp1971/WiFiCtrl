//
//  SecondViewController.m
//  WiFiCtrl
//
//  Created by Jameson Proctor on 11/10/11.
//  Copyright 2011 JP1971. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

@synthesize hostField, portField;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{   
    [hostField setDelegate:self];
    [portField setDelegate:self];

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
    [hostField release];
    [portField release];
    
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc
{
    [hostField release];
    [portField release];
    
    [super dealloc];
}

//Text field delegate methods
- (BOOL)textFieldShouldReturn:(UITextField*)aTextField
{
    [aTextField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    mySingleton.host = hostField.text;
    mySingleton.port = (uint16_t)[portField.text integerValue];
    NSLog(@"%@", mySingleton.host);
}

@end
