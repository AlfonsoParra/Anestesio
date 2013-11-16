//
//  mZoomMapas.m
//  mapaejemplo
//
//  Created by luis Gonzalez on 11-06-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mZoomMapas.h"
#import "mAppDelegate.h"

#define IS_IPHONE_5 ([[UIScreen mainScreen] bounds].size.height == 568)
#define IS_IPHONE_4 ([[UIScreen mainScreen] bounds].size.height < 568)

@implementation mZoomMapas
@synthesize imageView,marcador;

-(id)initWithImageMapName:(NSString *)NombreImagenMapa atLocation:(CGPoint)PosicionMapa{
    
    
    self = [super init];
    if (self) {
        
        self.delegate = self;
            
        float sysVer = [[[UIDevice currentDevice] systemVersion] floatValue];
        
        if (( IS_IPHONE_5 ) && (sysVer >= 7.0))
        {
            CGRect frameview = CGRectMake(0, 0, 310, 425);
            self.imageView = [[UIImageView alloc] initWithFrame:frameview];
            
            self.frame = CGRectMake(5, 70, 310, self.imageView.frame.size.height);
        }
        
    else if ((IS_IPHONE_5) && (sysVer <7.0))
        {
            CGRect frameview = CGRectMake(0, 0, 310, 425);
            self.imageView = [[UIImageView alloc] initWithFrame:frameview];
            
            self.frame = CGRectMake(PosicionMapa.x, PosicionMapa.y,
                                    310, self.imageView.frame.size.height);
        }
        
    else if ((IS_IPHONE_4) && (sysVer >= 7.0))
        {
            CGRect frameview = CGRectMake(30, 0, 250, 340);
            self.imageView = [[UIImageView alloc] initWithFrame:frameview];
            
            self.frame = CGRectMake(5, 70,
                                    310, self.imageView.frame.size.height);
        }
        
      else  if ((IS_IPHONE_4) && (sysVer <7.0))
        {
            CGRect frameview = CGRectMake(30, 0, 250, 340);
            self.imageView = [[UIImageView alloc] initWithFrame:frameview];
            
            self.frame = CGRectMake(PosicionMapa.x, PosicionMapa.y,
                                    310, self.imageView.frame.size.height);
        }
        
        [self.imageView setImage:[UIImage imageNamed:NombreImagenMapa]];
        
//        self.frame = CGRectMake(PosicionMapa.x, PosicionMapa.y,
//                            self.imageView.frame.size.width, self.imageView.frame.size.height);
        
        self.minimumZoomScale = 1.0f;
        self.maximumZoomScale = 3.0f;
        
        [self addSubview:self.imageView];

    }

    return self;
}

-(id)initWithImageMapName:(NSString *)NombreImagenMapa atLocation:(CGPoint)PosicionMapa ImageMarkNane:(NSString *)NombreImagenMarcador atLocationMark:(CGPoint)PosicionMarcador{
    self = [super init];
    if (self) {
        
        self.delegate = self;
        
        float sysVer = [[[UIDevice currentDevice] systemVersion] floatValue];
        
        if (( IS_IPHONE_5 ) && (sysVer >= 7.0))
        {
            CGRect frameview = CGRectMake(0, 0, 310, 425);
            self.imageView = [[UIImageView alloc] initWithFrame:frameview];
            
            self.frame = CGRectMake(5, 70,
                                    310, self.imageView.frame.size.height);
        }
        
     else   if ((IS_IPHONE_5) && (sysVer <7.0))
        {
            CGRect frameview = CGRectMake(0, 0, 310, 425);
            self.imageView = [[UIImageView alloc] initWithFrame:frameview];
            
            self.frame = CGRectMake(PosicionMapa.x, PosicionMapa.y,
                                    310, self.imageView.frame.size.height);
        }
        
    else if ((IS_IPHONE_4) && (sysVer >= 7.0))
        {
            CGRect frameview = CGRectMake(30, 0, 250, 340);
            self.imageView = [[UIImageView alloc] initWithFrame:frameview];
            
            self.frame = CGRectMake(5, 70,
                                    310, self.imageView.frame.size.height);
        }
        
      else  if ((IS_IPHONE_4) && (sysVer <7.0))
        {
            CGRect frameview = CGRectMake(30, 0, 250, 340);
            self.imageView = [[UIImageView alloc] initWithFrame:frameview];
            
            self.frame = CGRectMake(PosicionMapa.x, PosicionMapa.y,
                                    310, self.imageView.frame.size.height);
        }
        [self.imageView setImage:[UIImage imageNamed:NombreImagenMapa]];
        self.marcador = [[UIImageView alloc]initWithImage:[UIImage imageNamed:NombreImagenMarcador]];
        
        self.marcador.frame =CGRectMake((self.imageView.frame.size.width/2),(self.imageView.frame.size.height/2),
                                        self.marcador.frame.size.width, self.marcador.frame.size.height);
        
        self.frame = CGRectMake(PosicionMapa.x, PosicionMapa.y,
                                self.imageView.frame.size.width, self.imageView.frame.size.height);
        
        self.minimumZoomScale = 1.0f;
        self.maximumZoomScale = 3.0f;
        
        // Add image view as a subview
        [self.imageView addSubview:self.marcador];
        [self addSubview:self.imageView];
        [UIView animateWithDuration:1.5 animations:^{
            self.marcador.frame = CGRectMake(PosicionMarcador.x, PosicionMarcador.y,self.marcador.frame.size.width, self.marcador.frame.size.height);
            
        } completion:^(BOOL finished) {
        }];
    }
    return self;
}

#pragma mark - UIScrollViewDelegates

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale {
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}


@end
