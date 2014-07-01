//
//  TCTestApiWrapper.h
//  TangeCameraStudy
//
//  Created by Eri Tange on 2014/06/10.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCWeather.h"

@interface TCTestApiWrapper : NSObject
- (void)searchWeather:(void (^)(TCWeather *weather))block;
@end
