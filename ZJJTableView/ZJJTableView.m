//
//  ZJJTableView.m
//  ZJJTableView
//
//  Created by 张建军 on 17/1/13.
//  Copyright © 2017年 张建军. All rights reserved.
//

#import "ZJJTableView.h"
#import "ZJJTableViewCell.h"
#define WIDTH  [[UIScreen mainScreen] bounds].size.width
#define HEIGHT [[UIScreen mainScreen] bounds].size.height

static  NSInteger cellWidth;

@interface ZJJTableView ()<UITableViewDataSource,UITableViewDelegate> {
    
    // 作为幕布
    __weak UIScrollView * _screenScrollView;
    
    // 作为头部
    __weak UITableView  * _topTableView;
    
}

@property(nonatomic,copy)NSString * cellID;

@end

@implementation ZJJTableView

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self creatArray];
        
        [self creatScrollView];
        
    }
    
    return self;
    
}

-(void)creatArray {
    
    
    self.titleArray = @[@{@"date":@"25",@"week":@"今天"},@{@"date":@"26",@"week":@"周六"},@{@"date":@"27",@"week":@"周天"},@{@"date":@"28",@"week":@"周一"},@{@"date":@"29",@"week":@"周二"},@{@"date":@"30",@"week":@"周三"},@{@"date":@"31",@"week":@"周四"},@{@"date":@"01",@"week":@"周五"},@{@"date":@"02",@"week":@"周六"},@{@"date":@"03",@"week":@"周天"},@{@"date":@"04",@"week":@"周一"},@{@"date":@"05",@"week":@"周二"},@{@"date":@"06",@"week":@"周三"},@{@"date":@"07",@"week":@"周四"}];
    
    
    self.dateAray =@[@"5:00",@"5:45",@"6:30",@"7:15",@"08:00",@"08:45",@"09:30",@"10:15",@"11:00",@"11:45",@"12:30",@"13:15",@"14:00",@"14:45",@"15:30",@"16:15",@"17:00",@"17:45",@"18:30",@"19:15",@"20:00",@"20:45",@"21:30",@"22:15",@"23:00"];
    
    
}



-(void)creatScrollView {
    
    
    NSInteger btnWidth  = WIDTH *0.16;
    
    NSInteger btnHeight  = btnWidth *0.5;
    
    NSInteger spaceWidth = (WIDTH -btnWidth *5)/6;
    
    NSInteger spaceHeigh = 15;
    
    
    if ([UIScreen mainScreen].bounds.size.width == 320) {
        
        cellWidth  = 0.9 + btnWidth + spaceWidth;
    }
    else if ([UIScreen mainScreen].bounds.size.width == 375){
        
        cellWidth  =  1 + btnWidth + spaceWidth;
        
    }else  if ([UIScreen mainScreen].bounds.size.width == 414){
        
        cellWidth  =  2.5 + btnWidth + spaceWidth;
    }
    
    
    
    
    
    CGFloat wholeW = 10 + btnWidth *14 + spaceWidth*15 ;
    CGFloat wholeH = 30 + btnHeight*25 + spaceHeigh*26;
    
    
    // 创建总的幕布
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-108)];//2
    scrollView.delegate = self;
    scrollView.bounces = NO;
    scrollView.contentSize = CGSizeMake(wholeW, wholeH);
    
    scrollView.directionalLockEnabled = YES;
    
    scrollView.showsVerticalScrollIndicator = FALSE;
    
    scrollView.showsHorizontalScrollIndicator = FALSE;
    
    [self addSubview:scrollView];//3
    _screenScrollView = scrollView;
    
    
    UIView * contentView = [[UIScrollView alloc]initWithFrame:(CGRectMake(0, 53, wholeW, wholeH-53))];
    
    
    
    
    for (int i = 0; i < 24; i++)
    {
        for (int j = 0; j < 14; j++)
        {
            
            _btn = [UIButton buttonWithType:UIButtonTypeCustom];
            if ([UIScreen mainScreen].bounds.size.width == 320) {
                
                _btn.frame = CGRectMake(10+j*(btnWidth + spaceWidth), 15+ i*(btnHeight+ spaceHeigh), btnWidth, btnHeight);
            }
            else{
                _btn.frame = CGRectMake(10+j*(btnWidth+ + spaceWidth) + j, 15 +i*(btnHeight+ spaceHeigh) + i, btnWidth, btnHeight);
            }
            
            [_btn addTarget:self action:@selector(clickTeacherScheduleBtn:) forControlEvents:UIControlEventTouchUpInside];
            _btn.titleLabel.font = [UIFont systemFontOfSize:11];
            //            [btn setTitle:@"√" forState:UIControlStateSelected];
            //            [_btn setImage:[UIImage imageNamed:@"class.png"] forState:UIControlStateSelected];
            //            _btn.backgroundColor =  [UIColor whiteColor];
            
            
            [_btn setTitle:[NSString stringWithFormat:@"%@",self.dateAray[i]] forState:(UIControlStateNormal)];
            
            //            [_btn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
            
            [_btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
            _btn.titleLabel.numberOfLines = 0;
            _btn.userInteractionEnabled = NO;
            _btn.titleLabel.adjustsFontSizeToFitWidth = YES;
            _btn.tag = (14 * i) + j + 1000;
            
            _btn.layer.cornerRadius = 4;
            
            _btn.layer.masksToBounds = YES;
            
            if (_btn.tag%8 == 0 || _btn.tag %3 == 0) {
                
                _btn.layer.borderColor = [UIColor blueColor].CGColor;
                _btn.layer.borderWidth = 0.5;
                _btn.userInteractionEnabled = YES;
                
            }else {
                
                _btn.layer.borderColor = [UIColor clearColor].CGColor;
                _btn.layer.borderWidth = 0;
                
                [_btn setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
                
                
            }
            
            
            
            [contentView addSubview:_btn];
            _btn.selected = NO;
        }
    }
    
    contentView.backgroundColor = [UIColor whiteColor];
    
    [_screenScrollView addSubview:contentView];
    
    CGRect topFrame = CGRectMake(0, 0, 53, wholeW);
    UITableView *topView = [[UITableView alloc]initWithFrame:topFrame style:UITableViewStylePlain];
    topView.backgroundColor = [UIColor redColor];
    topView.delegate = self;
    topView.dataSource = self;
    topView.scrollEnabled = NO;
    //tableview逆时针旋转90度。
    topView.transform = CGAffineTransformMakeRotation(-M_PI / 2);
    [_screenScrollView addSubview:topView];
    //旋转后重置位置
    topView.frame = CGRectMake(0, 0, wholeW, 53);
    
    _topTableView = topView;
    
    _cellID = @"SelectCell";
    
    [_topTableView registerClass:[ZJJTableViewCell class] forCellReuseIdentifier:_cellID];
    
    
    
}






#pragma mark - private
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 14;
}

//分区

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//
//{
//
//    // Return the number of sections.
//
//    return 14;
//
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _topTableView) {
        
        return cellWidth;
    }
    return 44;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZJJTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:_cellID forIndexPath:indexPath];
    
    if (cell == nil) {
        
        cell = [[ZJJTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:_cellID];
        
    }
    if (tableView == _topTableView) {
        
        cell.contentView.backgroundColor = [UIColor whiteColor];
        // cell顺时针旋转90度
        cell.contentView.transform = CGAffineTransformMakeRotation(M_PI / 2);
    }
    
    
    cell.dateLabel.text = [_titleArray[indexPath.row] objectForKey:@"date"];
    
    cell.weekLabel.text = [_titleArray[indexPath.row] objectForKey:@"week"];
    
    cell.layer.shouldRasterize = true;
    
    cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
    // 设置选中的颜色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // 隐藏滚动条
    _topTableView.showsVerticalScrollIndicator =
    NO;
    // 设置分割线的颜色
    [_topTableView  setSeparatorColor:[UIColor whiteColor]];
    
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _screenScrollView) {
        
        CGPoint contentOffset = scrollView.contentOffset;
        
        CGRect topFrame = _topTableView.frame;
        topFrame.origin.y = contentOffset.y;
        _topTableView.frame = topFrame;
        
        
    }
    
}

// 选择课表内容
- (void)clickTeacherScheduleBtn:(UIButton *)btn
{
    
    
    if ([_delegate respondsToSelector:@selector(clickTeacherScheduleBtn:)]) {
        [_delegate scheduleBtn:btn];
    }
    
}





@end
