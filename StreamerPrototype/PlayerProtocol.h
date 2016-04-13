//
//  PlayerProtocol.h
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/1/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Playable.h"

@protocol PlayerProtocol <NSObject>

- (void)playObject:(NSObject <Playable> *)object;
- (void)stop;

@property (nonatomic, assign) BOOL isPlaying;

@end
