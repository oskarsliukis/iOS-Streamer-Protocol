//
//  SpotifyPlayer.m
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/2/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import "SpotifyPlayer.h"

@implementation SpotifyPlayer

- (NSString *)description {
    return @"Spotify Player";
}

- (void)playObject:(NSObject<Playable> *)object {
    // Create a new player if needed
    if (self.spotifyStreamingController == nil) {
        self.spotifyStreamingController = [[SPTAudioStreamingController alloc] initWithClientId:[SPTAuth defaultInstance].clientID];
    }
    
    if (self.spotifyStreamingController.loggedIn) {
        NSURL *trackURI = [NSURL URLWithString:@"spotify:track:58s6EuEYJdlb0kO7awm3Vp"];
        [self.spotifyStreamingController playURIs:@[ trackURI ] fromIndex:0 callback:^(NSError *error) {
            if (error != nil) {
                NSLog(@"*** Starting playback got error: %@", error);
                return;
            }
        }];
    } else {
        [self.spotifyStreamingController loginWithSession:self.session callback:^(NSError *error) {
            if (error != nil) {
                NSLog(@"*** Logging in got error: %@", error);
                return;
            }
            
            NSURL *trackURI = [NSURL URLWithString:@"spotify:track:58s6EuEYJdlb0kO7awm3Vp"];
            [self.spotifyStreamingController playURIs:@[ trackURI ] fromIndex:0 callback:^(NSError *error) {
                if (error != nil) {
                    NSLog(@"*** Starting playback got error: %@", error);
                    return;
                }
            }];
        }];
    }
}

- (void)stop {
    [super stop];
    [self.spotifyStreamingController stop:^(NSError *error) {
        if (error) {
            NSLog(@"%@ - %@", error, [self class]);
        }
    }];
}

@end
