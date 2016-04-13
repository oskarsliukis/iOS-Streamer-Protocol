//
//  SpotifyPlayer.h
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/2/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import "AbstractPlayer.h"
#import <Spotify/Spotify.h>

@interface SpotifyPlayer : AbstractPlayer

@property (nonatomic, strong) SPTAudioStreamingController *spotifyStreamingController;
@property (nonatomic, strong) SPTSession *session;

@end
