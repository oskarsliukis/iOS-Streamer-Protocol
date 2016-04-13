//
//  LocalPlayer.m
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/1/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import "LocalPlayer.h"
#import "LocalPlayableObject.h"
#import <AVFoundation/AVFoundation.h>

@interface LocalPlayer ()

@property (nonatomic, strong) MPMusicPlayerController *musicPlayerController;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end

@implementation LocalPlayer

- (NSString *)description {
    return @"Local Player";
}

- (MPMusicPlayerController *)musicPlayerController {
    if (!_musicPlayerController) {
        _musicPlayerController = [MPMusicPlayerController applicationMusicPlayer];
    }
    return _musicPlayerController;
}

- (void)playObject:(NSObject<Playable> *)object {
    [super playObject:object];
    [self stop];
    
    NSAssert([object isKindOfClass:[LocalPlayableObject class]], @"");
    
    LocalPlayableObject *playableObject = (LocalPlayableObject *)object;
    /*
    MPMediaItemCollection *collection = [[MPMediaItemCollection alloc] initWithItems:@[playableObject.mediaItem]];
    [self.musicPlayerController setQueueWithItemCollection:collection];
    
    [self.musicPlayerController play];
     */
    
    NSURL *url = [playableObject.mediaItem valueForProperty:MPMediaItemPropertyAssetURL];
    
    // Play the item using AVPlayer
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.audioPlayer play];
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive: YES error: nil];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
}

- (void)stop {
    [super stop];
    [self.audioPlayer stop];
    [self.musicPlayerController stop];
}

@end
