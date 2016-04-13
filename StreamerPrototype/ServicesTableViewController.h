//
//  ServicesTableViewController.h
//  StreamerPrototype
//
//  Created by Oskars Liukis on 9/1/15.
//  Copyright (c) 2015 OL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceManager.h"

@class ServicesTableViewController;

@protocol ServicesTableViewControllerDelegate <NSObject>

- (void)servicesTableViewController:(ServicesTableViewController *)controller didSelectService:(id <ServiceProtocol>)service;

@end

@interface ServicesTableViewController : UITableViewController

@property (nonatomic, assign) id <ServicesTableViewControllerDelegate> delegate;
@property (nonatomic, strong) ServiceManager *serviceManager;

@end
