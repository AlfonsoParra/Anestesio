//
//  mDetalleViewController.h
//  DualmobileCongress
//
//  Created by luis Gonzalez on 07-05-13.
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
#import "mSimposioDetViewController.h"



//modelo
#import "Evento.h"
#import "Persona.h"
#import "Lugar.h"
#import "Imagen.h"
#import "Institucion.h"
#import "Eventopadre.h"



@interface mDetalleViewController : UIViewController<EKEventEditViewDelegate, EKEventViewDelegate ,UITableViewDataSource , UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *DetailTableview;

@property (strong, nonatomic) IBOutlet UILabel *Lugar;
@property (strong, nonatomic) IBOutlet UIButton *BotonSimposio;
@property (strong, nonatomic) IBOutlet UIButton *BotonMapa;
@property (weak, nonatomic) IBOutlet UILabel *ActividadEP;
@property (weak, nonatomic) IBOutlet UILabel *HoraEP;
@property (weak, nonatomic) IBOutlet UITextView *CoordinadorEP;
@property (weak, nonatomic) IBOutlet UITextView *TituloEP;
@property (weak, nonatomic) IBOutlet UILabel *LugarEP;

@property (strong, nonatomic) IBOutlet UILabel *labelBarra;

@property (strong, nonatomic) IBOutlet UILabel *Rol;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *BotonNotificaciones;
@property (strong, nonatomic) IBOutlet UITextView *Titulo;
@property (strong, nonatomic) IBOutlet UILabel *Hora;
@property (strong, nonatomic) IBOutlet UITextView *Expositor;
@property (strong, nonatomic) IBOutlet UILabel *Actividad;
@property (strong, nonatomic) IBOutlet UIButton *BotonPublicacionTwet;
@property (strong, nonatomic) IBOutlet UIButton *botonDeTalleSpeaker;
@property (strong, nonatomic) IBOutlet UIButton *botonImagenExpositor;
@property (weak, nonatomic) IBOutlet UITextView *ContenidoExposicion;
@property (strong, nonatomic) IBOutlet UIButton *BotonPublicarFacebook;
@property (strong, nonatomic) IBOutlet UIImageView*imagen;
@property (strong, nonatomic) IBOutlet UITextView *tituloEP;
@property (strong, nonatomic) IBOutlet UILabel *TipoEventoPadre;
@property (strong, nonatomic) IBOutlet UITextView *infoEP;
@property (strong, nonatomic) IBOutlet UILabel *lugarEP;
@property (strong, nonatomic) IBOutlet UILabel *horaEP;
@property (nonatomic, strong) IBOutlet AnimatedImagesView *animationImageView;

@property(nonatomic,strong)NSString *horaEPstr;
@property(nonatomic,strong)NSString *nombreParticipanteEP;

@property(nonatomic,strong)NSString *ActividadEPfs;

@property(nonatomic,strong)NSString *tituloEP2;
@property(nonatomic,strong)NSString *tipoEventoPadre2;
@property(nonatomic,strong)NSString *lugarEP2;
@property(nonatomic,strong)NSString *horaEP2;
@property(nonatomic,strong)NSString *descEP2;
@property(nonatomic,strong)UIImage  *imagenEX;
@property(nonatomic,strong)NSString *tituloCelda;
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
@property(nonatomic,strong)NSString *NombreSimposioPadre;
@property(nonatomic,strong)NSString *TipoSimposioPadre;
@property(nonatomic,strong)NSString *HorasimposioPadre;
@property(nonatomic,strong)NSString *LugarsimposioPadre;
@property(nonatomic,strong)NSString *nombreBarra;

@property(nonatomic,strong)NSMutableArray  *EventosDelSimposio;
@property(nonatomic,strong)NSMutableArray *EventosPadre;

@property (strong, nonatomic) IBOutlet UILabel *labelsimposio;
@property(nonatomic,strong)NSString *textoLabelSimposio;

@property(nonatomic,strong)NSString *DescripcionTemaLibre;
@property(nonatomic,strong)NSString *JornadaEventoPadre;


- (IBAction)PublicaEnFaceBook:(id)sender;
- (IBAction)PublicaEnTwiter:(id)sender;
- (IBAction)RevelarMenuLateral:(id)sender;
- (IBAction)GuardarCalendario:(id)sender;



@end
