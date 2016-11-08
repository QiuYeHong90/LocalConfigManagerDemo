//
//  LocalConfigManager.h
//  DongYuan
//
//  Created by iXcoder on 15/9/10.
//  Copyright (c) 2015年 iXcoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalConfigManager : NSObject
+ (instancetype) localConfig:(NSString*) file;

- (id)initWithFile:(NSString*) file;
@property(nonatomic,retain) NSMutableDictionary* jsonConfig;

- (void)updateConfig;
- (void)deleteConfig;

@end
