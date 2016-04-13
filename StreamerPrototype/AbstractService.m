//
//  AbstractService.m
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/1/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import "AbstractService.h"

@implementation AbstractService

@synthesize player;

- (NSObject<Playable> *)getPlayableObject {
    NSAssert(NO, @"Implement in subclass");
    return nil;
}

@end
