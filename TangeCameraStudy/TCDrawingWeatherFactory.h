//
//  TCDrawingWeatherFactory.h
//  TangeCameraStudy
//
//  Created by Eri Tange on 2014/06/06.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCDrawingWeather.h"

@interface TCDrawingWeatherFactory : NSObject
- (TCDrawingWeather *)createDrawingWeather;
@end
