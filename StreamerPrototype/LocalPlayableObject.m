//
//  LocalPlayableObject.m
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/2/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import "LocalPlayableObject.h"

@implementation LocalPlayableObject

- (NSString *)title {
    return [NSString stringWithFormat:@"%@ - %@", self.mediaItem.artist, self.mediaItem.title];
}

@end
