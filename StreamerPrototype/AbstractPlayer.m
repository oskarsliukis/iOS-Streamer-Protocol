//
//  AbstractPlayer.m
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/1/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import "AbstractPlayer.h"

@implementation AbstractPlayer

@synthesize isPlaying;

- (NSString *)description {
    return @"Abstract Player";
}

- (void)playObject:(NSObject<Playable> *)object {
    NSLog(@"%@ - play", self);
    self.isPlaying = YES;
}

- (void)stop {
    NSLog(@"%@ - stop", self);
    self.isPlaying = NO;
}


@end
