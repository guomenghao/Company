//
//  NSString+APTextFrame.h
//  APTool
//
//  Created by 安鹏 on 16/3/23.
//  Copyright © 2016年 安鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (APTextFrame)

/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 *
 *  @return 返回字符串所占用的尺寸
 */
- (CGSize)apsizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
@end
