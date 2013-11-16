//
//  mSeleccionJornadaViewController.m
//  DualmobileCongress
//
//  Created by luis Gonzalez on 12-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mSeleccionJornadaViewController.h"
#import "GAI.h"

@interface mSeleccionJornadaViewController ()

@end

@implementation mSeleccionJornadaViewController

-(void)awakeFromNib{
    self.Jornadas = [[NSArray alloc]initWithObjects:@"Jueves 21",@"Viernes 22",@"Sábado 23", nil];
     self.InicioJornadas = [[NSArray alloc]initWithObjects:@"2013-11-21 07:30:00 +0000",@"2013-11-22 07:30:00 +0000",@"2013-11-23 07:30:00 +0000", nil];
    self.FinJornadas = [[NSArray alloc]initWithObjects:@"2013-11-21 22:01:00 +0000",@"2013-11-22 23:01:00 +0000",@"2013-11-23 19:31:00 +0000", nil];
}

- (void)viewDidLoad
{    [super viewDidLoad];
    
    id trackerJornada = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [trackerJornada sendView:@"SeleccionJornada"];
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

- (void )imageTapped:(UITapGestureRecognizer *) gestureRecognizer
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

    return [self.Jornadas count];
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
    
    cell.Titulo.text = [self.Jornadas objectAtIndex:indexPath.row];

    return cell;
}


#pragma -mark enviamos datos de la celda selecionadas a la vista de detalle

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Comprobamos si el identificador esta bien.
    
    if ([segue.identifier isEqualToString:@"Jornada"])
    {
    // Definimos el destino.
        mJornadaViewController *destino = (mJornadaViewController *)segue.destinationViewController;
        destino.InicioJornada = [self.InicioJornadas objectAtIndex:[self.CustomTableview indexPathForSelectedRow].row];
        destino.FinJornada = [self.FinJornadas objectAtIndex:[self.CustomTableview indexPathForSelectedRow].row];
        destino.Titulo =[self.Jornadas objectAtIndex:[self.CustomTableview indexPathForSelectedRow].row];
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
                                        withLabel:@"Revelo desde Selecion Jornada"
                                        withValue:nil];
}

- (IBAction)RevelarNotificaciones:(id)sender {
    [self.slidingViewController anchorTopViewTo:ECLeft];
    id eventoNotificacionesDesdeAhora = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [eventoNotificacionesDesdeAhora sendEventWithCategory:@"uiAction"
                                               withAction:@"Revelar Notificaciones"
                                                withLabel:@"Revelo desde Selecion Jornada"
                                                withValue:nil];

}
- (void)viewDidUnload {
    [self setBotonMenu:nil];
    [self setCustomTableview:nil];
    [super viewDidUnload];
}
@end
