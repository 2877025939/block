//
//  ViewController1.h
//  Block终极
//
//  Created by anan on 2017/8/24.
//  Copyright © 2017年 Plan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  void(^MyBlock)(NSString *str);

@interface ViewController1 : UIViewController
@property (nonatomic,copy) MyBlock myBlock;
@property (nonatomic,copy)NSString *VC1Str;
@end
