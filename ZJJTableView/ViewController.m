//
//  ViewController.m
//  ZJJTableView
//
//  Created by 张建军 on 17/1/13.
//  Copyright © 2017年 张建军. All rights reserved.
//

#import "ZJJTableView.h"
#import "ViewController.h"

@interface ViewController ()<ZJJTableViewDelegate>

@end

@implementation ViewController

-(void)loadView {
    
    [super loadView];
    
   ZJJTableView * zjjView= [[ZJJTableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = zjjView;
    zjjView.delegate = self;
    
}

#pragma mark - 课程按钮点击事件的代理
- (void)scheduleBtn:(UIButton *)btn{
    
    btn.selected = !btn.selected;
    if (btn.selected == YES) {
        //        btn.backgroundColor = Green;
        btn.backgroundColor = [UIColor blueColor];
        NSString *str = [NSString stringWithFormat:@"%ld",(long)btn.tag];
       
        NSLog(@"%@",str);
        
    }
    else if (btn.selected == NO)
    {
        btn.backgroundColor = [UIColor whiteColor];
        NSString *str = [NSString stringWithFormat:@"%ld",(long)btn.tag];
        NSLog(@"%@",str);
        
        
    }
    
       
    
}
- (void)clickTeacherScheduleBtn:(UIButton *)bt{}
- (void)selectScheduleViewIndex:(NSInteger)index{}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
