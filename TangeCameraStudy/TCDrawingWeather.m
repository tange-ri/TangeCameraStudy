//
//  TCDrawingWeather.m
//  TangeCameraStudy
//
//  Created by Eri Tange on 2014/06/03.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import "TCDrawingWeather.h"
#import "TCOpenWeatherMapAPIWrapper.h"
#import "TCWeatherSearchAPIWrapper.h"
#import "TCWeather.h"
#import "TCImage.h"
#import "TCAddText.h"

@interface TCDrawingWeather ()
@property (nonatomic) id<TCWeatherSearchAPIWrapper> apiWrapper;
@property (nonatomic) id<TCAddText> addtext;
@end

@implementation TCDrawingWeather

- (instancetype)initWithApiWpaeerAndAddText:(id<TCWeatherSearchAPIWrapper>)wrapper addText:(id<TCAddText>)addText{
    
    if (self = [super init]) {
        
        self.apiWrapper = wrapper;
        self.addtext = addText;
    }
    
    return self;
}

//UIImageを引数とするブロックを受け取る
- (void)drawingWeatherData:(UIImage *)inputImage block:(void (^)(UIImage *image))block{
     
    [self.apiWrapper searchWeather:^(TCWeather *result){
        
        //imageとweatherを渡してテキストを書き込む
        TCImage *image = [TCImage new];
        image.image = inputImage;
        image.weather = result;
        
        UIImage *outputImage = [self.addtext drawingText:image];
        
        block(outputImage);
        
    }];
}



@end
