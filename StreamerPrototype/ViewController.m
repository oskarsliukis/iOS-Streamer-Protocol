//
//  ViewController.m
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/1/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import "ViewController.h"
#import "ServiceManager.h"
#import "ServicesTableViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *playbackButton;
@property (weak, nonatomic) IBOutlet UILabel *currentlyPlayingItemTitle;

@property (nonatomic, strong) ServiceManager *serviceManager;
@property (nonatomic, strong) NSObject <ServiceProtocol> *selectedService;
@property (nonatomic, strong) NSMutableArray *queue;
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation ViewController

- (void)handleCallbackURL:(NSURL *)url {
    [self.serviceManager handleCallbackURL:url];
}

- (ServiceManager *)serviceManager {
    if (!_serviceManager) {
        _serviceManager = [ServiceManager new];
    }
    return _serviceManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentlyPlayingItemTitle.text = nil;
    NSLog(@"Available services: %@", self.serviceManager.services);
    [self setupRemoteControlHandlers];
}

- (NSMutableArray *)queue {
    if (!_queue) {
        _queue = [NSMutableArray array];
        for (NSObject<ServiceProtocol> *service in self.serviceManager.services) {
            [_queue addObject:[service getPlayableObject]];
        }
    }
    return _queue;
}

- (void)setupRemoteControlHandlers {
    MPRemoteCommandCenter *commandCenter = [MPRemoteCommandCenter sharedCommandCenter];
    [commandCenter.nextTrackCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
        [self didPressNextButton:nil];
        return MPRemoteCommandHandlerStatusSuccess;
    }];
    
    [commandCenter.previousTrackCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
        [self didPressPreviousButton:nil];
        return MPRemoteCommandHandlerStatusSuccess;
    }];
    
    [commandCenter.stopCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
        [self.serviceManager stopAllPlaybacks];
        return MPRemoteCommandHandlerStatusSuccess;
    }];
    
    [commandCenter.pauseCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
        [self.serviceManager stopAllPlaybacks];
        return MPRemoteCommandHandlerStatusSuccess;
    }];
}

- (void)playSongAtIndex:(NSInteger)index {
    [self.serviceManager stopAllPlaybacks];
    
    NSObject<Playable> *object = self.queue[index];
    [object.service.player playObject:object];
    self.currentlyPlayingItemTitle.text = object.service.description;
    
    NSMutableDictionary *songInfo = [[NSMutableDictionary alloc] init];
    
    [songInfo setObject:[NSString stringWithFormat:@"Music: %@", object.service.description] forKey:MPMediaItemPropertyTitle];

    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:songInfo];
}

- (IBAction)didPressPlaybackButton:(id)sender {
    self.currentIndex %= self.queue.count;
    [self playSongAtIndex:self.currentIndex];
}
- (IBAction)didPressPreviousButton:(id)sender {
    self.currentIndex--;
    self.currentIndex += self.queue.count;
    self.currentIndex %= self.queue.count;
    [self playSongAtIndex:self.currentIndex];
}

- (IBAction)didPressNextButton:(id)sender {
    self.currentIndex++;
    self.currentIndex %= self.queue.count;
    [self playSongAtIndex:self.currentIndex];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[ServicesTableViewController class]]) {
        ServicesTableViewController *controller = (ServicesTableViewController *)segue.destinationViewController;
        controller.serviceManager = self.serviceManager;
    }
}

@end
