//
//  SpotifyService.m
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/1/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import "SpotifyService.h"
#import "SpotifyPlayer.h"
#import <Spotify/Spotify.h>
#import "SpotifyPlayableObject.h"

static NSString *const kClientId = @"";
static NSString *const kCallbackURL = @"poc://callback";
static NSString *const kSessionUserDefaultsKey = @"SpotifySession";

@interface SpotifyService ()

@property (nonatomic, strong) SPTSession *session;
@property (readonly) SpotifyPlayer *spotifyPlayer;

@end

@implementation SpotifyService

@synthesize player;

- (id)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (NSObject <PlayerProtocol> *)player {
    if (!player) {
        player = [SpotifyPlayer new];
    }
    return player;
}

- (SpotifyPlayer *)spotifyPlayer {
    return (SpotifyPlayer *)self.player;
}

- (NSString *)description {
    return @"Spotify";
}

- (NSObject <Playable> *)getPlayableObject {
    SpotifyPlayableObject *spotifyObject = [[SpotifyPlayableObject alloc] init];
    spotifyObject.service = self;
    return spotifyObject;
}

- (void)handleCallbackURL:(NSURL *)url {
    if ([[SPTAuth defaultInstance] canHandleURL:url]) {
        [[SPTAuth defaultInstance] handleAuthCallbackWithTriggeredAuthURL:url callback:^(NSError *error, SPTSession *session) {
            if (error != nil) {
                NSLog(@"*** Auth error: %@", error);
                return;
            }
            
            self.session = session;
            self.spotifyPlayer.session = session;
        }];
    }
}

- (void)setup {
    SPTAuth *auth = [SPTAuth defaultInstance];
    auth.clientID = kClientId;
    auth.requestedScopes = @[SPTAuthStreamingScope];
    auth.redirectURL = [NSURL URLWithString:kCallbackURL];
    auth.sessionUserDefaultsKey = kSessionUserDefaultsKey;
    
    
    // Construct a login URL and open it
    NSURL *loginURL = [[SPTAuth defaultInstance] loginURL];
    
    // Opening a URL in Safari close to application launch may trigger
    // an iOS bug, so we wait a bit before doing so.
    [[UIApplication sharedApplication] performSelector:@selector(openURL:)
                                            withObject:loginURL afterDelay:0.1];
}

@end
