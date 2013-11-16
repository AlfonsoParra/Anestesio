//
//  SEBViewController.m
//  BasicMaps
//
//  Created by Sebs on 2/12/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import "SEBViewController.h"
#import <MapKit/MapKit.h>

@interface SEBViewController ()
@end

@implementation SEBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    [self.locationManager setDistanceFilter:1000];
    [self.locationManager startUpdatingLocation];
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:[self uno]];
  //  [annotation setTitle:self.textoHotel];
    [self.mapView addAnnotation:annotation];
 //   [self pichuleile];
}

-(void)pichuleile{
    
    CLLocationCoordinate2D coordinate = [self uno];
    MKPlacemark* placeMark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil];
    MKMapItem* destination =  [[MKMapItem alloc] initWithPlacemark:placeMark];
    
    if([destination respondsToSelector:@selector(openInMapsWithLaunchOptions:)])
    {
        [destination openInMapsWithLaunchOptions:@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving}];
  }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - CLLocationManagerDelegate methods

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusAuthorized) {
        [self.locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    [self addPinToMapAtLocation:location];
}

- (CLLocationCoordinate2D)uno {
    
    float CY = [self.Y floatValue];
    float CX = [self.X floatValue];
    return CLLocationCoordinate2DMake(CY,CX);
}

- (MKAnnotationView *)mapView:(MKMapView *)map viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString *AnnotationViewID = @"annotationViewID";
    MKAnnotationView *annotationView = (MKAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
    annotationView.image = [UIImage imageNamed:@"location.png"];
    annotationView.annotation = annotation;
    
    return annotationView;
}
- (void)addPinToMapAtLocation:(CLLocation *)location
{
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    MKCoordinateSpan span = {0.00, 0.00};
    MKCoordinateRegion region = {location.coordinate, span};
    pin.coordinate = location.coordinate;
    pin.title = @"Tu ubicación";
    [self.mapView addAnnotation:pin];
    [self.mapView setRegion:region animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"CHUCHA LA HUEA CONCHASUMADREEEE...... FUNCIONA AMARICONAO");
}

@end
