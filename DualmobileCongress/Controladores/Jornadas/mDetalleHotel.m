//
//  mDetalleHotel.m
//  DualmobileCongress
//
//  Created by Arturo Sanhueza on 14-11-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mDetalleHotel.h"
#import "SEBViewController.h"
#import "mConexionRed.h"
#import "GAI.h"
#import "mDetalleHotelWeb.h"

@interface mDetalleHotel ()

@end

@implementation mDetalleHotel

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
    id trackerJornada = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [trackerJornada sendView:@"SeleccionHotel"];
    self.title = @" ";
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
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self              action:@selector(imageTapped:)];
    self.animationImageView.userInteractionEnabled = YES;
    [self.animationImageView addGestureRecognizer:tap];
    self.labelNombre.text = self.detalleNombre;
    self.labelFono.text = self.detalleFono;
    self.labelWea.text = self.detalleWea;
    self.labelDescripcion.text = self.detalleDescripcion;
}


- (IBAction)RevelarMenuLateral:(id)sender {
    [self.slidingViewController anchorTopViewTo:ECRight];
    id eventoMenuLateralAhora = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [eventoMenuLateralAhora sendEventWithCategory:@"uiAction"
                                       withAction:@"Revelar Menu Lateral"
                                        withLabel:@"Revelo desde Hoteles"
                                        withValue:nil];
}

- (IBAction)RevelarNotificaciones:(id)sender {
    [self.slidingViewController anchorTopViewTo:ECLeft];
    id eventoNotificacionesDesdeAhora = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [eventoNotificacionesDesdeAhora sendEventWithCategory:@"uiAction"
                                               withAction:@"Revelar Notificaciones"
                                                withLabel:@"Revelo desde Hoteles"
                                                withValue:nil];
}

-(IBAction)llama:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Quieres llamar"
                                                    message:self.detalleFono
                                                   delegate:nil
                                          cancelButtonTitle:@"Si"
                                          otherButtonTitles:@"No", nil];
    [alert show];
    
    if (!alert.cancelButtonIndex ==1) {
        NSLog(@"Launching the store");
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",self.detalleFono]]];
 }
}

-(IBAction)link:(id)sender{
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.detalleWea]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"GIPIES"])
    {
        SEBViewController *ir = (SEBViewController *)segue.destinationViewController;
    
        ir.X = self.detalleX;
        ir.Y = self.detalleY;
    }


else if ([UIDevice estaConectado]==TRUE) {
    
    mDetalleHotelWeb *destino = (mDetalleHotelWeb *)segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:@"Web"])
    {
        destino.weburl = self.detalleWea;
    }
    
}
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
