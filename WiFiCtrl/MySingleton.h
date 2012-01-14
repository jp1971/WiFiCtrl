//
//  MySingleton.h
//  WiFiCtrl
//
//  Created by Jameson Proctor on 1/8/12.
//  Copyright 2012 JP1971. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import <Foundation/Foundation.h>

@interface MySingleton : NSObject
{
    NSString* host;
    uint16_t port;
}

@property (nonatomic, retain) NSString* host;
@property (nonatomic, assign) uint16_t port;

+ (MySingleton*) sharedInstance;
@end
