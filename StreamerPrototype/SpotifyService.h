//
//  SpotifyService.h
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/1/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import "AbstractService.h"

@interface SpotifyService : AbstractService

- (void)handleCallbackURL:(NSURL *)url;

@end
