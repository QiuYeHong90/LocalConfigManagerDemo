//
//  LocalConfigManager.m
//  DongYuan
//
//  Created by iXcoder on 15/9/10.
//  Copyright (c) 2015年 iXcoder. All rights reserved.
//

#import "NSDictionary+valueConvert.h"
#import "LocalConfigManager.h"


static NSMutableDictionary* localConfigDictionary;

@interface LocalConfigManager()
@property(nonatomic,copy) NSString* file;
@property(nonatomic,copy) NSString* fullpath;
@end


@implementation LocalConfigManager

+(instancetype) localConfig:(NSString *)file {
    if(localConfigDictionary==nil) {
        localConfigDictionary = [NSMutableDictionary dictionary];
    }
    LocalConfigManager* m = [localConfigDictionary objectForKey:file dftValue:nil];
    if(m == nil) {
        m = [[LocalConfigManager alloc] initWithFile:file];
        [localConfigDictionary setObject:m forKey:file];
    }
    return m;
}
-(void) initSelf
{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    //获取文件的完整路径
     self.fullpath = [path stringByAppendingPathComponent:_file];

    
    NSData* datas = [NSData dataWithContentsOfFile:_fullpath];
    if(datas ) {
        NSError* error;
        self.jsonConfig = [NSJSONSerialization JSONObjectWithData:datas options:NSJSONReadingAllowFragments|NSJSONReadingMutableContainers error:&error];
    }
    else {
        self.jsonConfig = [NSMutableDictionary dictionary];
    }

}
-(id) initWithFile:(NSString *)file {
    self = [super init];
    if(self) {
    self.file = file;
        [self initSelf];
    }
    return self;
}
-(void)updateConfig {
    NSError* error;
    NSData* data = [NSJSONSerialization dataWithJSONObject:self.jsonConfig options:NSJSONWritingPrettyPrinted error:&error];
    [data writeToFile:self.fullpath atomically:YES];
}

- (void)deleteConfig
{
   // NSLog(@"==================%@",self.fullpath);
    NSError* error;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:self.fullpath error:&error];
    
}
@end
