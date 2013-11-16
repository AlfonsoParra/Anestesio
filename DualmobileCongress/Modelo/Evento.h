//
//  Evento.h
//  DualmobileCongress
//
//  Created by Arturo Sanhueza on 14-10-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Eventopadre, Imagen, Institucion, Lugar, Notificacion, Persona;

@interface Evento : NSManagedObject

@property (nonatomic, retain) NSString * descripcionEvento;
@property (nonatomic, retain) NSString * horaFin;
@property (nonatomic, retain) NSString * horaInicio;
@property (nonatomic, retain) NSString * jornada;
@property (nonatomic, retain) NSNumber * patrocionio;
@property (nonatomic, retain) NSString * tematica;
@property (nonatomic, retain) NSString * tipoEvento;
@property (nonatomic, retain) NSString * titulo;
@property (nonatomic, retain) Eventopadre *eventoPadre;
@property (nonatomic, retain) Imagen *imagenEvento;
@property (nonatomic, retain) NSSet *institucionPatrocinante;
@property (nonatomic, retain) Lugar *lugarEnQueMeDesarrollo;
@property (nonatomic, retain) NSSet *notificacionMeReferencia;
@property (nonatomic, retain) Persona *speaker;
@end

@interface Evento (CoreDataGeneratedAccessors)

- (void)addInstitucionPatrocinanteObject:(Institucion *)value;
- (void)removeInstitucionPatrocinanteObject:(Institucion *)value;
- (void)addInstitucionPatrocinante:(NSSet *)values;
- (void)removeInstitucionPatrocinante:(NSSet *)values;

- (void)addNotificacionMeReferenciaObject:(Notificacion *)value;
- (void)removeNotificacionMeReferenciaObject:(Notificacion *)value;
- (void)addNotificacionMeReferencia:(NSSet *)values;
- (void)removeNotificacionMeReferencia:(NSSet *)values;

@end
