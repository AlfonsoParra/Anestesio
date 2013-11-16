//
//  Eventopadre.h
//  DualmobileCongress
//
//  Created by Arturo Sanhueza on 14-10-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Evento, Imagen, Lugar, Institucion, Persona;

@interface Eventopadre : NSManagedObject

@property (nonatomic, retain) NSString * descripcionEP;
@property (nonatomic, retain) NSString * horaFinEP;
@property (nonatomic, retain) NSString * horaInicioEP;
@property (nonatomic, retain) NSString * jornadaEP;
@property (nonatomic, retain) NSNumber * patrocinioEP;
@property (nonatomic, retain) NSString * tipoEP;
@property (nonatomic, retain) NSString * tituloEP;
@property (nonatomic, retain) NSSet *eventoHijo;
@property (nonatomic, retain) Imagen *imagenEventoPadre;
@property (nonatomic, retain) Institucion *institucionPatrocinante;
@property (nonatomic, retain) Persona *participantes;
@property (nonatomic, retain) Lugar *lugarEnQueMeDesarrollo;

@end

@interface Eventopadre (CoreDataGeneratedAccessors)

- (void)addEventoHijoObject:(Evento *)value;
- (void)removeEventoHijoObject:(Evento *)value;
- (void)addEventoHijo:(NSSet *)values;
- (void)removeEventoHijo:(NSSet *)values;


@end
