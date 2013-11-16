//
//  Notificacion.h
//  DualmobileCongress
//
//  Created by Arturo Sanhueza on 14-10-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Evento, Persona;

@interface Notificacion : NSManagedObject

@property (nonatomic, retain) NSNumber * almacenado;
@property (nonatomic, retain) NSString * contenidoNoti;
@property (nonatomic, retain) NSNumber * esBoton;
@property (nonatomic, retain) NSString * fechaPublicacion;
@property (nonatomic, retain) NSString * urlNotificacion;
@property (nonatomic, retain) Evento *eventoAsociado;
@property (nonatomic, retain) Persona *personaAsociada;

@end
