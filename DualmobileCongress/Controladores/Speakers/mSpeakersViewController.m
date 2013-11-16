//
//  mSpeakersViewController.m
//  DualmobileCongress
//
//  Created by luis Gonzalez on 07-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mSpeakersViewController.h"
#import "mSpeakerCloseViewController.h"
#import "NSDataAdditions.h"
#import "GAI.h"
#import "Eventopadre.h"


@interface mSpeakersViewController ()
@property(nonatomic,strong)mAppDelegate *delegate;
@end

@implementation mSpeakersViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    id trackerSpeaker = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [trackerSpeaker sendView:@"Speaker"];
    
    
    UIImage *barButtonImage = [[UIImage imageNamed:@"btnmenu.png"]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,0,0)];
    [self.BotonMenu setBackgroundImage:barButtonImage
                              forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    self.title = @" ";
	self.delegate = [[UIApplication sharedApplication]delegate];
    [self filter:@""];
    
    UIImage *NotButtonImage = [[UIImage imageNamed:@"boton_nota"]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,0,0)];
    [self.BotonNotificaciones setBackgroundImage:NotButtonImage
                                        forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    self.title = @" ";
    self.SpeakerTableview.scrollEnabled = YES;
    
    NSArray *arr = [NSArray arrayWithObjects:
                    @"publi_bot_1.png",@"publi_bot_2.png", nil];
    [self.animationImageView setImagesArr:arr];
    self.animationImageView.showNavigator = NO;
    [self.animationImageView startAnimating];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma -mark Filtro Barra Busqueda

-(void)filter:(NSString*)text
{
    self.hueasQueSeDepliegan = [[NSMutableArray alloc] init];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Persona" inManagedObjectContext:self.delegate.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"nombre" ascending:YES];
    NSArray* NombreSpeaker = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:NombreSpeaker];
    
    NSPredicate *predicadoSpeaker = [NSPredicate predicateWithFormat:@"(nombre >%@) AND (nombre != %@)AND (nombre != %@)",@"",@"Almuerzo",@"Café"];
    [fetchRequest setPredicate:predicadoSpeaker];
    if(text.length > 0)
    {
        [ovController.view removeFromSuperview];
        
        self.SpeakerTableview.scrollEnabled = YES;
        
        NSPredicate *predicadoSpeaker = [NSPredicate predicateWithFormat:@"(nombre >%@) AND (nombre != %@)AND (nombre != %@)",@"",@"Almuerzo",@"Café"];
        
        [fetchRequest setPredicate:predicadoSpeaker];
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"((lugarDondeProvengo.pais CONTAINS[cd] %@) OR (nombre CONTAINS[cd] %@)OR (institucionQueMePatrocina.nombreInstitucion CONTAINS[cd] %@) OR (rol CONTAINS[cd] %@) OR (eventoParticipo.tituloEP CONTAINS[cd] %@)) AND(nombre >%@)", text,text,text,text,text,@""];
        
        [fetchRequest setPredicate:predicate];
        searching = YES;
    }
    else
    {
		[self.view insertSubview:ovController.view aboveSubview:self.parentViewController.view];
        self.SpeakerTableview.scrollEnabled = NO;
        searching = NO;
	}
    
    NSError *error;
    
    self.coredatinos= [self.delegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    self.hueasQueSeDepliegan= [[NSMutableArray alloc] initWithArray:self.coredatinos];
    
    [self.SpeakerTableview reloadData];
}

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text
{
    [self filter:text];
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)ThesearchBar{
    
if (searching)
    {
        return;
    }
    
	if(ovController == nil)
		ovController = [[mSpeakerCloseViewController alloc] initWithNibName:@"touchSpeaker" bundle:[NSBundle mainBundle]];
	
	CGFloat width = self.view.frame.size.width;
	CGFloat height = self.view.frame.size.height;
	CGFloat yaxis = self.buscar.frame.size.height;
	//Parameters x = origion on x-axis, y = origon on y-axis.
	CGRect frame = CGRectMake(0, yaxis, width, height);
	ovController.view.frame = frame;
	ovController.view.backgroundColor = [UIColor whiteColor];
	ovController.view.alpha = 0.7;
	
	ovController.rvController = self;
	
	[self.view insertSubview:ovController.view aboveSubview:self.parentViewController.view];
    searching =YES;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)aSearchBar{
    [self.buscar resignFirstResponder];
}

#pragma -mark Tableview datasource y delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.coredatinos count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Persona *info = [self.coredatinos objectAtIndex:indexPath.row];
    
    NSString *cellIdentifier = @"SpeakerCell";
    mCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[mCustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.contentView.backgroundColor   =   [UIColor colorWithPatternImage: [UIImage imageNamed: @"celdaSpeaker.png"]];
    UIView *ColorSelecion = [[UIView alloc] init];
    ColorSelecion.backgroundColor = [UIColor colorWithRed:(76/255.0) green:(124/255.0) blue:(255/255.0) alpha:1.0f];
    cell.selectedBackgroundView = ColorSelecion;
    cell.Titulo.text    =   info.nombre;
    cell.Subtitulo.text =   info.institucionQueMePatrocina.nombreInstitucion;
    cell.texto.text     =   info.lugarDondeProvengo.nombreLugar;
    if (cell.texto.text==nil) {
        cell.texto.text = info.lugarDondeProvengo.nombreLugar;
        if (cell.texto.text==nil) {
            cell.texto.text = @"Chile";

        }

    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.buscar resignFirstResponder];
}

#pragma -mark enviamos datos de la celda selecionadas a la vista de detalle

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"SpeakerDet"])
    { mSpeakerDetViewController *destino = (mSpeakerDetViewController *)segue.destinationViewController;
    Persona *info = [self.coredatinos objectAtIndex:[self.SpeakerTableview indexPathForSelectedRow].row];
        destino.Nombrecelda = info.nombre;
        destino.Tituloscelda = info.lugarDondeProvengo.pais;
        destino.ReferenciaSpeaker = info.rol;
        destino.BiografiaCelda = info.bio;
        destino.Institucioncelda = info.rol;
        destino.texto1 = info.nombre;
        destino.texto2 = [NSString stringWithFormat:@"%@  %@", info.tratamiento,info.nombre];
        destino.texto4 = info.cargo;
        destino.texto5 = info.lugarDondeProvengo.nombreLugar;
        destino.texto3 = info.institucionQueMePatrocina.nombreInstitucion;
        destino.informacionS = info.bio;
        NSData *dataObj = [NSData dataWithBase64EncodedString:info.fotoPersona.binarioImagen];
        UIImage *beforeImage = [UIImage imageWithData:dataObj];

        destino.ImagenDelSpeaker = beforeImage;
 }
}

#pragma -mark Alto de la cada celda

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 73.0f;
}

- (void)viewDidUnload {
    [self setBotonMenu:nil];
    [self setBuscar:nil];
    [self setSpeakerTableview:nil];
    [super viewDidUnload];
}

- (IBAction)RevelarMenuLateral:(id)sender
{
    if(ovController == nil)
        [self.buscar resignFirstResponder];
    else
        [self CerrarTeclado];
    
    [self.slidingViewController anchorTopViewTo:ECRight];
    id eventoMenuLateralAhora = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [eventoMenuLateralAhora sendEventWithCategory:@"uiAction"
                                       withAction:@"Revelar Menu Lateral"
                                        withLabel:@"Revelo desde Speaker"
                                        withValue:nil];
}

- (IBAction)RevelarNotificaciones:(id)sender
{
    if(ovController == nil)
        [self.buscar resignFirstResponder];
    else
        [self CerrarTeclado];
    [self.slidingViewController anchorTopViewTo:ECLeft];
    id eventoNotificacionesDesdeAhora = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [eventoNotificacionesDesdeAhora sendEventWithCategory:@"uiAction"
                                               withAction:@"Revelar Notificaciones"
                                                withLabel:@"Revelo desde Speaker"
                                                withValue:nil];
}

-(void)CerrarTeclado{
    [self.buscar resignFirstResponder];
    [ovController.view removeFromSuperview];
	ovController = nil;
    self.SpeakerTableview.scrollEnabled = YES;
	[self.SpeakerTableview reloadData];
    searching = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    
       [super viewWillAppear:animated];
}
@end
