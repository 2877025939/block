//
//  ViewController1.m
//  Block终极
//
//  Created by anan on 2017/8/24.
//  Copyright © 2017年 Plan. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   
    if (self.myBlock) {
        self.myBlock(@"20");
    }
    
    [self.navigationController popViewControllerAnimated:NO];
}


-(NSString *)VC1Str{
    
    if (!_VC1Str) {
        _VC1Str = [[NSString alloc]init];
        _VC1Str = @"VC1Str";
    }
    return _VC1Str;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
