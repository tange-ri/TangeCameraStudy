//
//  TCOpenWeatherMapAPIWrapper.m
//  TangeCameraStudy
//
//  Created by Eri Tange on 2014/06/03.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import "TCOpenWeatherMapAPIWrapper.h"
#import "TCWeather.h"
#import "JFWeatherData.h"
#import "JFWeatherManager.h"

#define API_KEY @"025ede102232126ca5139975832cae92"

@interface TCOpenWeatherMapAPIWrapper ()
@property (nonatomic, retain)  CLLocationManager *locationManager;

@end

@implementation TCOpenWeatherMapAPIWrapper

-(instancetype)init{
    
    if (self = [super init]) {
        
        _locationManager = [[CLLocationManager alloc] init];
        
        if ([CLLocationManager locationServicesEnabled]) {
            
            //delegate self??
            _locationManager.delegate = self;
            [_locationManager startUpdatingLocation];
            
            NSLog(@"OK");
            
        } else {
            NSLog(@"Location services not available.");
        }
    }
    
    return self;
}

//非同期化する＞ブロックを受け取る
//処理が終わってからしてほしい処理を受け取る
//↑の引数を()に

- (void)searchWeather:(void (^)(TCWeather *weather))block{
    

    JFWeatherManager *weatherManager = [[JFWeatherManager alloc]init];
    
    float latitude = _locationManager.location.coordinate.latitude;
    float longitude = _locationManager.location.coordinate.longitude;
    NSLog(@"あああ%f",latitude);
    
    [weatherManager fetchWeatherDataForLatitude:latitude andLongitude:longitude withAPIKeyOrNil:API_KEY :^(JFWeatherData *returnedWeatherData){
        
        NSLog(@"Latitude %.3f",[returnedWeatherData latitudeCoordinateOfRequest]);
        NSLog(@"Longitude %.3f",[returnedWeatherData longitudeCoordinateOfRequest]);
        NSLog(@"Conditions are %@",[returnedWeatherData currentConditionsTextualDescription]);
        NSLog(@"Temperature is %f",[returnedWeatherData temperatureInUnitFormat:kTemperatureCelcius]);
        NSLog(@"Sunrise is %@",[returnedWeatherData sunriseTime]);
        NSLog(@"Sunset is %@",[returnedWeatherData sunsetTime]);
        NSLog(@"Hours of Day Light are %@",[returnedWeatherData dayLightHours]);
        NSLog(@"Humidity is %@",[returnedWeatherData humidityPercentage]);
        NSLog(@"Pressure is %0.1f",[returnedWeatherData pressureInUnitFormat:kPressureHectopascal]);
        NSLog(@"Wind Speed is %0.1f",[returnedWeatherData windSpeedInUnitFormat:kWindSpeedMPH]);
        NSLog(@"Wind Direction is %@",[returnedWeatherData windDirectionInGeographicalDirection]);
        NSLog(@"Cloud Coverage %@",[returnedWeatherData cloudCovergePercentage]);
        NSLog(@"Rainfall Over Next 3h is %0.1fmm",[returnedWeatherData rainFallVolumeOver3HoursInMillimeters]);
        NSLog(@"SnowFall Over Next 3h is %0.1fmm",[returnedWeatherData snowFallVolumeOver3HoursInMillimeters]);
        
        TCWeather *result = [TCWeather new];
        
        NSDate *date = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy/MM/dd"];
        NSString *dateString = [formatter stringFromDate:date];
        result.date = dateString;
        
        result.temperature = [NSString stringWithFormat:@"%.1f",[returnedWeatherData temperatureInUnitFormat:kTemperatureCelcius]];
        result.weather = [returnedWeatherData currentConditionsTextualDescription];
        
        //blockを呼び出す
        block(result);
        
    }];

}


- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
    NSLog(@"didFailWithError");
}



@end
