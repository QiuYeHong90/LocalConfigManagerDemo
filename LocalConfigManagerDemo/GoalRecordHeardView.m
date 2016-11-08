//
//  GoalRecordHeardView.m
//  FitnessV2
//
//  Created by JJN on 16/9/27.
//  Copyright © 2016年 WangFuchuan. All rights reserved.
//

#import "GoalRecordHeardView.h"

@interface GoalRecordHeardView ()
{
    NSLock *theLock ;
}

/** rate */
@property(nonatomic,assign)CGFloat rate;
@property(nonatomic,assign)CGFloat number;
@property (strong, nonatomic)  UIImageView *backImgView;
@property (nonatomic,strong) CAShapeLayer *shapeLayer ;

/**  */
@property(nonatomic,strong) NSTimer * timer ;

@end

@implementation GoalRecordHeardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        self.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds),CGRectGetWidth([UIScreen mainScreen].bounds)*720/750.f);
        _backImgView = [UIImageView new];
        _backImgView.center = self.center;
        _backImgView.bounds = CGRectMake(0, 0, 180, 180);
        _backImgView.image = [UIImage imageNamed:@"GoalRecord_Picture"];
        [self addSubview:_backImgView];
        
        _progressView = [UIView new];
        _progressView.backgroundColor = [UIColor clearColor];
        _progressView.frame = _backImgView.frame;
        [self addSubview:_progressView];
        
        _successRate = [UILabel new];
        _successRate.bounds = CGRectMake(0, 0,50, 50);
        _successRate.center = self.center ;
        _successRate.textAlignment = NSTextAlignmentCenter;
        [self addSubview: _successRate];
        
        [self loadUI];

    }
    return self;
}




-(void)loadUI{

    
}


-(void)updateAllSuccessRate:(CGFloat)rate{
    
     _rate = rate;
    if (rate==0) {
        return;
    }else{
       
        
                   // switch to a background thread and perform your expensive operation
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            // switch to a background thread and perform your expensive operation
            
            
            if (! theLock) {
                theLock= [[NSLock alloc] init];
            }
            [theLock lock];
            _timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(timerClick) userInfo:nil repeats:YES];
            NSRunLoop * loop = [NSRunLoop currentRunLoop];
            [loop run];

            
            

            
        });

        
       

    }
    
    
}

-(void)timerClick{
    
    
    if (_number>= _rate) {
        [_timer invalidate];
        
//        [loop removePort:_timer forMode:NSRunLoopCommonModes];
////        [loop addTimer:_timer forMode:NSRunLoopCommonModes];
         _timer = nil;
        
        _number = 0 ;
         NSRunLoop * loop = [NSRunLoop currentRunLoop];
        CFRunLoopRef cfloop = [loop getCFRunLoop];
        
        CFRunLoopStop(cfloop );
        
        [theLock unlock];
        
        return;
    }
    
   
        
    
   
    dispatch_async(dispatch_get_main_queue(), ^{
        
        // switch back to the main thread to update your UI
        // switch back to the main thread to update your UI
        self.successRate.text = [NSString stringWithFormat:@"%.f",_number*100];
        
        [self quarz:_progressView withPercent:_number];
        _number += 0.001;
    });
    
    
    
    
    
    
    

}


//percent 0 - 1
- (void)quarz:(UIView *)view withPercent:(double)percent {
    
    
    CGFloat w = view.bounds.size.width;
    CGFloat h = view.bounds.size.height;
    
    //第一步，通过UIBezierPath设置圆形的矢量路径
    UIBezierPath *circle =
    [UIBezierPath bezierPathWithArcCenter:CGPointMake(90,87)
                                   radius:180/2.f-5-3
                               startAngle: -M_PI * 1/ 2
                                 endAngle:M_PI*2 * percent -M_PI * 1/ 2
                                clockwise:YES];
    ;
    
    
    [self.shapeLayer removeFromSuperlayer];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];

    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2.f;
    shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    shapeLayer.path = circle.CGPath;
    [view.layer addSublayer:shapeLayer];
    
    self.shapeLayer = shapeLayer;
    
    
    
}

@end
