//
//  LocalService.m
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/1/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import "LocalService.h"
#import "LocalPlayer.h"
#import "LocalPlayableObject.h"

@implementation LocalService

@synthesize player = _player;

- (NSObject <PlayerProtocol> *)player {
    if (!_player) {
        _player = [LocalPlayer new];
    }
    return _player;
}

- (NSString *)description {
    return @"Media Library";
}

- (NSObject<Playable> *)getPlayableObject {
    MPMediaQuery *everything = [[MPMediaQuery alloc] init];
    
    NSArray *itemsFromGenericQuery = [everything items];

    LocalPlayableObject *playableObject = [LocalPlayableObject new];
    if (itemsFromGenericQuery.count) {
        playableObject.mediaItem = itemsFromGenericQuery[0];
    }
    
    playableObject.service = self;

    return playableObject;
}

@end
