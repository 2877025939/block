//
//  Person.m
//  NSOperation
//
//  Created by anan on 2017/8/23.
//  Copyright © 2017年 Plan. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.personStr = [[NSString alloc]init];
        self.personStr = @"1000";
    }
    return self;
}


-(void)testBlock:(Block)myBlock{
    
//    Person *person = [[Person alloc]init];
    
//    if (person.myBlock!= myBlock) {
//        person.myBlock = myBlock;
//    }
    
//    person.myBlock(@"20");
    
    if (myBlock){
        
        myBlock(@"20");
    }
}

@end
