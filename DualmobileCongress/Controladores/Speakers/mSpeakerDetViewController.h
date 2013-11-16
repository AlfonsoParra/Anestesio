//
//  mSpeakerDetViewController.h
//  DualmobileCongress
//
//  Created by luis Gonzalez on 31-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mCustomCell.h"
#import "mDetalleViewController.h"
#import "Evento.h"
#import "Persona.h"
#import "Lugar.h"
#import "Imagen.h"
#import "Institucion.h"
#import "NSDataAdditions.h"
#import "AnimatedImagesView.h"

@interface mSpeakerDetViewController : UIViewController <UITableViewDataSource, UITableViewDelegate , NSFetchedResultsControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *ImageViewSpeaker;

@property (strong, nonatomic) IBOutlet UITextView *NombreSpeaker;
@property (strong, nonatomic) IBOutlet UILabel *PaisSpeaker;
@property (strong, nonatomic) IBOutlet UILabel *InstitucionSpeaker;
@property (strong, nonatomic) IBOutlet UITextView *TitulosSpeaker;
@property (strong, nonatomic) IBOutlet UITextView *infoSpeaker;
@property(nonatomic, retain)NSString*informacionS;
@property(nonatomic, retain)NSString*Nombrecelda;
@property(nonatomic, retain)NSString*Paiscelda;
@property(nonatomic, retain)NSString*Institucioncelda;
@property(nonatomic, retain)NSString*Tituloscelda;
@property(nonatomic, retain)NSString*BiografiaCelda;
@property(nonatomic, retain)NSString*ReferenciaSpeaker;
@property(nonatomic, retain)UIImage*ImagenDelSpeaker;
@property(nonatomic,retain)NSString*texto1;
@property(nonatomic,retain)NSString*texto2;
@property(nonatomic,retain)NSString*texto3;
@property(nonatomic,retain)NSString*texto4;
@property(nonatomic,retain)NSString*texto5;
@property(nonatomic,retain)NSString*texto6;
@property(nonatomic,strong) IBOutlet UIImageView*foto;
@property (strong, nonatomic) IBOutlet UITextView *Biografia;
@property (nonatomic, strong) IBOutlet AnimatedImagesView *animationImageView;
@property(nonatomic, retain)NSMutableArray *EventoQueParticipo;


@property (strong, nonatomic) IBOutlet UITableView *DetailSpeakerTableview;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *BotonNotificaciones;


- (IBAction)RevelarNotificaciones:(id)sender;


@end
