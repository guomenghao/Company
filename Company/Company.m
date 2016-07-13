//
//  Company.m
//  newlty
//
//  Created by 郭梦浩 on 16/7/1.
//  Copyright © 2016年 郭梦浩. All rights reserved.
//

#import "Company.h"
#import "NSString+APTextFrame.h"
#import "UIView+Frame.h"
#define COLOR(r,g,b,al) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0                                                                                                             alpha:al]
#define MAXSIZE CGSizeMake(MAXFLOAT, MAXFLOAT)
#define FONTCOLOR [UIColor colorWithRed:9/255.0 green:9/255.0 blue:9/255.0                                                                                                             alpha:1]
#define ScreenWidth [UIScreen  mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface Company()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic,strong)NSMutableArray *tempPickerArray;
@property (nonatomic,assign)NSInteger selectIndex;
@property (nonatomic,strong)UIPickerView *typePickerview;
@end

@implementation Company

- (instancetype)initWithFrame:(CGRect)frame andList:(NSMutableArray *)list{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.tempPickerArray = list;
        if (!self.tempPickerArray) {
            self.tempPickerArray = [NSMutableArray arrayWithCapacity:0];
        }
        
        [self LayoutSubviews];
        
    }
    return self;

}

- (void)LayoutSubviews {
    
    //设置工具条
    UIView *barView = [[UIView alloc] init];
    barView.backgroundColor = COLOR(215, 216, 222,1);
    barView.x = 0;
    barView.y = 0;
    barView.width = self.width;
    barView.height = 35 ;
    [self addSubview:barView];
    
    UIButton *cancelbutton = [[UIButton alloc] init];
    cancelbutton.x = 11;
    [cancelbutton setTitle:@"取消" forState:UIControlStateNormal];
    cancelbutton.titleLabel.font = [UIFont systemFontOfSize:14];
    cancelbutton.size = [cancelbutton.titleLabel.text apsizeWithFont:[UIFont systemFontOfSize:14] maxSize:MAXSIZE];
    cancelbutton.center = CGPointMake(cancelbutton.x + cancelbutton.width * 0.5, barView.height * 0.5);
    [cancelbutton setTitleColor:FONTCOLOR forState:UIControlStateNormal];
    [cancelbutton addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [barView addSubview:cancelbutton];
    
    UIButton *surebutton = [[UIButton alloc] init];
    
    [surebutton setTitle:@"确定" forState:UIControlStateNormal];
    surebutton.titleLabel.font = [UIFont systemFontOfSize:14];
    surebutton.size = [surebutton.titleLabel.text  apsizeWithFont:[UIFont systemFontOfSize:14] maxSize:MAXSIZE];
    surebutton.x = self.width - 8 - surebutton.width;
    surebutton.center = CGPointMake(surebutton.x + surebutton.width * 0.5, barView.height * 0.5);
    [surebutton setTitleColor:FONTCOLOR forState:UIControlStateNormal];
    [surebutton addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [barView addSubview:surebutton];
    //设置pickerView
    self.typePickerview = [[UIPickerView alloc] init];
    self.typePickerview.frame = CGRectMake(0, barView.height, self.width, self.height - 35);
    self.typePickerview.backgroundColor = COLOR(226, 226, 226,1);
    [self addSubview:self.typePickerview];
    [UIView animateWithDuration:0.50 animations:^{
        
        self.y = ScreenHeight - self.height;
        
    } completion:^(BOOL finished) {
        
        self.typePickerview.dataSource = self;
        self.typePickerview.delegate = self;
    }];
    

}

- (void)selectRow:(NSInteger)row {
    
    [self.typePickerview selectRow:row inComponent:0 animated:YES];
}


# pragma mark - 点击取消按钮
- (void)cancelBtnClick{
    
    [UIView animateWithDuration:0.50 animations:^{
        
        self.y = ScreenHeight;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
    
    
}
# pragma mark - 点击确定按钮
- (void)sureBtnClick{
    
    
    
    [UIView animateWithDuration:0.2 animations:^{
        
        self.y = ScreenHeight;
        
        
        
    } completion:^(BOOL finished) {
        
        self.didSureAction(self.selectIndex);
        
        [self removeFromSuperview];
        
    }];
    
    
    
}

#pragma mark- uipickViewDelegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.tempPickerArray.count;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return ScreenWidth;
}
//设置组件中每行的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 20;
}
//设置组件中每行的标题row:行
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.tempPickerArray[row];
}
//选中行的事件处理
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"%@",self.tempPickerArray[row]);
    self.selectIndex = row;
}
@end
