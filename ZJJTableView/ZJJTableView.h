//
//  ZJJTableView.h
//  ZJJTableView
//
//  Created by 张建军 on 17/1/13.
//  Copyright © 2017年 张建军. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  ZJJTableViewDelegate <NSObject>

- (void)selectScheduleViewIndex:(NSInteger)index;

- (void)scheduleBtn:(UIButton *)btn;

@end

@interface ZJJTableView : UIView

// 存储星期的数组
@property (nonatomic,strong) NSArray * titleArray;
// 存储日期的数组
@property (nonatomic,strong) NSArray * dateAray;

// 展示的button
@property (nonatomic,strong) UIButton *btn;
// 定义代理
@property (nonatomic,strong)id<ZJJTableViewDelegate>delegate;


@end
