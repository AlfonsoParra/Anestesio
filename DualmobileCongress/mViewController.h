//
//  mViewController.h
//  DualmobileCongress
//
//  Created by luis Gonzalez on 06-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "ECSlidingViewController.h"

@interface mViewController : ECSlidingViewController

@property (strong, nonatomic) IBOutlet UITextField *UserName;
@property (strong, nonatomic) IBOutlet UITextField *UserSpecialty;
@property (strong, nonatomic) IBOutlet UITextField *UserMail;
@property (strong, nonatomic) IBOutlet UIButton *comenzarBoton;
@property (nonatomic, strong) UIActivityIndicatorView *ActividadServidor;
@property (nonatomic, strong) NSArray *nombresEntidad;
@property   NSTimer *timerPermiteSincro;
@property   NSTimer *timerParaSincro;

@property BOOL desautorizadoSincro;
- (IBAction)IniciarSesion:(id)sender;
- (IBAction)CerrarTeclado:(id)sender;
- (IBAction)comenzarAccion:(id)sender;

@end