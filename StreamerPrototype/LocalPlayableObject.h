//
//  LocalPlayableObject.h
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/2/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import "AbstractPlayableObject.h"
#import <MediaPlayer/MediaPlayer.h>

@interface LocalPlayableObject : AbstractPlayableObject

@property (nonatomic, strong) MPMediaItem *mediaItem;

@end
