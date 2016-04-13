//
//  ServiceProtocol.h
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/1/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerProtocol.h"

@protocol ServiceProtocol <NSObject>

@property (nonatomic, strong) NSObject <PlayerProtocol> *player;

- (NSObject<Playable> *)getPlayableObject;

@end
