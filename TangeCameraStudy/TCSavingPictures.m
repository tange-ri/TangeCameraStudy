//
//  TCSavingPictures.m
//  TangeCameraStudy
//
//  Created by Eri Tange on 2014/06/08.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "TCSavingPictures.h"
@interface TCSavingPictures()
@property (copy,nonatomic) void (^block)(NSError *);
@end

@implementation TCSavingPictures


- (void)savePicture:(UIImage *)image block:(void (^)(NSError *))block{
    

     self.block = block;
    
    UIImageWriteToSavedPhotosAlbum(
                                   image,
                                   self,
                                   @selector(targetImage:didFinishSavingWithError:contentInfo:)
                                   ,NULL);

    
}

-(void)targetImage:(UIImage *)image didFinishSavingWithError:(NSError *)error contentInfo:(void *)content{
    
    self.block(error);
}


@end
