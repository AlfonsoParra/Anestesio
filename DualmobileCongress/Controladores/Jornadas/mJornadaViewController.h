//
//  mJornadaViewController.h
//  DualmobileCongress
//
//  Created by luis Gonzalez on 07-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "mCustomCell.h"
#import "Evento.h"
#import "Persona.h"
#import "Lugar.h"
#import "Imagen.h"
#import "Institucion.h"
#import "GAITrackedViewController.h"
#import "AnimatedImagesView.h"
#import "Eventopadre.h"
#import "Notificacion.h"


@interface mJornadaViewController : UIViewController<UITableViewDataSource,UITableViewDelegate ,NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *JornadasTableView;
@property (strong, nonatomic) IBOutlet UILabel *TituloJornada;
@property(nonatomic,strong)NSString *InicioJornada;
@property(nonatomic,strong)NSString *FinJornada;
@property(nonatomic,strong)NSString *Titulo;
@property(nonatomic,strong)NSString *Coordinador;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *BotonNotificaciones;
@property (nonatomic, strong) IBOutlet AnimatedImagesView *animationImageView;
@property(nonatomic,strong)NSArray *EventosPadre;
@property(nonatomic,strong)NSArray *EventosHijos;



- (IBAction)RevelarNotificaciones:(id)sender;


@end
