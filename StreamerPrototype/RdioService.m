//
//  RdioService.m
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/2/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import "RdioService.h"
#import <Rdio/Rdio.h>
#import "RdioPlaybackObject.h"
#import "RdioPlayer.h"

static NSString *const kClientId = @"";
static NSString *const kClientSecret = @"";

@interface RdioService ()

@property (nonatomic, strong) Rdio *rdio;
@property (readonly) RdioPlayer *rdioPlayer;

@end

@implementation RdioService

@synthesize player;

- (id)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (NSString *)description {
    return @"Rdio";
}

- (NSObject <PlayerProtocol> *)player {
    if (!player) {
        player = [RdioPlayer new];
    }
    return player;
}

- (Rdio *)rdio {
    if (!_rdio) {
        _rdio = [[Rdio alloc] initWithClientId:kClientId andSecret:kClientSecret delegate:nil];
    }
    return _rdio;
}

- (RdioPlayer *)rdioPlayer {
    return (RdioPlayer *)self.player;
}

- (NSObject <Playable> *)getPlayableObject {
    RdioPlaybackObject *playbackObject = [[RdioPlaybackObject alloc] init];
    playbackObject.service = self;
    return playbackObject;
}

- (void)setup {
    [self.rdio preparePlayerWithDelegate:nil];
    self.rdioPlayer.rdio = self.rdio;
}

@end
