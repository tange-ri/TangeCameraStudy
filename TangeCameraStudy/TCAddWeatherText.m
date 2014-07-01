//
//  TCAddWeatherText.m
//  TangeCameraStudy
//
//  Created by Eri Tange on 2014/06/09.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import "TCAddWeatherText.h"
#import "TCImage.h"

@implementation TCAddWeatherText


-(UIImage *)drawingText:(TCImage *)image{
    
    int w = image.image.size.width;
    
    UIImage *dateImage = [self addText:image.weather.date withFontName:@"KFhimajiFACE" fontSize:w/10 forImage:image.image locetionIndex:0];
    
    UIImage *weatherImage = [self addText:image.weather.weather withFontName:@"KFhimajiFACE" fontSize:w/10 forImage:dateImage locetionIndex:1];
    
    UIImage *temperatureImage = [self addText:image.weather.temperature withFontName:@"KFhimajiFACE" fontSize:w/10
                                     forImage:weatherImage locetionIndex:2];
    
    return temperatureImage;
    
}


- (UIImage *)addText:(NSString *)text withFontName:(NSString *)fontName fontSize:(NSUInteger)fontSize forImage:(UIImage *)image locetionIndex:(int)locationIndex {
    
    int w = image.size.width;
    int h = image.size.height;
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    
    CGPoint pt;
    
    if (w>h) {
        
        if (locationIndex == 0) {
            pt = CGPointMake(20, h - h/2);
        }else if(locationIndex == 1){
            pt = CGPointMake(30, h - h/6);
        }else{
            pt = CGPointMake(30, h - h/3);
        }
        
    }else{
        
        if (locationIndex == 0) {
            pt = CGPointMake(20, h - h/3);
        }else if(locationIndex == 1){
            pt = CGPointMake(30, h - h*2/9);
        }else{
            pt = CGPointMake(30, h - h/9);
        }
        
    }
    
    [image drawAtPoint:CGPointMake(0.0, 0.0)];
    [text drawAtPoint:pt
       withAttributes:@{NSFontAttributeName:[UIFont fontWithName:fontName
                                                            size:fontSize],
                        NSForegroundColorAttributeName: [UIColor orangeColor]}];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


@end
