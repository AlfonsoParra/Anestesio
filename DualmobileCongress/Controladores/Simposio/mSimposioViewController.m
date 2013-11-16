//
//  mSimposioViewController.m
//  DualmobileCongress
//
//  Created by Alfonso Parra on 11-10-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mSimposioViewController.h"
#import "mAppDelegate.h"
#import "NSDataAdditions.h"
#import "GAI.h"

#import "Eventopadre.h"
#import "Persona.h"
#import "Lugar.h"
#import "Evento.h"
#import "Institucion.h"
#import "Notificacion.h"
#import "mCongressAPIClient.h"

@interface mSimposioViewController ()

@end

@implementation mSimposioViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    //trackenado GA
    
    id trackerJornada = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [trackerJornada sendView:@"Simposio"];
    
    UIImage *NotButtonImage = [[UIImage imageNamed:@"boton_nota"]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,0,0)];
    [self.BotonNotificaciones setBackgroundImage:NotButtonImage
                                        forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    self.title = @" ";
    
    NSArray *arr = [NSArray arrayWithObjects:
                    @"publi_bot_2.png",@"publi_bot_1.png", nil];
    [self.animationImageView setImagesArr:arr];
    self.animationImageView.showNavigator = NO;
    [self.animationImageView startAnimating];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
