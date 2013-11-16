//
//  mMapaConferenciaViewController.h
//  DualmobileCongress
//
//  Created by luis Gonzalez on 12-06-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mZoomMapas.h"
#import "GAITrackedViewController.h"
#import "GAI.h"
#import "AnimatedImagesView.h"

@interface mMapaConferenciaViewController : UIViewController{
    float Cordenadax;
    float Cordenaday;
}
@property(nonatomic,strong)NSString *salon;
@property(nonatomic,strong)NSString *NombreMapa;
@property (nonatomic, strong) IBOutlet AnimatedImagesView *animationImageView;

@end
