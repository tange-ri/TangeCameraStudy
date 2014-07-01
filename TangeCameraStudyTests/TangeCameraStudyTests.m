//
//  TangeCameraStudyTests.m
//  TangeCameraStudyTests
//
//  Created by Eri Tange on 2014/06/03.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TCTakingPictures.h"
#import "XCTest+asynk.h"
#import "TCOpenWeatherMapAPIWrapper.h"
#import "JFWeatherManager.h"
#import "TCDrawingWeather.h"
#import "TCTestApiWrapper.h"
#import "TCImage.h"
#import "TCAddWeatherText.h"


@interface TangeCameraStudyTests : XCTestCase

@end

@implementation TangeCameraStudyTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    //XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
    
//    int num = 18 + 1;
//    NSLog(@"%f",num);

}
//
//- (void)testTestExample{
//    
//    XCTAssertTrue([TCTakingPictures isEven:10]);
//    XCTAssertTrue([TCTakingPictures isEven:0]);
//    XCTAssertTrue([TCTakingPictures isEven:9]);
//
//}

- (void)testAsynk{
    
    ASYNC_TEST_START;
    
    [[TCTestApiWrapper new] searchWeather:^(TCWeather *weather) {
        
        UIImage *inputImage = [UIImage imageNamed:@"IMG_0717.JPG"];
        UIImage *raraImage = [UIImage imageNamed:@"IMG_0717.JPG"];
        //imageとweatherを渡してテキストを書き込む
        TCImage *image = [TCImage new];
        image.image = inputImage;
        image.weather = weather;
        
        TCAddWeatherText *addText = [TCAddWeatherText new];
        UIImage *outputImage = [addText drawingText:image];
        //UIImage *correctImage = [UIImage imageNamed:@"IMG_1840.JPG"];
        
        
        
        //データに変換
        NSData *outputImageData = UIImageJPEGRepresentation(outputImage, 0.7);
        NSData *correctImageData = [NSData dataWithContentsOfFile:@"IMG_1840.JPG"];

        // 保存
        NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"output.jpeg"];
        [outputImageData writeToFile: filePath  // (NSString *) ファイルパス
                 atomically: YES];     // (BOOL) 予備ファイルを生成

        
//        CGDataProviderRef   dataProvider;
//        NSData*             correctImageData;
//        dataProvider = CGImageGetDataProvider(correctImage.CGImage);
//        correctImageData = (NSData*)CFBridgingRelease(CGDataProviderCopyData(dataProvider));
//        

        //XCTAssertEqualObjects(outputImage, correctImage);
        
        
        XCTAssertTrue([outputImageData isEqualToData:correctImageData]);
        
        ASYNC_TEST_DONE;

    }];
    
    ASYNC_TEST_END;
}






@end
