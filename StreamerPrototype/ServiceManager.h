//
//  ServiceManager.h
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/1/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceProtocol.h"

@interface ServiceManager : NSObject

@property (nonatomic, strong) NSArray *services;

- (void)handleCallbackURL:(NSURL *)url;
- (void)stopAllPlaybacks;

@end
