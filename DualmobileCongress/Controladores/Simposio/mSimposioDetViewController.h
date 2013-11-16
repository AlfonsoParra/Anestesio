//
//  mSimposioDetViewController.h
//  DualmobileCongress
//
//  Created by Alfonso Parra on 14-10-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import "ECSlidingViewController.h"
#import "mSpeakerDetViewController.h"
#import "mMapaConferenciaViewController.h"
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import "AnimatedImagesView.h"
#import "mJornadaViewController.h"




//modelo
#import "Evento.h"
#import "Persona.h"
#import "Lugar.h"
#import "Imagen.h"
#import "Institucion.h"
#import "Eventopadre.h"

@interface mSimposioDetViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *Titulo;
@property (weak, nonatomic) IBOutlet UILabel *Actividad;

@property (strong, nonatomic) IBOutlet UITableView *DetailTableview;
@property (strong, nonatomic) IBOutlet UITextView *ContenidoEventoHijo;
@property (weak, nonatomic) IBOutlet UITextView *Expositor;
@property (weak, nonatomic) IBOutlet UILabel *Lugar;
@property (weak, nonatomic) IBOutlet UILabel *Hora;

@property (strong, nonatomic) IBOutlet UILabel *TipoEventoPadre;
@property (strong, nonatomic) IBOutlet UILabel *Rol;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *BotonNotificaciones;
@property (strong, nonatomic) IBOutlet UIButton *BotonCalendario;
@property (strong, nonatomic) IBOutlet UIButton *BotonMapas;
@property (strong, nonatomic) IBOutlet UIButton *BotonPublicacionTwet;
@property (strong, nonatomic) IBOutlet UIButton *botonDeTalleSpeaker;
@property (strong, nonatomic) IBOutlet UIButton *botonImagenExpositor;
@property (strong, nonatomic) IBOutlet UITextView *ContenidoExposicion;
@property (strong, nonatomic) IBOutlet UIButton *BotonPublicarFacebook;
@property (strong, nonatomic) IBOutlet UIImageView*imagen;
@property (strong, nonatomic) IBOutlet UILabel *labelSimposio;
@property (strong, nonatomic) IBOutlet UILabel *Labelsimposio2;



@property (nonatomic, strong) IBOutlet AnimatedImagesView *animationImageView;
@property(nonatomic,strong)NSString *tituloCelda;
@property(nonatomic,strong)NSString *jordadex;
@property(nonatomic,strong)NSString *describe;
@property(nonatomic,strong)UIImage  *imagenEX;
@property(nonatomic,strong)NSString *ContenidoeventoHijoCelda;
@property(nonatomic,strong)NSString *horacelda;
@property(nonatomic,strong)NSString *ExpositorCelda;
@property(nonatomic,strong)NSString *ContenidoCelda;
@property(nonatomic,strong)NSString *RolCelda;
@property(nonatomic,strong)NSString *LugarCelda;
@property(nonatomic,strong)NSString *Referencia;
@property(nonatomic,strong)NSString *PaisSpeaker;
@property(nonatomic,strong)NSString *InstitucionSpeaker;
@property(nonatomic,strong)NSString *BiografiaSpeaker;
@property(nonatomic,strong)NSString *ActividadSpeaker;
@property(nonatomic,strong)NSString *MensajeInicial;
@property(nonatomic,strong)NSDate   *DateInicio;
@property(nonatomic,strong)NSDate   *DateFin;
@property(nonatomic,strong)UIImage  *NombreImagen;
@property(nonatomic)BOOL  *EsSimposio;
@property(nonatomic,strong)NSMutableArray  *EventosDelSimposio;
@property (strong, nonatomic) IBOutlet UILabel *labelsimposio;
@property(nonatomic,strong)NSString *textoLabelSimposio;
@property(nonatomic,strong)NSString *lugarEP2;


- (IBAction)PublicaEnFaceBook:(id)sender;
- (IBAction)PublicaEnTwiter:(id)sender;
- (IBAction)RevelarNotificaciones:(id)sender;
- (IBAction)GuardarCalendario:(id)sender;

@end
