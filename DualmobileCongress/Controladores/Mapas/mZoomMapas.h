//
//  mZoomMapas.h
//  mapaejemplo
//
//  Created by luis Gonzalez on 11-06-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mZoomMapas : UIScrollView<UIScrollViewDelegate> {
    UIImageView *imageView;
    BOOL Iphone5;
}

@property (nonatomic, retain)   UIImageView     *imageView;
@property (nonatomic, retain)   UIImageView     *marcador;
#pragma mark Inicializacion

- (id)initWithImageMapName:(NSString *)NombreImagenMapa atLocation:(CGPoint)PosicionMapa  ImageMarkNane:(NSString*)NombreImagenMarcador atLocationMark:(CGPoint)PosicionMarcador;
- (id)initWithImageMapName:(NSString *)NombreImagenMapa atLocation:(CGPoint)PosicionMapa;  


@end
