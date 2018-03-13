//
//  NewLineButtonView.h
//  MeiRongBuyer
//
//  Created by ihaoyisheng on 16/2/11.
//  Copyright © 2016年 zdq. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NewLinedelegate <NSObject>

- (void)ButtonClick:(UIButton *)sender;

@end

@interface NewLineButtonView : UIView

@property (strong,nonatomic) id<NewLinedelegate>delegate;

+ (NewLineButtonView *)GetView:(NSArray *)arry width:(float)MaxW;


+(NewLineButtonView *)GetView:(NSArray *)arry frame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)textColor cornerRadius:(float) radius;

- (void)initWithArry:(NSArray *)arry width:(float)MaxW;

@end
