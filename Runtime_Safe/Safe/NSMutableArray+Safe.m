//
//  NSMutableArray+Tools.m
//  CoreDataDemo
//
//  Created by 马少洋 on 16/5/13.
//  Copyright © 2016年 马少洋. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <objc/runtime.h>


@implementation NSMutableArray (Safe)
//#ifdef DEBUG
//#else

+(void)load{

    Class arrayM = NSClassFromString(@"__NSArrayM");
    Method methodSuper = class_getInstanceMethod(arrayM, NSSelectorFromString(@"addObject:"));
    Method method = class_getInstanceMethod(arrayM, @selector(msyAddObject:));
    method_exchangeImplementations(methodSuper, method);

    Method methodSuperInsert = class_getInstanceMethod(arrayM, @selector(insertObject:atIndex:));
    Method methodInsert = class_getInstanceMethod(arrayM, @selector(msyInsertObject:atIndex:));
    method_exchangeImplementations(methodSuperInsert, methodInsert);

    Method methodSuperSetObj = class_getInstanceMethod(arrayM, @selector(setObject:atIndexedSubscript:));
    Method methodSetObj = class_getInstanceMethod(arrayM, @selector(msySetObject:atIndexedSubscript:));
    method_exchangeImplementations(methodSetObj, methodSuperSetObj);

    Method methodSuperRemove = class_getInstanceMethod(arrayM, @selector(removeObjectAtIndex:));
    Method methodRemove = class_getInstanceMethod(arrayM, @selector(customRemoveObjectAtIndex:));
    method_exchangeImplementations(methodSuperRemove, methodRemove);

    Method methodSuperRemoveObj = class_getInstanceMethod(arrayM, @selector(removeObject:));
    Method methodRemoveObj = class_getInstanceMethod(arrayM, @selector(customRemoveObject:));
    method_exchangeImplementations(methodSuperRemoveObj, methodRemoveObj);
    
    Method objectAtIndex = class_getInstanceMethod(arrayM, @selector(objectAtIndex:));
    Method customeObjectAtIndex = class_getInstanceMethod(arrayM, @selector(custmeObjectAtIndex:));
    method_exchangeImplementations(objectAtIndex, customeObjectAtIndex);


}
-(void)customRemoveObject:(id)anObject{
    if (anObject) {
        [self customRemoveObject:anObject];
    }else{
        NSLog(@"数组移除了一个空的元素");
    }
}
-(void)customRemoveObjectAtIndex:(NSUInteger)index{
    if (index < self.count) {
        [self customRemoveObjectAtIndex:index];
    }else{
        NSLog(@"数组移除了一个大于数组长度的元素，下标为%lu",index);
    }

}
//arr[0] = value
-(void)msySetObject:(id)obj atIndexedSubscript:(NSUInteger)idx{
    if (obj) {
        [self msySetObject:obj atIndexedSubscript:idx];
    }else{
        NSLog(@"兄弟啊,数组赋了个空值：%s传了个空值\n",__func__);
    }
}

- (void)msyInsertObject:(id)anObject atIndex:(NSUInteger)index{
    if (anObject && index <= self.count) {
        [self msyInsertObject:anObject atIndex:index];
    }else{
        NSLog(@"兄弟啊,数组赋了个空值：%s传了个空值\n",__func__);
    }
}
- (void)msyAddObject:(id)obj{
    if (obj) {
        [self msyAddObject:obj];
    }else{
        NSLog(@"兄弟啊,数组赋了个空值：%s传了个空值\n",__func__);
    }
}
- (id)custmeObjectAtIndex:(NSInteger)index{
    if (index >= self.count) {
        return nil;
    }
    return [self custmeObjectAtIndex:index];
}
//#endif
@end
