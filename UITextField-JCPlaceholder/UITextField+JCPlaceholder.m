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
//需要统一更改的时候可打开load
//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = [self class];
//        SEL originalSelector = @selector(setPlaceholder:);
//        SEL swizzledSelector = @selector(jc_setPlaceholder:);
//        Method originalMethod = class_getInstanceMethod(class, originalSelector);
//        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
//        BOOL didAddMethod =
//            class_addMethod(class,
//                originalSelector,
//                method_getImplementation(swizzledMethod),
//                method_getTypeEncoding(swizzledMethod));
//        if (didAddMethod) {
//            class_replaceMethod(class,
//                swizzledSelector,
//                method_getImplementation(originalMethod),
//                method_getTypeEncoding(originalMethod));
//        } else {
//            method_exchangeImplementations(originalMethod, swizzledMethod);
//        }
//    });
//}

-(void)jc_setPlaceholder:(NSString *)placeholder{
    NSMutableAttributedString *placeholderAtbString = [[NSMutableAttributedString alloc] initWithString:placeholder];
    [placeholderAtbString addAttribute:NSForegroundColorAttributeName
                                 value:[UIColor blackColor]
                                 range:NSMakeRange(0, placeholder.length)];
    [placeholderAtbString addAttribute:NSFontAttributeName
                                 value:[UIFont systemFontSize]
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
                  value:[UIFont systemFontOfSize:textFont]
                  range:NSMakeRange(0, text.length)];
    return placeholder;
}
@end
