//
//  ShowQRCodeViewController.m
//  My_Code
//
//  Created by 康凯 on 2017/10/9.
//  Copyright © 2017年 k.k. All rights reserved.
//

#import "ShowQRCodeViewController.h"
#import "ScanViewController.h"

@interface ShowQRCodeViewController ()<ScanDelegate>
@property (weak, nonatomic) IBOutlet UITextField *showTheCode;
- (IBAction)scan:(id)sender;

@end

@implementation ShowQRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)scan:(id)sender {
    ScanViewController *scanvc = [[ScanViewController alloc]init];
    scanvc.view.backgroundColor = [UIColor whiteColor];
    scanvc.delegate = self;
    [self.navigationController pushViewController:scanvc animated:YES];
}

-(void)license:(NSString *)license
{
    self.showTheCode.text = license;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_showTheCode resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
