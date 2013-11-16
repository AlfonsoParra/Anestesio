//
//  mSimposioDetViewController.m
//  DualmobileCongress
//
//  Created by Alfonso Parra on 14-10-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mSimposioDetViewController.h"
#import "mDetalleViewController.h"
#import "mAppDelegate.h"
#import "GAI.h"


@interface mSimposioDetViewController ()
@property(nonatomic,strong)mAppDelegate *delegate;
@end

@implementation mSimposioDetViewController

-(void)awakeFromNib{
    UIImage *NotButtonImage = [[UIImage imageNamed:@"boton_nota"]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,0,0)];
    [self.BotonNotificaciones setBackgroundImage:NotButtonImage
                                        forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    //trackenado GA
    id trackerDetalleConferencia = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [trackerDetalleConferencia sendView:@"Conferencia"];
    self.Hora.text = self.horacelda;
    self.Expositor.text = self.ExpositorCelda;
    self.Titulo.text = self.tituloCelda;
    self.ContenidoExposicion.text = self.describe;
    self.imagen.image = self.imagenEX;
   
    self.imagen.image = self.NombreImagen;
    self.Actividad.text = self.ActividadSpeaker;
    self.ContenidoEventoHijo.text = self.describe;
    self.ContenidoExposicion.hidden = true;
    self.Lugar.text = self.lugarEP2;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] <6.0f)
    {
        [self.BotonPublicarFacebook setHidden:YES];
        [self.BotonPublicacionTwet setHidden:YES];
    }
    if (([self.Titulo.text isEqualToString:@"Almuerzo"]==TRUE)||([self.Titulo.text isEqualToString:@"Coffee Break"]==TRUE))
    {
        [self.botonDeTalleSpeaker setHidden:YES];
    }
    if (!self.EsSimposio) {
       self.labelSimposio.text = @"Actividad";
        self.Labelsimposio2.text = @"Detalle Actividad";
        self.DetailTableview.hidden = true;
        self.Lugar.text = self.LugarCelda;
       
        self.BotonCalendario.hidden = false;
        self.ContenidoExposicion.hidden = false;
        self.BotonPublicacionTwet.hidden = false;
        self.BotonPublicarFacebook.hidden=false;
        if (self.LugarCelda != NULL) {
           self.Lugar.text = self.LugarCelda;
            self.BotonMapas.hidden = false;
            NSLog( @"lugar =====> %@",self.LugarCelda);
        }
        else{
            self.Lugar.text = @"";
            self.BotonMapas.hidden = true;
           
        }
      
        

    }
    else{
         NSLog(@"copia aca ==> %@", self.ContenidoeventoHijoCelda);
        if ([self.ContenidoeventoHijoCelda isEqualToString:@"Temas libres"]) {
            self.labelSimposio.text = @"Temas Libres";
            self.Labelsimposio2.text = @"Detalle Temas Libres";
            
        }
    }
    self.delegate = [[UIApplication sharedApplication]delegate];
    
    self.EventosDelSimposio = [[NSMutableArray alloc]initWithArray:[self CargarEventosDelSimposio]];
    UIImage *NotButtonImage = [[UIImage imageNamed:@"boton_nota"]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,0,0)];
    [self.BotonNotificaciones setBackgroundImage:NotButtonImage
                                        forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    self.title = @" ";
    NSLog(@" este es un%@n", self.tituloCelda);
    
    NSArray *arr = [NSArray arrayWithObjects:
                    @"publi_bot_2.png",@"publi_bot_1.png", nil];
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

- (IBAction)PublicaEnFaceBook:(id)sender {
    
    
    SLComposeViewController *Facebook = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewControllerCompletionHandler completionHandler = ^(SLComposeViewControllerResult result)
        {
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    NSLog(@"La publicación ha sido cancelada.");
                    
                    break;
                case SLComposeViewControllerResultDone:
                    NSLog(@"Se ha publicado satisfactoriamente.");
                    [self socialTracking:@"Facebook" :@"Share"];
                    
                    
                    break;
                default:
                    break;
            }
            
            
        };
        
        if ([self.ActividadSpeaker isEqualToString:@"Break"]) {
            self.MensajeInicial = [[NSString alloc]initWithFormat:@"Disfruto de un %@ en el LVI Congreso de Anestesiología", self.tituloCelda];
            
            
        }
        else{
            self.MensajeInicial = [[NSString alloc]initWithFormat:@"Participo en %@ del LVI Congreso de Anestesiología ", self.tituloCelda];
            
        }

        Facebook.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [Facebook setInitialText:self.MensajeInicial];
        [Facebook addImage:[UIImage imageNamed:@"logoSopnia"]];
        [Facebook addURL:[NSURL URLWithString:@"http://www.anestesiachile2013.cl/"]];
        [Facebook setCompletionHandler:completionHandler];
        [self presentViewController:Facebook animated:YES completion:nil];
    }
    
    //Pa la interacción social con feibu.
}

-(void)socialTracking:(NSString*)send:(NSString*)action{
    
    id socialTracking= [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [socialTracking sendSocial:send
                    withAction:action
                    withTarget:nil];
    
}

- (IBAction)PublicaEnTwiter:(id)sender {
    
    SLComposeViewController *twitter = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewControllerCompletionHandler completionHandler = ^(SLComposeViewControllerResult result)
        {
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    NSLog(@"La publicación ha sido cancelada.");
                    break;
                case SLComposeViewControllerResultDone:
                    NSLog(@"Se ha publicado satisfactoriamente.");
                    [self socialTracking:@"Twitter" :@"Tweet"];
                    
                    break;
                default:
                    break;
            }
        };
        
        if ([self.ActividadSpeaker isEqualToString:@"Break"]) {
            self.MensajeInicial = [[NSString alloc]initWithFormat:@"Disfruto de un %@ en el  XLI Congreso de Anestesiología", self.tituloCelda];
            
            
        }
        else{
            self.MensajeInicial = [[NSString alloc]initWithFormat:@"Participo en %@ del XLI Congreso de Anestesiología ", self.tituloCelda];
            
        }

        
        twitter.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [twitter addImage:[UIImage imageNamed:@"logoSopnia"]];
        [twitter addURL:[NSURL URLWithString:@"http://www.anestesiachile2013.cl/"]];
        [twitter setInitialText:self.MensajeInicial];
        [twitter setCompletionHandler:completionHandler];
        
        [self presentViewController:twitter animated:YES completion:nil];
    }
    
    
    //Interacción social con twitter.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Comprobamos si el identificador es el adecuado
    
    if ([segue.identifier isEqualToString:@"MapSpeaker"])
    {
        mMapaConferenciaViewController *destino = (mMapaConferenciaViewController *)segue.destinationViewController;
        
        destino.salon = self.LugarCelda;
    }

    
    if ([segue.identifier isEqualToString:@"DetalleActSimpo"])
    {
        // Obtenemos el controlador destino
        mDetalleViewController  *destino = (mDetalleViewController *)segue.destinationViewController;
        Evento *info = [self.EventosDelSimposio objectAtIndex:[self.DetailTableview indexPathForSelectedRow].row];
        destino.ExpositorCelda = info.speaker.nombre;
        destino.tituloCelda = info.titulo;
        destino.ContenidoCelda =info.descripcionEvento;
        destino.LugarCelda = info.lugarEnQueMeDesarrollo.nombreLugar;
        NSString *HoraExposicion = [[NSString alloc]initWithFormat:@"De %@ ",[self DateToString:[self StringToDate:info.horaInicio]]];
        destino.horacelda = [HoraExposicion stringByAppendingFormat:@"a %@ Hrs.",[self DateToString:[self StringToDate:info.horaFin]]];
        destino.InstitucionSpeaker = info.speaker.institucionQueMePatrocina.nombreInstitucion;
        destino.PaisSpeaker = info.speaker.lugarDondeProvengo.ciudad;
        destino.BiografiaSpeaker = info.speaker.bio;
        destino.Referencia  = info.speaker.tratamiento;
        destino.DateFin = [self StringToDate:info.horaFin];
        destino.DateInicio = [self StringToDate:info.horaInicio];
        destino.ActividadSpeaker = info.tipoEvento;
        destino.nombreBarra = @"Detalle de la Actividad";
        destino.textoLabelSimposio = @"Actividad";
        if ([info.eventoPadre.tipoEP isEqualToString:@"Módulo"]||[info.eventoPadre.tipoEP isEqualToString:@"Taller"] )
        {
            destino.EsSimposio = true;
            destino.tituloEP2 = info.eventoPadre.tituloEP;
            destino.nombreBarra = @"Actividad del Módulo";
            destino.tipoEventoPadre2 =info.eventoPadre.tipoEP;
            destino.descEP2 = info.eventoPadre.descripcionEP;
            destino.lugarEP2 = info.eventoPadre.lugarEnQueMeDesarrollo.nombreLugar;
            destino.textoLabelSimposio = @"Módulo";
            
            
            NSString *HoraExposicion = [[NSString alloc]initWithFormat:@"De %@ ",[self DateToString:[self StringToDate:info.eventoPadre.horaInicioEP]]];
            destino.horaEP2 = [HoraExposicion stringByAppendingFormat:@"a %@ Hrs.",[self DateToString:[self StringToDate:info.eventoPadre.horaFinEP]]];
            
        }
        else
        {
            destino.EsSimposio = false;
            destino.DescripcionTemaLibre = info.descripcionEvento;
            
        }
           }
    
}


- (IBAction)RevelarNotificaciones:(id)sender {
    [self.slidingViewController anchorTopViewTo:ECLeft];
    id eventoNotificacionesDesdeAhora = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [eventoNotificacionesDesdeAhora sendEventWithCategory:@"uiAction"
                                               withAction:@"Revelar Notificaciones"
                                                withLabel:@"Revelo desde Detalle SImposio"
                                                withValue:nil];
}

- (IBAction)GuardarCalendario:(id)sender
{
    
    UIImage *navBackgroundImage = [UIImage imageNamed:@"navbar_about"];
    [[UINavigationBar appearance] setBackgroundImage:navBackgroundImage forBarMetrics:UIBarMetricsDefault];
    
    EKEventStore *AlmacenEventos = [[EKEventStore alloc] init];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >=6.0f) {
        EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
        if([AlmacenEventos respondsToSelector:@selector(requestAccessToEntityType:completion:)])
        {
            NSLog(@"status : %d",status);
            [AlmacenEventos requestAccessToEntityType:status completion:^(BOOL permiso, NSError *error) {
                if (permiso== true) {
                    NSLog(@"***** granted ***** :");
                    
                }}];}}
    
    EKEvent *evento  = [EKEvent eventWithEventStore:AlmacenEventos];
   
    if (self.LugarCelda != NULL) {
        evento.location = self.LugarCelda;
        evento.notes =self.ContenidoCelda;
        if (self.tituloCelda != NULL&& self.ExpositorCelda != NULL) {
            NSString * titulo = [[NSString alloc]initWithFormat:@"%@ - ",self.tituloCelda];
            titulo = [titulo stringByAppendingString:self.ExpositorCelda];
            evento.title     = titulo;
        }
        else{
            evento.title     = self.tituloCelda;
            
        }
        
    }
    else{
        evento.title     = self.tituloCelda;
        
    }
    
    evento.startDate = self.DateInicio;
    evento.endDate   = self.DateFin;
    evento.allDay = NO;
    
    evento.URL = [NSURL URLWithString:@"http://www.anestesiachile2013.cl/"];
    
    EKEventEditViewController *controlador = [[EKEventEditViewController alloc]init];
    
    controlador.eventStore = AlmacenEventos;
    controlador.event = evento;
    controlador.topViewController.view.backgroundColor = [UIColor grayColor];
    
    UIImage *ImagenBotonCalendario = [[UIImage imageNamed:@"boton_vacio"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 7, 0, 7)];
    
    [[UIBarButtonItem appearance] setBackgroundImage:ImagenBotonCalendario forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    controlador.topViewController.title = @" ";
    controlador.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:controlador animated:YES];
    controlador.editViewDelegate = self;
    
    id eventoNotificacionesDesdeAhora = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [eventoNotificacionesDesdeAhora sendEventWithCategory:@"uiAction"
                                               withAction:@"Revelar Calendario"
                                                withLabel:@"Revelo desde Detalle Simposio"
                                                withValue:nil];
}

-(void)eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [self setTitulo:nil];
    [self setHora:nil];
    [self setExpositor:nil];
    [self setBotonPublicarFacebook:nil];
    [self setContenidoExposicion:nil];
    [self setBotonNotificaciones:nil];
    [self setRol:nil];
    [self setLugar:nil];
    [self setBotonImagenExpositor:nil];
    [self setBotonPublicacionTwet:nil];
    [self setBotonDeTalleSpeaker:nil];
    [super viewDidUnload];
}
#pragma tableview


#pragma -mark Tableview datasource y delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"Cantidad de eventos que participo ==> %d",[self.EventosDelSimposio count]);
    return [self.EventosDelSimposio count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Evento *info = [self.EventosDelSimposio objectAtIndex:indexPath.row];
    NSString *cellIdentifier = @"CharlasCell";
    mCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[mCustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        
    }
    cell.contentView.backgroundColor   =   [UIColor colorWithPatternImage: [UIImage imageNamed: @"celdas_actividades_jornada.png"]];
    
    
    cell.Titulo.text = info.titulo;
    cell.horaInicio.text = [self DateToString:[self StringToDate:info.horaInicio]];
    cell.Hora.text = [self DateToString:[self StringToDate:info.horaFin]];
    cell.Subtitulo.text = info.speaker.nombre;
    cell.Actividad.text = info.tipoEvento;
    cell.lugar.text = info.lugarEnQueMeDesarrollo.nombreLugar;
    return cell;
}

#pragma mark - Fetchs Coredata

-(NSArray*)CargarEventosDelSimposio
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Evento" inManagedObjectContext:self.delegate.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSPredicate *Predicado = [NSPredicate predicateWithFormat:@"(eventoPadre.tituloEP = %@) AND (eventoPadre.jornadaEP = %@)",self.tituloCelda,self.jordadex];
    [fetchRequest setPredicate:Predicado];
    
    NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"horaInicio" ascending:YES];
    NSArray* sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    NSError *error = nil;
    
    return [self.delegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
}
-(NSDate*)StringToDate:(NSString*)hora{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzzz"];
    NSRange RangoReemplazo = {20,5};
    NSString *remplaso = [hora stringByReplacingCharactersInRange:RangoReemplazo withString:@"-0300"];
    return  [dateFormatter dateFromString:remplaso];
}

-(NSString*)DateToString:(NSDate*)Date{
    
    NSDateFormatter *formateadorFecha = [[NSDateFormatter alloc] init];
    [formateadorFecha setDateFormat:@"H:mm"];
    return  [formateadorFecha stringFromDate:Date];
    
}


#pragma -mark Alto de la cada celda

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    return 73.0f;
}

@end
