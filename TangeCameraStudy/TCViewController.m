//
//  TCViewController.m
//  TangeCameraStudy
//
//  Created by Eri Tange on 2014/06/03.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "TCViewController.h"
#import "TCOpenWeatherMapAPIWrapper.h"
#import "TCDrawingWeather.h"
#import "TCDrawingWeatherFactory.h"
#import "TCSavingPictures.h"

@interface TCViewController ()

@property (nonatomic) TCDrawingWeather *context;
@property (nonatomic) UIImage *inputImage;
@property (nonatomic) UIImage *outputImage;
@property ()UIActivityIndicatorView * aiView;
@end

@implementation TCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.aiView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    

    float w = self.aiView.frame.size.width;
    float h = self.aiView.frame.size.height;
    float x = self.view.frame.size.width/2 - w/2;
    float y = self.view.frame.size.height/2 - h/2;
    self.aiView.frame = CGRectMake(x, y, w, h);
    
    [self.view addSubview:self.aiView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}


- (IBAction)draw:(id)sender{
    
    [self.aiView startAnimating];
    
    TCDrawingWeatherFactory *factory = [TCDrawingWeatherFactory new];
    TCDrawingWeather *context = [factory createDrawingWeather];
    self.context = context;
    
    [context drawingWeatherData:self.inputImage block:^(UIImage *image) {
        
        self.imageView.image = image;
        self.outputImage = image;
            
        [self.aiView stopAnimating];
        
    }];
}

//ここどうやってinfrastructureとかき分けよう？
-(IBAction)takePhoto{

    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        
        picker.sourceType = sourceType;
        
        picker.delegate = self;
        
        [self presentViewController:picker animated:YES completion:nil];
        
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    
    [[picker presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
    self.inputImage = image ;
    self.imageView.image = image;
}

-(IBAction)save{
    
    TCSavingPictures *context = [TCSavingPictures new];
    [context savePicture:self.outputImage block:^(NSError *error) {
        
        //保存失敗時
        if (error) {
            
            //アラートの初期化
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                            message:@"保存できませんでした"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            //アラートを表示
            [alert show];
        }
        
        //保存成功時
        else{
            
            //アラートの初期化
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                            message:@"保存しました"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            //アラートを表示
            [alert show];
            
        }

    }];
}


@end
