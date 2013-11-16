//
//  Persona.h
//  DualmobileCongress
//
//  Created by Arturo Sanhueza on 14-10-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Evento, Eventopadre, Imagen, Institucion, Lugar, Notificacion;

@interface Persona : NSManagedObject

@property (nonatomic, retain) NSString * bio;
@property (nonatomic, retain) NSString * cargo;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * rol;
@property (nonatomic, retain) NSString * tratamiento;
@property (nonatomic, retain) Eventopadre *eventoParticipo;
@property (nonatomic, retain) NSSet *eventoQueDicto;
@property (nonatomic, retain) Imagen *fotoPersona;
@property (nonatomic, retain) Institucion *institucionQueMePatrocina;
@property (nonatomic, retain) Lugar *lugarDondeProvengo;
@property (nonatomic, retain) Notificacion *notificacionSobreMi;
@end

@interface Persona (CoreDataGeneratedAccessors)

- (void)addEventoQueDictoObject:(Evento *)value;
- (void)removeEventoQueDictoObject:(Evento *)value;
- (void)addEventoQueDicto:(NSSet *)values;
- (void)removeEventoQueDicto:(NSSet *)values;

@end
