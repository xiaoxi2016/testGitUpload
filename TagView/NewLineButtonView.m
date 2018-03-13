//
//  NewLineButtonView.m
//  MeiRongBuyer
//
//  Created by ihaoyisheng on 16/2/11.
//  Copyright © 2016年 zdq. All rights reserved.
//

#import "NewLineButtonView.h"


@interface NewLineButtonView ()
@property (nonatomic,strong) NSMutableArray *tagBtnArray;
@property (nonatomic,strong) UIButton *selectBtn;
@end
@implementation NewLineButtonView{

    NSArray *_btnarry;
    float  _width;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
}





+(NewLineButtonView *)GetView:(NSArray *)arry width:(float)MaxW{

    NewLineButtonView* tagview = [[NewLineButtonView alloc]initWithFrame:CGRectMake(0, 0, MaxW, 35)];
    [tagview initWithArry:arry width:MaxW];
    tagview.backgroundColor = [UIColor clearColor];
    
    return tagview;
    
}
- (void)initWithArry:(NSArray *)array width :(float)MaxW{

    if( array == nil ) return;
    
    CGSize textsize1 =  [array[array.count - 1] sizeWithAttributes:@{  NSFontAttributeName: [UIFont systemFontOfSize:15]}];
    

    CGFloat maxXW = MaxW ;
    CGFloat offsetX = [UIScreen mainScreen].bounds.size.width - 25 ;
    CGFloat offsetY = 80;
    
    for (unsigned long i = array.count;i > 0;i--) {

       int  j = 1;
//        NSString *one = array[i];
        
       CGSize textsize =  [array[i-1] sizeWithAttributes:@{  NSFontAttributeName: [UIFont systemFontOfSize:15]}];
        offsetX  = offsetX - (textsize.width + 10 + 10 ) *j;
        
        UIButton* onebt = [[UIButton alloc]initWithFrame:CGRectMake(offsetX, offsetY, textsize.width + 10, 35)];
        [onebt setTitle:array[i-1] forState:UIControlStateNormal];
        onebt.backgroundColor = [UIColor whiteColor];
        onebt.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [onebt setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
        
        [self addSubview:onebt];
        
        
        j++;
        
        onebt.tag = i;
        [onebt addTarget:self action:@selector(btclick:) forControlEvents:UIControlEventTouchUpInside];
        
        onebt.layer.cornerRadius = 2;
        onebt.layer.borderColor =  [UIColor blueColor].CGColor;
        onebt.layer.borderWidth = 1;
        [self.tagBtnArray addObject:onebt];
    }
    
    CGRect f = self.frame;
    f.size.height = offsetY + 35+5;
    self.frame = f;

}

-(void)btclick:(UIButton *)sender{
    
//    for (UIButton *btn in self.tagBtnArray) {
//        btn.backgroundColor = [UIColor  whiteColor];
//        [btn setTitleColor:kColor(48,179,240) forState:UIControlStateNormal];
//
//    }
//    sender.backgroundColor = kColor(48,179,240);
//    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.delegate ButtonClick:sender];
}

- (NSMutableArray *) tagBtnArray {
    if (_tagBtnArray==nil) {
        _tagBtnArray = [NSMutableArray array];
    }
    return _tagBtnArray;
}
//又添加的

//width  :tagView 最大宽度

- (void)initWithArray:(NSArray *)array btnHeight:(float)height  textColor:(UIColor *)textColor font:(UIFont *)font cornerRadius:(float)radius{
    if( array == nil ) return;
    
    CGSize textsize =  [array[array.count - 1] sizeWithAttributes:@{  NSFontAttributeName: font}];
    
   
    CGFloat offsetX = [UIScreen mainScreen].bounds.size.width - 25 - textsize.width - 10;
    CGFloat offsetY = 5;
    
    for (NSUInteger i =0 ;i <array.count  ;i++) {
        
        //        YDHLDiseaseModel *disease = array[i];
        NSString *one = array[i];
        
        CGSize textsize =  [one sizeWithAttributes:@{  NSFontAttributeName: font}];
        UIButton* onebt = [[UIButton alloc]initWithFrame:CGRectMake(offsetX, offsetY, textsize.width + 20, height)];
        [onebt setTitle:one forState:UIControlStateNormal];
        onebt.backgroundColor = [UIColor whiteColor];
        onebt.titleLabel.font = font;
        [onebt setTitleColor:textColor   forState:UIControlStateNormal];
       
        
        [self addSubview:onebt];
        offsetX  = offsetX - (textsize.width + 10) -(i+1)*10;
        onebt.tag = i;
        
        
        onebt.layer.cornerRadius =radius;
        onebt.layer.borderColor =  [UIColor blueColor].CGColor;
        onebt.layer.borderWidth = 1;
        [self.tagBtnArray addObject:onebt];
    }
    
    CGRect f = self.frame;
    f.size.height = offsetY + height+5;
    self.frame = f;

}

@end
