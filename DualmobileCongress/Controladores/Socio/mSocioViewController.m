//
//  mSocioViewController.m
//  DualmobileCongress
//
//  Created by Alfonso Parra on 11-10-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mSocioViewController.h"
#import "GAI.h"
#import "mConexionRed.h"
#import <MessageUI/MessageUI.h>

@interface mSocioViewController ()
@property(nonatomic,strong)mAppDelegate *delegate;
@end

@implementation mSocioViewController


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
    
    id trackerAbout = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [trackerAbout sendView:@"Socio"];
    
    
    UIImage *barButtonImage = [[UIImage imageNamed:@"btnmenu.png"]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,0,0)];
    [self.BotonMenu setBackgroundImage:barButtonImage
                              forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    self.title= @" ";
    UIImage *NotButtonImage = [[UIImage imageNamed:@"boton_nota"]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,0,0)];
    [self.BotonNotificaciones setBackgroundImage:NotButtonImage
                                        forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    self.title = @" ";
    
    NSArray *arr = [NSArray arrayWithObjects:
                    @"publi_bot_1.png",@"publi_bot_2.png", nil];
    [self.animationImageView setImagesArr:arr];
    self.animationImageView.showNavigator = NO;
    [self.animationImageView startAnimating];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self              action:@selector(imageTapped:)];
    self.animationImageView.userInteractionEnabled = YES;
    [self.animationImageView addGestureRecognizer:tap];
}

- (void )imageTapped:(UITapGestureRecognizer *) gestureRecognizer
{
    NSLog(@"tap imagen");
    id TokeImagenTracking = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [TokeImagenTracking sendEventWithCategory:@"uiAction"
                                   withAction:@"Tap Publicidad"
                                    withLabel:@"Tap Branding Principal"
                                    withValue:nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)enviarCorreo:(id)sender {
}

- (IBAction)RevelarMenuLateral:(id)sender {
    [self.slidingViewController anchorTopViewTo:ECRight];
    
    
    id eventoMenuLateralAhora = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [eventoMenuLateralAhora sendEventWithCategory:@"uiAction"
                                       withAction:@"Revelar Menu Lateral"
                                        withLabel:@"Revelo desde Hazte Socio"
                                        withValue:nil];
}


- (IBAction)RevelarNotificaciones:(id)sender {
    [self.slidingViewController anchorTopViewTo:ECLeft];
    id eventoNotificacionesDesdeAhora = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [eventoNotificacionesDesdeAhora sendEventWithCategory:@"uiAction"
                                               withAction:@"Revelar Notificaciones"
                                                withLabel:@"Revelo desde Hazte Socio"
                                                withValue:nil];
}

- (IBAction)showEmail:(id)sender {
    
    UIImage *navBackgroundImage = [UIImage imageNamed:@"navbar_about"];
    [[UINavigationBar appearance] setBackgroundImage:navBackgroundImage forBarMetrics:UIBarMetricsDefault];
    
    // Email Subject
    NSString *emailTitle = @"Contacto Socio SOPNIA";
    // Email Content
    NSString *messageBody = @"Gracias por contactarse con SOPNIA <br> <br>Le solicitamos que llene los siguientes datos: <br><br> Nombre: <br> Apellido: <br> Correo Electronico: <br> Numero de contacto: <br> <br>Gracias.";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"asanhuezal7.7@gmail.com"];
    // To bbc

    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:YES];
    [mc setToRecipients:toRecipents];

    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            [self GaMail];
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void)GaMail{
    id eventoNotificacionesDesdeAhora = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    
    [eventoNotificacionesDesdeAhora sendEventWithCategory:@"uiAction"
                                               withAction:@"Envio E-Mail"
                                                withLabel:@"Eviado desde Hazte Socio"
                                                withValue:nil];
}

@end
