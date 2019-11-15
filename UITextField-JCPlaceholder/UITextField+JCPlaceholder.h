//
//  UITextField+JCPlaceholder.h
//  iSmartLBS
//
//  Created by 嘘。 on 2019/6/26.
//  Copyright © 2019 SmartLBS. All rights reserved.
//

#import <UIKit/UIKit.h>

//NS_ASSUME_NONNULL_BEGIN

@interface UITextField (JCPlaceholder)

/// textfield更改颜色，字体大小
/// @param text 文本
/// @param textColor 颜色
/// @param textFont 字体大小
-(NSMutableAttributedString *)jcSetPlaceholderWithText:(NSString *)text
                                             textColor:(UIColor *)textColor
                                              textFont:(NSInteger)textFont;
@end

//NS_ASSUME_NONNULL_END
