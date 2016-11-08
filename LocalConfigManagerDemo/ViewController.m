//
//  ViewController.m
//  LocalConfigManagerDemo
//
//  Created by JJN on 2016/11/7.
//  Copyright © 2016年 JJN. All rights reserved.
//

#import "ViewController.h"
#import "GoalRecordHeardView.h"

@interface ViewController ()
{
    GoalRecordHeardView * goalView;
}
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    goalView = [[GoalRecordHeardView alloc]init];
    
    
    
    [self.view addSubview: goalView];
    
    
    [goalView updateAllSuccessRate:0.89];
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textField resignFirstResponder];
}

- (IBAction)query:(id)sender {
    
     CGFloat rate = [self.textField.text floatValue];
     [goalView updateAllSuccessRate:rate];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
