//
//  TimelineCellTableViewCell.m
//  Timeline_Demo
//
//  Created by TOMO on 16/8/3.
//  Copyright © 2016年 TOMO. All rights reserved.
//

#import "TimelineCellTableViewCell.h"
#import "UIColor+Hex.h"
@implementation TimelineCellTableViewCell


- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:YES];
    self.lineLabel.textColor = highlighted ? [UIColor whiteColor] : [UIColor colorWithHexString:@"#3F7813"];
    self.lineLabel.adjustsFontSizeToFitWidth = YES;
    
    //气泡拉伸
    UIImage *image  = [UIImage imageNamed:@"dataAnalyze_ bubble"];
    //     //iOS5之前
    //   // 左端盖宽度
    //    NSInteger leftCapWidth = image.size.width * 0.5f;
    //    NSInteger topCapHeight = image.size.height * 0.8f;
    //    image = [image stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
    //    //iOS5之后
    //     UIEdgeInsets insets = UIEdgeInsetsMake(image.size.height * 0.8f,image.size.width * 0.5f, 40, 40);
    //    image = [image resizableImageWithCapInsets:insets];
    //iOS6之后
    UIEdgeInsets insets = UIEdgeInsetsMake(image.size.height * 0.8f,image.size.width * 0.5f, 60, 60);
    image = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    
    
    self.bubbleImageView.image = image;
    /**
     *  - (UIImage *)stretchableImageWithLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight;
     *
     *  leftCapWidth代表左端盖宽度，topCapHeight代表顶端盖高度。系统会自动计算出右端盖宽度(rightCapWidth)和底端盖高度(bottomCapHeight)
     * 算法如下：
     * width为图片宽度  rightCapWidth = width - leftCapWidth - 1;
     
     * height为图片高度 bottomCapHeight = height - topCapHeight - 1
     *
     *经过计算，你会发现中间的可拉伸区域只有1x1
     *
     * stretchWidth为中间可拉伸区域的宽度
     stretchWidth = width - leftCapWidth - rightCapWidth = 1;
     
     * stretchHeight为中间可拉伸区域的高度
     stretchHeight = height - topCapHeight - bottomCapHeight = 1;
     *
     *因此，使用这个方法只会拉伸图片中间1x1的区域，并不会影响到边缘和角落。
     
     */
    
    /**
     * - (UIImage *)resizableImageWithCapInsets:(UIEdgeInsets)capInsets
     *  这个方法只接收一个UIEdgeInsets类型的参数，可以通过设置UIEdgeInsets的left、right、top、bottom来分别指定左端盖宽度、右端盖宽度、顶端盖高度、底端盖高度
     *
     */
    
    /**
     *  - (UIImage *)resizableImageWithCapInsets:(UIEdgeInsets)capInsets resizingMode:(UIImageResizingMode)resizingMode
     对比iOS5.0中的方法，只多了一个UIImageResizingMode参数，用来指定拉伸的模式：
     UIImageResizingModeStretch：拉伸模式，通过拉伸UIEdgeInsets指定的矩形区域来填充图片
     UIImageResizingModeTile：平铺模式，通过重复显示UIEdgeInsets指定的矩形区域来填充图片
     *
     */

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
