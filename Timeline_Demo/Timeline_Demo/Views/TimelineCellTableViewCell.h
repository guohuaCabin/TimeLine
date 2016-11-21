//
//  TimelineCellTableViewCell.h
//  Timeline_Demo
//
//  Created by TOMO on 16/8/3.
//  Copyright © 2016年 TOMO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimelineCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bubbleImageView;

@property (strong, nonatomic) IBOutlet UIView *topLine;
@property (strong, nonatomic) IBOutlet UIView *buttomLine;
@property (strong, nonatomic) IBOutlet UILabel *lineLabel;

@end
