//
//  ViewController.m
//  3DTouchDemo
//
//  Created by shenyanlong on 2018/4/11.
//  Copyright © 2018年 shenyanlong. All rights reserved.
//

#import "ViewController.h"
#import "PeekViewController.h"
NSString *const SYLStringConstant = @"VALUE";
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *testLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 300) style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    self.testLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 450, 100, 50)];
    self.testLabel.backgroundColor = [UIColor blueColor];
    self.testLabel.font = [UIFont systemFontOfSize:15];
    self.testLabel.textAlignment = NSTextAlignmentCenter;
    self.testLabel.userInteractionEnabled = YES;
    [self.view addSubview:self.testLabel];
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        NSLog(@"支持3DTouch");
        [self registerForPreviewingWithDelegate:self sourceView:self.testLabel];
    }
    else
    {
        NSLog(@"不支持");
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"测试一下";
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        NSLog(@"支持3DTouch");
        //给cell注册peek(预览)功能和pop功能
        [self registerForPreviewingWithDelegate:self sourceView:cell];
    }
    else
    {
        NSLog(@"不支持");
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

#pragma mark -- peek预览
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    //弹出视图的初始位置,sourceRect是peek触发时的高亮区域,这个区域的视图会被模糊
    previewingContext.sourceRect = CGRectMake(0, 0, 40, 44);
    PeekViewController *peekVC = [[PeekViewController alloc] init];
    return peekVC;
}

#pragma mark -- pop方法
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    NSLog(@"pop方法");
    [self showDetailViewController:viewControllerToCommit sender:self];
}

#pragma mark -- 移动压力改变的回调
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSArray *array = [touches allObjects];
    UITouch *touch = (UITouch *)[array lastObject];
    //输出压力值
    NSLog(@"%.2f", touch.force);
    self.testLabel.text = [NSString stringWithFormat:@"%.2f", touch.force];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
