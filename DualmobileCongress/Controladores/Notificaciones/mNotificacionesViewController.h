//
//  mNotificacionesViewController.h
//  DualmobileCongress
//
//  Created by luis Gonzalez on 07-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "mMenuCell.h"
#import "SSPullToRefresh.h"

@interface mNotificacionesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,SSPullToRefreshViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *PushTableview;
@property(nonatomic,strong) NSMutableArray *ResultadosNotificaciones;
@property (nonatomic,strong) NSArray *arrayNotificaciones;
@property (strong, nonatomic) UIRefreshControl *refresh;

@end
