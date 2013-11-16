//
//  mSeleccionJornadaViewController.m
//  DualmobileCongress
//
//  Created by luis Gonzalez on 12-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mHotelesTabla.h"
#import "GAI.h"



@interface mHotelesTabla ()

@end

@implementation mHotelesTabla

-(void)awakeFromNib{
    self.Hoteles = [[NSArray alloc]initWithObjects:
                    @"Hotel Hyatt",
                    @"Hotel Plaza San Francisco",
                    @"Hotel Starwood", nil];
    self.descripcionHotel = [[NSArray alloc] initWithObjects:@"Somos una empresa de hotelería global con marcas líderes en la industria ampliamente reconocidas y una tradición de innovación desarrollada a lo largo de nuestros más de cincuenta años de trayectoria. Nuestra misión es ofrecer auténtica hospitalidad al marcar una diferencia en las vidas de las personas con las que estamos en contacto todos los días. Nos enfocamos en esta misión en la búsqueda de nuestro objetivo de convertirnos en la marca más preferida en cada segmento al que prestamos servicio para nuestros empleados, clientes y propietarios. Apoyamos nuestra misión y nuestro objetivo al adherirnos a un conjunto de valores clave que caracterizan nuestra cultura.",
                             
                             
    @"Somos el único Hotel sustentable de Santiago, nuestra ubicación es privilegiada pasos del casco histórico y de los atractivos turísticos más importantes de la ciudad, disfruta de una estadía única, con la sensación de estar en casa pero en la comodidad de un Hotel 5 estrellas ¡Bienvenido a Santiago de Chile!",
        
     @"Starwood Hotels & Resorts Worldwide, Inc. es la compañía hotelera más moderna y global del mundo. Nuestra fortaleza radica en nueve distinguidas marcas de estilo de vida, un programa de fidelidad galardonado y 171,000 empleados talentosos en todo el mundo.", nil]
  ;  
    
     self.paginaHoteles = [[NSArray alloc]initWithObjects:
    @"http://hyatt.com/",
    @"http://www.plazasanfrancisco.cl/",
    @"http://www.starwoodhotels.com/", nil];
    

    self.fonoHotel = [[NSArray alloc]initWithObjects:@"96798408",@"84649272",@"0412391757", nil];
    
    
    _coordenadasHotelesY = [[NSArray alloc] initWithObjects:@"-36.83333",@"-33.43333",@"-30.23333",nil];
    _coordenadasHotelesX = [[NSArray alloc] initWithObjects:@"-73.055028",@"-73.055028",@"-73.055028",nil];

}

- (void)viewDidLoad
{    [super viewDidLoad];
    
    id trackerJornada = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [trackerJornada sendView:@"SeleccionHotel"];
    UIImage *barButtonImage = [[UIImage imageNamed:@"btnmenu.png"]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,0,0)];
    [self.BotonMenu setBackgroundImage:barButtonImage
                              forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
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
}

- (void)imageTapped:(UITapGestureRecognizer *) gestureRecognizer
{
    NSLog(@"tap imagen");
    id TokeImagenTracking = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [TokeImagenTracking sendEventWithCategory:@"uiAction"
                                   withAction:@"Tap Publicidad"
                                    withLabel:@"Tap Branding Principal"
                                    withValue:nil];
    
}
#pragma -mark Tableview datasource y delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.Hoteles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"customCell";
    mCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[mCustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.contentView.backgroundColor   =   [UIColor colorWithPatternImage: [UIImage imageNamed: @"celdaSpeaker.png"]];

    cell.Titulo.text = [self.Hoteles objectAtIndex:indexPath.row];
    cell.Subtitulo.text = [self.paginaHoteles objectAtIndex:indexPath.row];
    return cell;
}


#pragma -mark enviamos datos de la celda selecionadas a la vista de detalle

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Comprobamos si el identificador esta bien.
    
    if ([segue.identifier isEqualToString:@"Hotel"])
    {
        mDetalleHotel *destino = (mDetalleHotel *)segue.destinationViewController;
        destino.detalleNombre = [self.Hoteles objectAtIndex:[self.CustomTableview indexPathForSelectedRow].row];
        destino.detalleWea = [self.paginaHoteles objectAtIndex:[self.CustomTableview indexPathForSelectedRow].row];
        destino.detalleFono = [self.fonoHotel objectAtIndex:[self.CustomTableview indexPathForSelectedRow].row];
        destino.detalleX = [self.coordenadasHotelesX objectAtIndex:[self.CustomTableview indexPathForSelectedRow].row];
        destino.detalleY = [self.coordenadasHotelesY objectAtIndex:[self.CustomTableview indexPathForSelectedRow].row];
        destino.detalleDescripcion = [self.descripcionHotel objectAtIndex:[self.CustomTableview indexPathForSelectedRow].row];
    }
    
  }
#pragma -mark Alto de la cada celda

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 73.0f;
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
- (void)viewDidUnload {
    [self setBotonMenu:nil];
    [self setCustomTableview:nil];
    [super viewDidUnload];
}
@end
