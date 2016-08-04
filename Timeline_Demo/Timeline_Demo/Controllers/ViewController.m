//
//  ViewController.m
//  Timeline_Demo
//
//  Created by TOMO on 16/8/3.
//  Copyright © 2016年 TOMO. All rights reserved.
//

#import "ViewController.h"
#import "TimelineCellTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)UIView *topLine;
@property(strong,nonatomic)UIView *bottomLine;

@property(assign,nonatomic)CGFloat leadingSpaceOfLines;

@property(strong,nonatomic)NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    [self addTableView];
   // [self addData];
}

- (void)addTableView
{
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    _tableView.separatorColor =[UIColor clearColor];
    [self.view addSubview:self.tableView];
    
    self.topLine = [UIView new];
    self.bottomLine = [UIView new];
    self.bottomLine.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.topLine];
    [self.view addSubview:self.bottomLine];
    
}

- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[@"you know ,this is timeline(时间轴)!",@"灵感来源于：美团的订单详情页面 和 path软件",@"这只是个简单的实现，当然，你可以做的更丰富，左侧加头像或者其他...",@"初衷：工作项目需要，该死的老板一次次的改想法,当然，也要感谢他逼着成长",@"实现：感谢一个叫：Cyandev的作者，他的文章是我实现的源泉",@"我喜欢开源，对于一个正在成长的编程者，它帮助我太多了",@"这个时间轴分享给大家，贡献不论大小，也是一种贡献吧"];
    }
    return _dataArray;
}
- (void)addData
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    TimelineCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[[ NSBundle mainBundle ]loadNibNamed:@"TimelineCellTableViewCell" owner:nil options:nil] firstObject];
    }
    cell.lineLabel.text = _dataArray[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    cell.buttomLine.backgroundColor = indexPath.row == (_dataArray.count-1) ? [UIColor grayColor] : cell.topLine.backgroundColor;
     self.topLine.backgroundColor = cell.topLine.backgroundColor;
   // cell.topLine.backgroundColor = indexPath.row == 0 ? [UIColor clearColor] : self.topLine.backgroundColor;
    
    self.topLine.backgroundColor = cell.topLine.backgroundColor;
     self.leadingSpaceOfLines =  [cell convertPoint:cell.topLine.frame.origin toView:self.view].x;
    
    [self scrollViewDidScroll:tableView];

    return cell;
}
#pragma mark --tableViewDelegate--
//要展开cell视图回调; 行将显示的时候调用，预加载行
//- (void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
//  /**未实现，出现未知问题，如果你能找到解决方法，记得留言告诉我。或者邮件：name_guohua@163.com */
//   /**以下方法已移至 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 方法中实现。*/
//    if (cell) {
//        self.topLine.backgroundColor = _cell.topLine.backgroundColor;
//        NSLog(@"color == %@",self.topLine.backgroundColor);
//        self.leadingSpaceOfLines = 28.f; //[self.timelineCell convertPoint:self.timelineCell.buttomLine.frame.origin toView:self.tableView].x;
//        NSLog(@"xxxxx = %.2f",self.leadingSpaceOfLines);
//   }
//
//    [self scrollViewDidScroll:tableView];
//    
//}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _topLine.frame = CGRectMake(_leadingSpaceOfLines, 0, 3, -scrollView.contentOffset.y);

    CGFloat yOffSet = scrollView.frame.size.height - scrollView.contentSize.height + scrollView.contentOffset.y ;
    _bottomLine.frame = CGRectMake(_leadingSpaceOfLines, self.view.frame.size.height - yOffSet, 3, self.view.frame.size.height);

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
