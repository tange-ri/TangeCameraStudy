//
//  TCTestApiWrapper.m
//  TangeCameraStudy
//
//  Created by Eri Tange on 2014/06/10.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import "TCTestApiWrapper.h"
#import "TCWeather.h"

@implementation TCTestApiWrapper


- (void)searchWeather:(void (^)(TCWeather *weather))block{
    
        TCWeather *result = [TCWeather new];
    
        NSString *dateString = @"2014/06/11";
        result.date = dateString;
        result.temperature = @"21℃";
        result.weather = @"Light Rain";
        //blockを呼び出す
        block(result);
};


@end
