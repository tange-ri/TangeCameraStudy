//
//  TCOpenWeatherMapAPIWrapper.h
//  TangeCameraStudy
//
//  Created by Eri Tange on 2014/06/03.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "TCWeatherSearchAPIWrapper.h"

@interface TCOpenWeatherMapAPIWrapper : NSObject <TCWeatherSearchAPIWrapper, UINavigationControllerDelegate, UIImagePickerControllerDelegate,CLLocationManagerDelegate>
@end
