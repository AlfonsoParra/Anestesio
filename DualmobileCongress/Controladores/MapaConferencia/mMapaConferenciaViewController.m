//
//  mMapaConferenciaViewController.m
//  DualmobileCongress
//
//  Created by luis Gonzalez on 12-06-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mMapaConferenciaViewController.h"

@interface mMapaConferenciaViewController ()

@end

@implementation mMapaConferenciaViewController

- (void)viewDidLoad
{
    id trackerJornada = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [trackerJornada sendView:@"MapaConferencia"];
    
    CGRect limitesDeLaPantalla = [[UIScreen mainScreen] bounds];
    if (limitesDeLaPantalla.size.height == 480) {
        
        NSLog(@"el salón maricón pa iphone 4 es: %@",self.salon);
        
        [self callampaDelMapaIphone4];
    }
    else {
        
        NSLog(@"el salón maricón pa iphone 5 es: %@",self.salon);
        
        [self callampaDelMapaIphone5];
        
    }
    
    mZoomMapas *zoom = [[mZoomMapas alloc]initWithImageMapName:self.NombreMapa atLocation:CGPointMake(0,0) ImageMarkNane:@"pinRed" atLocationMark:CGPointMake(Cordenadax , Cordenaday)];
    
    [self.view addSubview:zoom];
    self.title = @" ";
    
    NSArray *arr = [NSArray arrayWithObjects:
                    @"publi_bot_1.png",@"publi_bot_2.png", nil];
    [self.animationImageView setImagesArr:arr];
    self.animationImageView.showNavigator = NO;
    [self.animationImageView startAnimating];
	
}

-(void)callampaDelMapaIphone4 {
    
    if ([self.salon isEqualToString:@"Salón del Parque I"])
    {
        Cordenadax = 75;
        Cordenaday = 150;
        self.NombreMapa = @"centroparque_nivelb.png";
        
    }
    else if ([self.salon isEqualToString:@"Salón del Parque II"])
    {
        Cordenadax = 75;
        Cordenaday = 90;
        self.NombreMapa = @"centroparque_nivelb.png";
        
    }
    else if ([self.salon isEqualToString:@"Salón del Parque III"])
    {
        Cordenadax = 75;
        Cordenaday = 50;
        self.NombreMapa = @"centroparque_nivelb.png";
        
    }
    else if ([self.salon isEqualToString:@"Salón Patio Austral"])
    {
        Cordenadax = 125;
        Cordenaday = 50;
        self.NombreMapa = @"centroparque_nivelb.png";
        
    }
    else if ([self.salon isEqualToString:@"Parque I"])
    {
        Cordenadax = 75;
        Cordenaday = 150;
        self.NombreMapa = @"centroparque_nivelb.png";
        
    }
    
    else if ([self.salon isEqualToString:@"Parque II y III"])
    {
        Cordenadax = 75;
        Cordenaday = 70;
        self.NombreMapa = @"centroparque_nivelb.png";
        
    }
    
    
    else if ([self.salon isEqualToString:@"Salón El Canelo"])
    {
        Cordenadax = 200;
        Cordenaday = 35;
        self.NombreMapa = @"centroparque_nivelb.png";
        
    }
    
    else if ([self.salon isEqualToString:@"Salón Araucaria I"])
    {
        Cordenadax = 200;
        Cordenaday = 55;
        self.NombreMapa = @"centroparque_nivelb.png";
        
    }
    
    else if ([self.salon isEqualToString:@"Salón Araucaria II"])
    {
        Cordenadax = 200;
        Cordenaday = 55;
        self.NombreMapa = @"centroparque_nivelb.png";
        
    }

    
    else
    {
        Cordenadax = 180;
        Cordenaday = 200;
        self.NombreMapa = @"centroparque_nivelb.png";
    }
}
-(void)callampaDelMapaIphone5{
    
    if ([self.salon isEqualToString:@"Salón del Parque I"])
    {
        Cordenadax = 85;
        Cordenaday = 200;
        self.NombreMapa = @"centroparque_nivelb.png";
        
    }
    else if ([self.salon isEqualToString:@"Salón del Parque II"])
    {
        Cordenadax = 85;
        Cordenaday = 140;
        self.NombreMapa = @"centroparque_nivelb.png";
        
    }
    else if ([self.salon isEqualToString:@"Salón del Parque III"])
    {
        Cordenadax = 85;
        Cordenaday = 70;
        self.NombreMapa = @"centroparque_nivelb.png";
        
    }
    else if ([self.salon isEqualToString:@"Salón Patio Austral"])
    {
        Cordenadax = 165;
        Cordenaday = 70;
        self.NombreMapa = @"centroparque_nivelb.png";
        
    }
    else if ([self.salon isEqualToString:@"Parque I"])
    {
        Cordenadax = 85;
        Cordenaday = 200;
        self.NombreMapa = @"centroparque_nivelb.png";
        
    }
    
    else if ([self.salon isEqualToString:@"Parque II y III"])
    {
        Cordenadax = 85;
        Cordenaday = 120;
        self.NombreMapa = @"centroparque_nivelb.png";
        
    }
    
    else if ([self.salon isEqualToString:@"Salón El Canelo"])
    {
        Cordenadax = 260;
        Cordenaday = 45;
        self.NombreMapa = @"centroparque_nivelb.png";
        
    }
    
    else if ([self.salon isEqualToString:@"Salón Araucaria I"])
    {
        Cordenadax = 260;
        Cordenaday = 90;
        self.NombreMapa = @"centroparque_nivelb.png";
        
    }

    else if ([self.salon isEqualToString:@"Salón Araucaria II"])
    {
        Cordenadax = 260;
        Cordenaday = 90;
        self.NombreMapa = @"centroparque_nivelb.png";
        
    }

    
    
    else
    {
        Cordenadax = 180;
        Cordenaday = 200;
        self.NombreMapa = @"centroparque_nivelb.png";
    }
}

@end
