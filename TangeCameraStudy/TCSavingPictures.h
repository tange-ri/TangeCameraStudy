//
//  TCSavingPictures.h
//  TangeCameraStudy
//
//  Created by Eri Tange on 2014/06/08.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCSavingPictures : NSObject
- (void)savePicture:(UIImage *)image block:(void (^)(NSError *))block;
@end
