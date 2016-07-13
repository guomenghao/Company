//
//  DicPickerView.h
//  newlty
//
//  Created by 郭梦浩 on 16/7/1.
//  Copyright © 2016年 郭梦浩. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^DidSureAction)(NSInteger selectIndex);
@interface Company : UIView
@property (nonatomic,copy)DidSureAction didSureAction;
- (instancetype)initWithFrame:(CGRect)frame andList:(NSMutableArray *)list;
- (void)cancelBtnClick;

- (void)selectRow:(NSInteger)row;

@end

