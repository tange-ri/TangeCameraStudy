//
//  TCViewController.h
//  TangeCameraStudy
//
//  Created by Eri Tange on 2014/06/03.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic) IBOutlet UIImageView *imageView;
@end
