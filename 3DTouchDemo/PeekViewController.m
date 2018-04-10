//
//  PeekViewController.m
//  3DTouchDemo
//
//  Created by shenyanlong on 2018/4/11.
//  Copyright © 2018年 shenyanlong. All rights reserved.
//

#import "PeekViewController.h"

@interface PeekViewController ()

@end

@implementation PeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(back)];
}

- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -- 底部预览界面选项
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    UIPreviewAction *item1 = [UIPreviewAction actionWithTitle:@"关注我" style:(UIPreviewActionStyleDefault) handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"关注我");
    }];
    UIPreviewAction *item2 = [UIPreviewAction actionWithTitle:@"拉黑我" style:(UIPreviewActionStyleDefault) handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"拉黑我");
    }];
    return @[item1, item2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
