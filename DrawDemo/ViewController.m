//
//  ViewController.m
//  RunTimeDemo
//
//  Created by yanghuan on 2018/10/25.
//  Copyright © 2018 whs. All rights reserved.
//

#import "ViewController.h"
#import "DrawRootViewController.h"
#import "UIViewExt.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)NSArray *dataArrs;
@property(nonatomic, strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dataArrs = @[@"drawRect:方法绘制两条直线",
                  @"简化绘图方式",
                  @"绘制矩形",
                  @"绘制矩形（利用UIKit的封装方法）",
                  @"绘制椭圆",
                  @"绘制弧形",
                  @"绘制贝塞尔曲线",
                  @"绘制文字",
                  @"图像绘制",
                  @"颜色渐变-线性渐变",
                  @"颜色渐变-径向渐变",
                  @"渐变填充",
                  @"叠加模式",
                  @"有颜色填充模式",
                  @"无颜色填充模式",
                  @"上下文变换",
                  @"使用Core Graphics绘制图像01反",
                  @"使用Core Graphics绘制图像02正",
                  @"利用位图上下文添加水印效果",
                  @"绘制到PDF",
                  @"滤镜特效"
                  ];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArrs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _dataArrs[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DrawRootViewController *drawRVC = [[DrawRootViewController alloc]init];
    drawRVC.atIndex = indexPath.row;
    [self.navigationController pushViewController:drawRVC animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


