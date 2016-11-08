//
//  NSDictionary+valueConvert.m
//  DongYuan
//
//  Created by iXcoder on 15/6/4.
//  Copyright (c) 2015年 iXcoder. All rights reserved.
//

#import "NSDictionary+valueConvert.h"

@implementation NSDictionary (valueConvert)

- (id)objectForKey:(id)aKey dftValue:(id)dftValue
{
    id obj = dftValue;
    if ([self.allKeys containsObject:aKey]) {
        obj = [self objectForKey:aKey];
    }
    if (!obj || [obj isKindOfClass:[NSNull class]]) {
        obj = dftValue;
    }
    return obj;
}

@end
