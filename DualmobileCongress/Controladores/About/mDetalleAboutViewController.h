//
//  mDetalleAboutViewController.h
//  DualmobileCongress
//
//  Created by luis Gonzalez on 13-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "GAITrackedViewController.h"
#import "AnimatedImagesView.h"

@interface mDetalleAboutViewController : UIViewController<UIWebViewDelegate>

@property (nonatomic,strong) NSString *weburl;
@property (nonatomic,strong) IBOutlet UILabel *caga;
@property (nonatomic,strong) IBOutlet UIWebView *WebView;
@property (nonatomic,strong) IBOutlet UIActivityIndicatorView *indicador;
@property (nonatomic, strong) IBOutlet AnimatedImagesView *animationImageView;

- (IBAction)RevelarNotificaciones:(id)sender;

@end
