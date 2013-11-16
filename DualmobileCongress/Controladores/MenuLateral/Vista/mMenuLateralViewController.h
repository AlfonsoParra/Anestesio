//
//  mMenuLateralViewController.h
//  DualmobileCongress
//
//  Created by luis Gonzalez on 06-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "mMenuCell.h"
#import "AnimatedImagesView.h"

@interface mMenuLateralViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong)NSArray * MenuItems;
@property(nonatomic, strong)NSArray * IconoMenu;
@property (nonatomic, strong) IBOutlet AnimatedImagesView *animationImageView;
@end
