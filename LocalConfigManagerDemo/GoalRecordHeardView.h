//
//  GoalRecordHeardView.h
//  FitnessV2
//
//  Created by JJN on 16/9/27.
//  Copyright © 2016年 WangFuchuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoalRecordHeardView : UIView
- (id)initWithFinishSuccessPercent:(NSString *)percent;
@property (strong, nonatomic)  UIView *progressView;
@property (strong, nonatomic)  UILabel *successRate;


///更新成功率
-(void)updateAllSuccessRate:(CGFloat)rate;
@end
