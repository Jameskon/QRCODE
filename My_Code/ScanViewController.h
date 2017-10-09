//
//  ScanViewController.h
//  My_Code
//
//  Created by 康凯 on 2017/10/9.
//  Copyright © 2017年 k.k. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScanDelegate<NSObject>

-(void)license:(NSString *)license;

@end

@interface ScanViewController : UIViewController

@property (nonatomic,weak)id<ScanDelegate>delegate;

@end
