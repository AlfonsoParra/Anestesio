//
//  mAboutViewController.m
//  DualmobileCongress
//
//  Created by luis Gonzalez on 13-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mAboutViewController.h"
#import "GAI.h"
#import "mConexionRed.h"

@interface mAboutViewController()
//UA-37133331-5
@end

@implementation mAboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    id trackerAbout = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [trackerAbout sendView:@"About"];
    
    UIImage *barButtonImage = [[UIImage imageNamed:@"btnmenu.png"]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,0,0)];
    [self.BotonMenu setBackgroundImage:barButtonImage
                              forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    UIImage *NotButtonImage = [[UIImage imageNamed:@"boton_nota"]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,0,0)];
    [self.BotonNotificaciones setBackgroundImage:NotButtonImage
                              forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    self.title = @" ";
}

#pragma -mark enviamos la direccion url selecionadas a la vista de detalle

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    mDetalleAboutViewController *destino = (mDetalleAboutViewController *)segue.destinationViewController;

    if ([UIDevice estaConectado]==TRUE) {

    if ([segue.identifier isEqualToString:@"WebAimagos"])
    {
        destino.weburl = @"http://www.aimagos.com";
    }
    if ([segue.identifier isEqualToString:@"TwitAimagos"])
    {
        
        destino.weburl = @"http://mobicongress.com/";
    }
}///////////////////REVISAR Y ARREGLAR////////////////////////////////
    else {
        
//        [segue.destinationViewController isCancelled];
        NSString *titulengue = @"Ok";
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Advertencia:"
                                                            message:@"Acceda a alguna red de internet para lograr acceder a este servicio"
                                                           delegate:self
                                                  cancelButtonTitle:titulengue
                                                  otherButtonTitles:nil, nil];
        [alertView show];
    }
}


- (IBAction)RevelarMenuLateral:(id)sender {
    [self.slidingViewController anchorTopViewTo:ECRight];
   
    
    id eventoMenuLateralDesdeAbout = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [eventoMenuLateralDesdeAbout sendEventWithCategory:@"uiAction"
                        withAction:@"DespliegueMenuLateral"
                         withLabel:@"Abrío el menu lateral desde About"
                         withValue:nil];
}


- (IBAction)RevelarNotificaciones:(id)sender {
    [self.slidingViewController anchorTopViewTo:ECLeft];
    id eventoNotificacionesDesdeAbout = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
[eventoNotificacionesDesdeAbout sendEventWithCategory:@"uiAction"
                                        withAction:@"DespliegueMenuLateral"
                                         withLabel:@"Abrió Notificaciones desde About"
                                         withValue:nil];
}

- (void)viewDidUnload {
   
    [self setBotonMenu:nil];
    
    [super viewDidUnload];
}

@end
