//
//  ViewController.m
//  tableView
//
//  Created by SJ on 16/6/8.
//  Copyright © 2016年 SJ. All rights reserved.
//

#import "ViewController.h"
#import "tableCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *tableArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createTableView];
    [self initData];
}

-(void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 5, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate =self;
    
    //注册
    [_tableView registerClass:[tableCell class] forCellReuseIdentifier:@"tableCell"];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, 100)];
    lable.text = @"tableView的头视图";
    lable.backgroundColor = [UIColor redColor];
    [lable setTextAlignment:NSTextAlignmentCenter];
    _tableView.tableHeaderView = lable;
    
    
    //footview
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    footView.backgroundColor = [UIColor redColor];
    _tableView.tableFooterView = footView;
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    
    [self.view addSubview:_tableView];
    
    
}
-(void)initData{
    _tableArray = [NSMutableArray array];
    for(int i = 0 ; i < 10 ; i++){
        [_tableArray addObject:[NSString stringWithFormat:@"table的%d",i]];
        
    }
    [_tableView reloadData];
    
}

#pragma mark 代理方法
//
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _tableArray.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,20)];
    label.backgroundColor = [UIColor blueColor];
    label.text = [NSString stringWithFormat:@"section%ld头视图",section];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}
//最重要的
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    tableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell"];
    cell.text = _tableArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"选择了%@",_tableArray[indexPath.row]);
    
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"取消选择了%@",_tableArray[indexPath.row]);
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [_tableArray removeObjectAtIndex:indexPath.row];
    
    [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"SJJ";
}

#warning 进去编辑状态 移动cell
//方法




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
