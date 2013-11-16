//
//  mHomeViewController.m
//  DualmobileCongress
//
//  Created by luis Gonzalez on 06-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mHomeViewController.h"
#import "mAppDelegate.h"
#import "NSDataAdditions.h"
#import "GAI.h"
#import "Eventopadre.h"
#import "Persona.h"
#import "Lugar.h"
#import "Evento.h"
#import "Institucion.h"
#import "Notificacion.h"
#import "mCongressAPIClient.h"

@interface mHomeViewController ()

@property(nonatomic,strong)mAppDelegate *delegate;

@end

@implementation mHomeViewController

-(void)awakeFromNib
{
    [self.HomeTableview reloadData];

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.delegate = [[UIApplication sharedApplication]delegate];
    
   
    // refresh
    
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    [refresh addTarget:self
                action:@selector(refreshView:)
      forControlEvents:UIControlEventValueChanged];
    
    [self.HomeTableview addSubview:refresh];
    
    //trackenado GA

    id trackerAhora = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [trackerAhora sendView:@"Ahora"];
    
  
    
    UIImage *barButtonImage = [[UIImage imageNamed:@"btnmenu.png"]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,0,0)];
    
    [self.BotonMenu setBackgroundImage:barButtonImage
                                  forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    UIImage *NotButtonImage = [[UIImage imageNamed:@"boton_nota"]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,0,0)];
    [self.BotonNotificaciones setBackgroundImage:NotButtonImage
                                        forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    self.delegate = [[UIApplication sharedApplication]delegate];

    self.title = @" ";
    EstadoDeLaconexion = [UIDevice estaConectado];
    self.refresh = refresh;
    
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
}

#pragma -mark Tableview datasource y delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    self.EnesteMomento = [[NSMutableArray alloc]initWithArray:[self CargarEnEsteMomento]];
    self.ProximasActividades = [[NSMutableArray alloc]initWithArray:[self CargarProximasActividades]];
    
    int rows;
    if (section == 0) {
        rows = [self.EnesteMomento count];
    }
    else{
        rows = [self.ProximasActividades count];
        
    }
        return rows;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

/*
 *  Esta condicion indica el estilo del fondo de cada celda
 *  si es una en este momento y las de las prximas actividades
 *  indicando la cantidad de actividades hay en ese momento podemos
 *  preguntamos cuantas actividades hay en el momento y le cambiamos el fondo.
 */

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellIdentifier = @"HomeCell";
    mCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[mCustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.opaque = YES;
        cell.Imagen.opaque = YES;
    }
    
        if (indexPath.section == 0)
    {
        Evento *info = [self.EnesteMomento objectAtIndex:indexPath.row];

        UIView *ColorSelecion = [[UIView alloc] init];
        ColorSelecion.backgroundColor = [UIColor colorWithRed:(246/255.0) green:(146/255.0) blue:(28/255.0) alpha:1.0f];
        cell.selectedBackgroundView = ColorSelecion;
        cell.contentView.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed: @"eem.png"]];
        cell.Subtitulo.text = info.speaker.nombre;
        cell.Titulo.text = info.titulo;
        cell.horaInicio.text = [self DateToString:[self StringToDate:info.horaInicio]];
        cell.Hora.text = [self DateToString:[self StringToDate:info.horaFin]];
        cell.texto.text = info.lugarEnQueMeDesarrollo.nombreLugar;
        cell.Actividad.text = info.tipoEvento;
    }

        else
    {
        
         Evento *info = [self.ProximasActividades objectAtIndex:indexPath.row];
        UIView *ColorSelecion = [[UIView alloc] init];
        ColorSelecion.backgroundColor = [UIColor colorWithRed:(76/255.0) green:(124/255.0) blue:(255/255.0) alpha:1.0f];
        cell.selectedBackgroundView = ColorSelecion;
        cell.horaInicio.text = [self DateToString:[self StringToDate:info.horaInicio]];
        cell.Hora.text = [self DateToString:[self StringToDate:info.horaFin]];
        cell.contentView.backgroundColor   =   [UIColor colorWithPatternImage: [UIImage imageNamed: @"paa.png"]];
        cell.Titulo.text = info.titulo;
        cell.Subtitulo.text = info.speaker.nombre;
        cell.texto.text = info.lugarEnQueMeDesarrollo.nombreLugar;
        cell.Actividad.text = info.tipoEvento;
    
    }

    return cell;
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


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *ColorSelecion = [[UIView alloc] init];
    
    if (section==0)
    {
        if ([self.EnesteMomento count]>0)
        {
            ColorSelecion.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"labeleem"]];
        }
    }
    return ColorSelecion;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    float altotitulo;
    if (section == 0) {
        if ([self.EnesteMomento count]==0) {
            altotitulo = 0.0f;
            if ([UIScreen mainScreen].bounds.size.height == 568.0)
            {
                self.HomeTableview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"no_hay_activ_1136"]];
            }
            else
            {

            self.HomeTableview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"no_hay_activ"]];
            }

        }
        else
        {
            altotitulo = 20.0f;
        }
    }
    else{
        altotitulo = 0.0f;
    }
    return altotitulo;
}


#pragma -mark enviamos datos de la celda selecionadas a la vista de detalle

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Comprobamos si el identificador es el adecuado
    
    if ([segue.identifier isEqualToString:@"home"])
    {
        // Obtenemos el controlador destino
        
       mDetalleViewController *destino = (mDetalleViewController *)segue.destinationViewController;
        NSIndexPath *indexPath = [self.HomeTableview indexPathForSelectedRow];
        NSLog(@"seccion seleccionada es ==> %d",indexPath.section);
        if (indexPath.section == 0)
        {
            Evento *info = [self.EnesteMomento objectAtIndex:indexPath.row];
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
            if ([info.eventoPadre.tipoEP isEqualToString:@"Módulo"] || [info.eventoPadre.tipoEP isEqualToString:@"Taller"])
            {
                destino.JornadaEventoPadre = info .eventoPadre.jornadaEP;
                destino.EsSimposio = true;
                destino.tituloEP2 = info.eventoPadre.tituloEP;
                destino.nombreBarra = @"Actividad del Módulo";
                destino.tipoEventoPadre2 =info.eventoPadre.tipoEP;
                destino.descEP2 = info.eventoPadre.descripcionEP;
                destino.lugarEP2 = info.eventoPadre.lugarEnQueMeDesarrollo.nombreLugar;
                destino.textoLabelSimposio = @"Módulo";
              
                
                
            }
            else
            {
                destino.EsSimposio = false;
                
                
            }
            


        }
        else
        {
            Evento *info = [self.ProximasActividades objectAtIndex:indexPath.row];
            NSData *dataObj = [NSData dataWithBase64EncodedString:info.speaker.fotoPersona.binarioImagen];
            UIImage *beforeImage = [UIImage imageWithData:dataObj];
            destino.ExpositorCelda = info.speaker.nombre;
            destino.tituloCelda = info.titulo;
            destino.ContenidoCelda =info.descripcionEvento;
            destino.LugarCelda = info.lugarEnQueMeDesarrollo.nombreLugar;
            destino.NombreImagen = beforeImage;
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
            if ([info.eventoPadre.tipoEP isEqualToString:@"Módulo"]|| [info.eventoPadre.tipoEP isEqualToString:@"Taller"])
            {
                destino.JornadaEventoPadre = info .eventoPadre.jornadaEP;
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
               
                
            }
            
        }
    }

    
}
#pragma mark - Fetchs Coredata

-(NSArray*)CargarEnEsteMomento
{
    NSDate *horaDispositivo = [[NSDate alloc]initWithTimeIntervalSinceNow:0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzzz"];
 
    NSString *strDate = [dateFormatter stringFromDate:horaDispositivo];
    NSRange remplazoFecha = {0, 6};
    NSDate *HoraActual = [dateFormatter dateFromString:[strDate stringByReplacingCharactersInRange:remplazoFecha withString:@"2013-1"]];
    NSString *strDate2 = [dateFormatter stringFromDate:HoraActual];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Evento" inManagedObjectContext:self.delegate.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSPredicate *Predicado = [NSPredicate predicateWithFormat:@"(horaInicio <= %@) AND (horaFin > %@)",strDate2,strDate2];
    [fetchRequest setPredicate:Predicado];

    NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"horaInicio" ascending:YES];
    NSArray* sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    NSError *error = nil;
    
    return [self.delegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
}

-(NSArray*)CargarProximasActividades{
    
    NSDate *horaDispocitivo = [[NSDate alloc]initWithTimeIntervalSinceNow:0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzzz"];
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"yyyy-MM-dd"];
    
    NSString *strDate = [dateFormatter stringFromDate:horaDispocitivo];
//       NSRange remplazoFecha = {0, 7};
//    NSDate *HoraActual = [dateFormatter dateFromString:[strDate stringByReplacingCharactersInRange:remplazoFecha withString:@"2013-10"]];
    NSString *strDate2 = [dateFormatter2 stringFromDate:horaDispocitivo];
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    // Defineself.navigationItem.hidesBackButton = YES; the entity we are looking for
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Evento" inManagedObjectContext:self.delegate.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *Predicado = [NSPredicate predicateWithFormat:@"(horaInicio > %@) AND (horaFin CONTAINS[cd] %@)",strDate,strDate2];
    [fetchRequest setPredicate:Predicado];
    
    // Define how we want our entities to be sorted
    NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"horaInicio" ascending:YES];
    NSArray* sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    NSError *error = nil;
    return [self.delegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];

}

#pragma -mark Alto de la cada celda

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (indexPath.section ==0)
    {
        return 73.0f;
    }
    else return 73.0f;
}


- (IBAction)RevelarMenuLateral:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
    
    id eventoMenuLateralAhora = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [eventoMenuLateralAhora sendEventWithCategory:@"uiAction"
                                       withAction:@"Revelar Menu Lateral"
                                        withLabel:@"Revelo desde Ahora"
                                        withValue:nil];
    }


- (IBAction)RevelarNotificaciones:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECLeft];

    
    id eventoNotificacionesDesdeAhora = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [eventoNotificacionesDesdeAhora sendEventWithCategory:@"uiAction"
                                               withAction:@"Revelar Notificaciones"
                                                withLabel:@"Revelo desde Ahora"
                                                withValue:nil];
    
  
    

}

#pragma mark - PullToRefresh delegate

- (void)beginRefreshing {
    if (EstadoDeLaconexion == TRUE)
    {
        NSLog(@"existe Conexion");
        [self refresh];
        [self.HomeTableview reloadData];
    }
    else
    {
        UIAlertView *Alerta = [[UIAlertView alloc]initWithTitle:@"Conexion De Red" message:@"No Existe Conexion al Servidor" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [Alerta show];
    }
    
    [self.refresh endRefreshing];
    
}

-(void)refreshView:(UIRefreshControl *)refresh {
    
    [self.EnesteMomento removeAllObjects];
    self.EnesteMomento = [[NSMutableArray alloc]initWithArray:[self CargarEnEsteMomento]];
    [self.ProximasActividades removeAllObjects];
    self.ProximasActividades = [[NSMutableArray alloc]initWithArray:[self CargarProximasActividades]];
    [self.HomeTableview reloadData];
    [self.refresh endRefreshing];
    
    //**********poner aqui sincronizador
}


- (void)endRefreshing {
    EstadoDeLaconexion = [UIDevice estaConectado];
    NSLog(@"conexcion ==> %d", EstadoDeLaconexion);
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];

  
}

- (void)viewDidUnload
{
    [self setBotonMenu:nil];
    [self setBotonNotificaciones:nil];
    [self setHomeTableview:nil];
    [super viewDidUnload];
}

@end
