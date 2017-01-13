//
//  ZJJTableViewCell.m
//  ZJJTableView
//
//  Created by 张建军 on 17/1/13.
//  Copyright © 2017年 张建军. All rights reserved.
//
#import "Masonry.h"
#import "ZJJTableViewCell.h"

@implementation ZJJTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self ==[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self p_creatCellView];
    }
    
    return self;
}

-(void)p_creatCellView {
    // 日期
    self.dateLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.dateLabel];
    self.dateLabel.font = [UIFont systemFontOfSize:15];
    self.dateLabel.adjustsFontSizeToFitWidth = YES;
    self.dateLabel.textColor = [UIColor blackColor];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).offset(25);
        make.top.equalTo(self.mas_top).offset(10);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(22);
    }];
    
    // 星期
    self.weekLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.weekLabel];
    self.weekLabel.font = [UIFont systemFontOfSize:15];
    self.weekLabel.adjustsFontSizeToFitWidth = YES;
    self.weekLabel.textColor = [UIColor blackColor];
    [self.weekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.dateLabel.mas_centerX);
        make.top.equalTo(self.dateLabel.mas_bottom).offset(2);
        make.width.mas_equalTo(27);
        make.height.mas_equalTo(18);
        
    }];
      
}



@end
