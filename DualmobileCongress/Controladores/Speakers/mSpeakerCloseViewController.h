//
//  mSpeakerCloseViewController.h
//  DualmobileCongress
//
//  Created by luis Gonzalez on 05-06-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mSpeakersViewController.h"

@interface mSpeakerCloseViewController : UIViewController{
    
	mSpeakersViewController *rvController;
}

@property (nonatomic, retain) mSpeakersViewController *rvController;

@end
