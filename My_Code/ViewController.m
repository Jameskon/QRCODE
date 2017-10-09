//
//  ViewController.m
//  My_Code
//
//  Created by kai on 2017/10/9.
//  Copyright © 2017年 k.k. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()<AVCaptureMetadataOutputObjectsDelegate>

@property (weak, nonatomic) IBOutlet UIButton *formBtn;
@property (weak, nonatomic) IBOutlet UITextField *input_tf;
- (IBAction)chuangeToQcode:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property int shakeTag;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _shakeTag = 0;
    
//    修改_formBtn为圆角
    _formBtn.clipsToBounds = YES;
    _formBtn.layer.cornerRadius = 9;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


//  按键生成二维码展示在image上
- (IBAction)chuangeToQcode:(UIButton *)sender {
    // 1.实例化二维码滤镜
    //    CIFilter *filter = [CIFilter filterWithName:@""];
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // 2.恢复滤镜的默认属性 (因为滤镜有可能保存上一次的属性)
    [filter setDefaults];
    
    // 3.将字符串转换成NSdata
    NSString *urlString = _input_tf.text;
    NSData *data  = [urlString dataUsingEncoding:NSUTF8StringEncoding];
    
    // 4.通过KVO设置滤镜, 传入data, 将来滤镜就知道要通过传入的数据生成二维码
    [filter setValue:data forKey:@"inputMessage"];
    
    // 5.生成二维码
    CIImage *outputImage = filter.outputImage;
    CGFloat scale = CGRectGetWidth(_showImage.bounds) / CGRectGetWidth(outputImage.extent);
    CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale); // scale 为放大倍数
    CIImage *transformImage = [outputImage imageByApplyingTransform:transform];
    
    // 保存
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef imageRef = [context createCGImage:transformImage fromRect:transformImage.extent];
    UIImage *qrCodeImage = [UIImage imageWithCGImage:imageRef];
    
    // 6.设置生成好得二维码到imageView上
    _showImage.image = qrCodeImage;
    
    // 7.设置二维码图片居中
    _showImage.contentMode = UIViewContentModeScaleAspectFit;
    
    // 8.将输入_input_tf置空
    _input_tf.text = NULL;
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
//    if (_shakeTag==0) {
//        _shakeTag = 1;
//    }
//    else{
//        _showImage.image = NULL;
//        _shakeTag = 0;
//    }
    _showImage.image = NULL;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_input_tf resignFirstResponder];
}


@end
