//
//  MySingleton.m
//  WiFiCtrl
//
//  Created by Jameson Proctor on 1/8/12.
//  Copyright 2012 JP1971. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89	
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import "MySingleton.h"

@implementation MySingleton

@synthesize host, port;

#pragma mark -
#pragma mark Singleton Methods

+ (MySingleton*)sharedInstance {

	static MySingleton *_sharedInstance;
	if(!_sharedInstance) {
		static dispatch_once_t oncePredicate;
		dispatch_once(&oncePredicate, ^{
			_sharedInstance = [[super allocWithZone:nil] init];
			});
		}

		return _sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone {	

	return [self sharedInstance];
}


- (id)copyWithZone:(NSZone *)zone {
	return self;	
}

#if (!__has_feature(objc_arc))

- (id)retain {	

	return self;	
}

- (unsigned)retainCount {
	return UINT_MAX;  //denotes an object that cannot be released
}

- (void)release {
	//do nothing
}

- (id)autorelease {

	return self;	
}
#endif

#pragma mark -
#pragma mark Custom Methods

// Add your custom methods here

- (id)init
{
    self = [super init];
    
    if (self) {
        // Work your initialising magic here as you normally would
        host = [[NSString alloc] initWithString:@"0.0.0.0"];
    }
    
    return self;
}

@end
