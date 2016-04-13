//
//  RdioPlayer.m
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/2/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import "RdioPlayer.h"

@implementation RdioPlayer

- (void)playObject:(NSObject<Playable> *)object {
    [self.rdio.player play:@"t1"];
}

- (void)stop {
    [super stop];
    [self.rdio.player stop];
}

@end
