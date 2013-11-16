//
//  mDetalleHotel.h
//  DualmobileCongress
//
//  Created by Arturo Sanhueza on 14-11-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "mCustomCell.h"
#import "mHotelesTabla.h"
#import "GAITrackedViewController.h"
#import "AnimatedImagesView.h"
#import "mDetalleHotel.h"

@interface mDetalleHotel : UIViewController <UIAlertViewDelegate>

@property(nonatomic,strong) NSString *detalleNombre;
@property(nonatomic,strong) NSString *detalleDescripcion;
@property(nonatomic,strong) NSString *detalleFono;
@property(nonatomic,strong) NSString *detalleWea;
@property(nonatomic,strong) NSString *detalleX;
@property(nonatomic,strong) NSString *detalleY;

//////////////////////////////////////////////////////////////////////
//Labeles

@property(nonatomic,strong)IBOutlet UILabel*labelNombre;
@property(nonatomic,strong)IBOutlet UILabel*labelDescripcion;
@property(nonatomic,strong)IBOutlet UILabel*labelFono;
@property(nonatomic,strong)IBOutlet UILabel*labelWea;
@property(nonatomic,strong)IBOutlet UILabel*labelDireccion;


/////////////////////////////////////////////////////////////////////////
//Botones

@property(nonatomic,strong) IBOutlet UIButton *botonLlamar;
@property(nonatomic,strong) IBOutlet UIButton *botonWeb;
@property (nonatomic,strong) IBOutlet UIBarButtonItem *BotonNotificaciones;


///////////////////////////////////////////////////////////////////////////
//Imagenes

@property (nonatomic, strong) IBOutlet AnimatedImagesView *animationImageView;


@end
