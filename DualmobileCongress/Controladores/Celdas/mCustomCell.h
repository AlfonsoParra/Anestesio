//
//  mCustomCell.h
//  DualmobileCongress
//
//  Created by luis Gonzalez on 07-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mCustomCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextView *Titulo;
@property (strong, nonatomic) IBOutlet UILabel *Hora;
@property (strong, nonatomic) IBOutlet UIImageView *Imagen;
@property (strong, nonatomic) IBOutlet UILabel *Subtitulo;
@property (strong, nonatomic) IBOutlet UILabel *texto;
@property (strong, nonatomic) IBOutlet UILabel *horaInicio;
@property (strong,nonatomic) IBOutlet UIImageView *ima;
@property (weak, nonatomic) IBOutlet UILabel *dayOfWeekLabel;
@property (weak, nonatomic) IBOutlet UILabel *Actividad;
@property (weak, nonatomic) IBOutlet UILabel *monthLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayOfMonthLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *lugar;
@property (weak, nonatomic) IBOutlet UIButton *botonHotelTelefono;
@property (weak, nonatomic) IBOutlet UIButton *botonHotelGps;
@property (weak, nonatomic) IBOutlet UIButton *botonHotelSitio;




-(void)setTime:(NSDate*)time;

@end
