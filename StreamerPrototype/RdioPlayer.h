//
//  RdioPlayer.h
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/2/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import "AbstractPlayer.h"
#import <Rdio/Rdio.h>

@interface RdioPlayer : AbstractPlayer

@property (nonatomic, strong) Rdio *rdio;

@end
