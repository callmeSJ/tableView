//
//  tableCell.m
//  tableView
//
//  Created by SJ on 16/6/9.
//  Copyright © 2016年 SJ. All rights reserved.
//

#import "tableCell.h"
@interface tableCell()
@property(nonatomic,strong)UILabel *lable;
@end

@implementation tableCell

-(void)setText:(NSString *)text{
    
    _text = text;
    
    for(UIView *view in self.contentView.subviews){
        [view removeFromSuperview];
    }
    if(!_lable){
        _lable = [[UILabel alloc]initWithFrame:CGRectMake(18, 20, 100, 20)];
        
    }
    _lable.text = text;
    _lable.textColor = [UIColor blackColor];
    [self.contentView addSubview:_lable];
    
}



@end
