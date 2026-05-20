//
//  MapViewController.h
//  Exercicio4
//
//  Created by  on 20/05/26.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : UIViewController

@property (strong, nonatomic) MKMapView *mapView;
@property (strong, nonatomic) NSString *cityName;
@property (assign, nonatomic) CLLocationDegrees latitude;
@property (assign, nonatomic) CLLocationDegrees longitude;


@end

NS_ASSUME_NONNULL_END
