//
//  ServiceManager.m
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/1/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import "ServiceManager.h"
#import "LocalService.h"
#import "SpotifyService.h"
#import "RdioService.h"

@implementation ServiceManager

- (NSArray *)services {
    if (!_services) {
        LocalService *localService = [[LocalService alloc] init];
        SpotifyService *spotifyService = [[SpotifyService alloc] init];
        RdioService *rdioService = [[RdioService alloc] init];
        _services = @[localService, spotifyService, rdioService];
    }
    return _services;
}

- (void)handleCallbackURL:(NSURL *)url {
    for (NSObject *service in self.services) {
        if ([service isKindOfClass:[SpotifyService class]]) {
            [(SpotifyService *)service handleCallbackURL:url];
        }
    }
}

- (void)stopAllPlaybacks {
    for (NSObject <ServiceProtocol> *service in self.services) {
        [service.player stop];
    }
}

@end
