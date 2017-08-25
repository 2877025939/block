//
//  Person.h
//  NSOperation
//
//  Created by anan on 2017/8/23.
//  Copyright © 2017年 Plan. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^Block) (NSString * str);

typedef void (^MyBlock)(NSString * str);
@interface Person : NSObject

@property(nonatomic,strong)MyBlock myBlock;
@property(nonatomic,strong)NSString *personStr ;

-(void)testBlock:(Block)myBlock;


@end
