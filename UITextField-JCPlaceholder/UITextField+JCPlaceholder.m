//
//  UITextField+JCPlaceholder.m
//  iSmartLBS
//
//  Created by 嘘。 on 2019/6/26.
//  Copyright © 2019 SmartLBS. All rights reserved.
//

#import "UITextField+JCPlaceholder.h"
#import <objc/runtime.h>
@implementation UITextField (JCPlaceholder)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class selfClass = [self class];
        Method systemMethod = class_getInstanceMethod(selfClass, @selector(setPlaceholder:));
        Method customizeMethod = class_getInstanceMethod(selfClass, @selector(jc_setPlaceholder:));
        
        BOOL didAddMethod =
            class_addMethod(class,
                originalSelector,
                method_getImplementation(customizeMethod),
                method_getTypeEncoding(customizeMethod));
        if (didAddMethod) {
            class_replaceMethod(class,
                swizzledSelector,
                method_getImplementation(systemMethod),
                method_getTypeEncoding(systemMethod));
        } else {
            method_exchangeImplementations(systemMethod, customizeMethod);
        }
    });
}

-(void)jc_setPlaceholder:(NSString *)placeholder{
    NSMutableAttributedString *placeholderAtbString = [[NSMutableAttributedString alloc] initWithString:placeholder];
    [placeholderAtbString addAttribute:NSForegroundColorAttributeName
                                 value:VALUECORLOR
                                 range:NSMakeRange(0, placeholder.length)];
    self.attributedPlaceholder = placeholderAtbString;
    [self jc_setPlaceholder:placeholder];
}

-(NSMutableAttributedString *)jcSetPlaceholderWithText:(NSString *)text
                                             textColor:(UIColor *)textColor
                                              textFont:(NSInteger)textFont{
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:text];
    [placeholder addAttribute:NSForegroundColorAttributeName
                  value:textColor
                  range:NSMakeRange(0, text.length)];
    [placeholder addAttribute:NSFontAttributeName
                  value:[UIFont boldSystemFontOfSize:textFont]
                  range:NSMakeRange(0, text.length)];
    return placeholder;
}
@end
