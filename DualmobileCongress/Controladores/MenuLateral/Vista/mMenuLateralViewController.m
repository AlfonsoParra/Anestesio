//
//  mMenuLateralViewController.m
//  DualmobileCongress
//
//  Created by luis Gonzalez on 06-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mMenuLateralViewController.h"
#import "GAI.h"
#import "mAppDelegate.h"

#import "Eventopadre.h"
#import "Persona.h"
#import "Lugar.h"
#import "Evento.h"
#import "Institucion.h"
#import "Notificacion.h"
#import "mCongressAPIClient.h"

@interface mMenuLateralViewController ()

@end

@implementation mMenuLateralViewController
@synthesize IconoMenu , MenuItems;

#pragma -marks Inicialisacion

-(void)awakeFromNib
{
    self.IconoMenu   = [[NSArray alloc]initWithObjects:@"butonhome.png",@"ButtonJornada.png",@"ButtonSpeakers.png",@"ButtonBusqueda.png",@"ButtonMapa.png",@"ButtonAbout", nil];
                    
    self.MenuItems  = [[NSArray alloc]initWithObjects: @"Ahora",@"Jornada",@"Speaker",@"Busqueda",@"Mapas",@"About", nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.slidingViewController setAnchorRightRevealAmount:205.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
    
    NSArray *arr = [NSArray arrayWithObjects:
                    @"publi_side_1.png",@"publi_side_2.png", nil];
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
                                    withLabel:@"Tap Branding Lateral"
                                    withValue:nil];
    
}


#pragma mark Tableview Delegate y DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return self.MenuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"MenuCell";
    mMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[mMenuCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.Titulo.text = [self.MenuItems objectAtIndex:indexPath.row];
    cell.IconoMenu.image = [UIImage imageNamed:[self.IconoMenu objectAtIndex:indexPath.row]];
    UIView *ColorSelecion = [[UIView alloc] init];
    ColorSelecion.backgroundColor = [UIColor colorWithRed:(189/255.0) green:(189/255.0) blue:(189/255.0) alpha:1.0f];
    cell.selectedBackgroundView = ColorSelecion;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [NSString stringWithFormat:@"%@", [self.MenuItems objectAtIndex:indexPath.row]];
    NSString *label = [[NSString alloc]initWithFormat:@"Tap Opcion %@",identifier];
    id trackingMenu = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    
    [trackingMenu sendEventWithCategory:@"uiAction"
                             withAction:@"Tap Menu Lateral"
                              withLabel:label
                              withValue:nil];
    
    UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    
    [self.slidingViewController anchorTopViewOffScreenTo:205.0f animations:nil onComplete:^{
        CGRect frame = self.slidingViewController.topViewController.view.frame;
        self.slidingViewController.topViewController = newTopViewController;
        self.slidingViewController.topViewController.view.frame = frame;
        [self.slidingViewController resetTopView];
    }];
}

@end

