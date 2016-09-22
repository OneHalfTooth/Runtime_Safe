//
//  NSDictionary+safe.m
//  CoreDataDemo
//
//  Created by 马少洋 on 16/5/13.
//  Copyright © 2016年 马少洋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation NSDictionary (Safe)

//#ifdef DEBUG
//#else
+(void)load{
    Method originalMethod = class_getClassMethod(self, @selector(dictionaryWithObjects:forKeys:count:));
    Method swizzledMethod = class_getClassMethod(self, @selector(customDictionaryWithObjects:forKeys:count:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}
+ (instancetype)customDictionaryWithObjects:(const id [])objects forKeys:(const id <NSCopying> [])keys count:(NSUInteger)cnt {
    id nObjects[cnt];
    id nKeys[cnt];
    int i=0, j=0;
    for (; i<cnt && j<cnt; i++) {
        if (objects[i] && keys[i]) {
            nObjects[j] = objects[i];
            nKeys[j] = keys[i];
            j++;
        }
    }

    return [self customDictionaryWithObjects:nObjects forKeys:nKeys count:j];
}
//#endif

@end
