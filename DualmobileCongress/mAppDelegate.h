//
//  mAppDelegate.h
//  DualmobileCongress
//
//  Created by luis Gonzalez on 06-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mNotificacionesViewController.h"

@interface mAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic , strong)NSMutableArray *DatosNotificaciones;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
