//
//  Playable.h
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/2/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServiceProtocol;

@protocol Playable <NSObject>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSObject <ServiceProtocol> *service;

@end
