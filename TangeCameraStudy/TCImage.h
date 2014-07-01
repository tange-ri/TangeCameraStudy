//
//  TCImage.h
//  TangeCameraStudy
//
//  Created by Eri Tange on 2014/06/09.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCWeather.h"

@interface TCImage : NSObject
@property (nonatomic) UIImage *image;
@property (nonatomic) TCWeather *weather;
@end
