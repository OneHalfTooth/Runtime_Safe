//
//  ViewController.m
//  Runtime_Safe
//
//  Created by 马扬 on 2016/9/22.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSDictionary * test = nil;
    
    NSDictionary * testDic = [[NSDictionary alloc]initWithDictionary:test];
    
    NSMutableDictionary * testMutableDic = [[NSMutableDictionary alloc]init];
    NSString * nu = nil;
    [testMutableDic setObject:nu forKey:@"error"];
    testMutableDic[@"fail"] = nu;
    [testMutableDic removeObjectForKey:@"key"];
    
    NSArray * temp = nil;
    NSArray * testArray = [[NSArray alloc]initWithArray:temp];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
