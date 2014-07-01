//
//  TCDrawingWeather.h
//  TangeCameraStudy
//
//  Created by Eri Tange on 2014/06/03.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCWeatherSearchAPIWrapper.h"
#import "TCAddText.h"

@protocol TCDrawingDataFactory;

@interface TCDrawingWeather : NSObject

- (void)drawingWeatherData:(UIImage *)inputImage block:(void (^)(UIImage *image))block;
- (instancetype)initWithApiWpaeerAndAddText:(id<TCWeatherSearchAPIWrapper>)wrapper addText:(id<TCAddText>)addText;

@end
