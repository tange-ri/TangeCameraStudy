//
//  TCDrawingWeatherFactory.m
//  TangeCameraStudy
//
//  Created by Eri Tange on 2014/06/06.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import "TCDrawingWeatherFactory.h"
#import "TCDrawingWeather.h"
#import "TCOpenWeatherMapAPIWrapper.h"
#import "TCAddWeatherText.h"

@implementation TCDrawingWeatherFactory

- (TCDrawingWeather *)createDrawingWeather{
    
    TCOpenWeatherMapAPIWrapper *wrapper = [TCOpenWeatherMapAPIWrapper new];
    TCAddWeatherText *addText = [TCAddWeatherText new];
    
    TCDrawingWeather *context = [[TCDrawingWeather alloc] initWithApiWpaeerAndAddText:wrapper addText:addText];
    
    return context;
}

@end
