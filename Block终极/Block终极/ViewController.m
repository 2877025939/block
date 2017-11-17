//
//  ViewController.m
//  Block终极
//
//  Created by anan on 2017/8/24.
//  Copyright © 2017年 Plan. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "Person.h"

typedef void (^MyBlock)(NSString *myBlockStr);
@interface ViewController ()
@property (nonatomic,strong)MyBlock myBlock;


@property(nonatomic,strong)NSString *str;
@property (nonatomic,strong)Person *person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    /********************************************************
     
     如果想要演示代码，请注意只能单独的演示，注意把其他的注释掉！！！！！
     
     ********************************************************/
}

#pragma mark - 1. block的简单使用
-(void)usingBlock{
    
    
    /********************************************************
     
     如果想要演示代码，请注意只能单独的演示，注意把其他的注释掉！！！！！
     
     ********************************************************/
    
    /**
     
     block解决循环引用
     看了网上的一些资料，感觉晕乎乎的，还不是很明白。自己抽了一个下午仔细的研究了一下block，嗯，明白了好多。分两次写出来，欢迎大家交流。
     这里不讨论底层，不讨论原理，注重实用！

     什么是block？
     
     闭包（block）:闭包就是获取其他函数局部变量的匿名函数。
     
     block格式：
     返回值类型(^block变量名)(形参列表) = ^(形参列表) {
     };
     */
    
    //有参数无返回值
    void (^myBlock)(NSString* ) = ^(NSString *myBlockStr){
        NSLog(@"%@",myBlockStr);
    };
    
    myBlock(@"safeed");
    
    
    //有参数有返回值
    NSString* (^myBlock1)(NSString* ) = ^(NSString *myBlockStr){
        NSLog(@"%@",myBlockStr);
        return @"我是返回值";
    };
    
    NSLog(@"%@",myBlock1(@"参数值"));
}


#pragma mark - 2. 避免循环引用详解
-(void)usingBlockToAvoidretainCycle{
    /********************************************************
     
     如果想要演示代码，请注意只能单独的演示，注意把其他的注释掉！！！！！
     
     ********************************************************/
    
    //1.不会循环引用
    self.myBlock = ^(NSString *myBlockStr) {
        
        NSLog(@"%@",myBlockStr);
    };
    //self引用了myBlock，但是在myBlock并没有self什么事情，只是打印了一下参数myBlockStr，并不会造成循环引用
    self.myBlock(@"myBlockStr201");
    
    
//    //2.会循环引用
//    self.myBlock = ^(NSString *myBlockStr) {
//        
//        NSLog(@"%@",self.str);
//        NSLog(@"%@",self.str = myBlockStr);
//    
//    };
//    //这个就是典型的block循环引用了,self引用了myBlock，myBlock内部引用了self，想要解除循环引用，需要在block外部弱引用一下self， __weak typeof(self) weakSelf = self;
//    self.myBlock(@"myBlockStr202");
//    
//    //3.解除循环引用
//    __weak typeof(self) weakSelf = self;
//    
//    self.myBlock = ^(NSString *myBlockStr) {
//        
//        NSLog(@"%@",weakSelf.str);
//        NSLog(@"%@",weakSelf.str = myBlockStr);
//        
//    };
//    
//    self.myBlock(@"myBlockStr203");
//    
//    //4.block内修改外部变量
//    __block NSString *myStr = @"2000q";
//    
//    self.myBlock = ^(NSString *myBlockStr) {
//        
//        myStr = @"200a";
//        NSLog(@"%@",myBlockStr);
//        NSLog(@"%@",myStr);
//    };
//    //Block不允许修改外部变量的值，这里所说的外部变量的值，指的是栈中指针的内存地址。__block 所起到的作用就是只要观察到该变量被 block 所持有，就将“外部变量”在栈中的内存地址放到了堆中。进而在block内部也可以修改外部变量的值
//    self.myBlock(@"myBlockStr204");
//    
//    
//    
//    // 5.block的简单使用升级
//        self.person.myBlock = ^(NSString *str) {
//    
//            NSLog(@"%@",self.person.personStr);
//            NSLog(@"%@",self.person);
//            NSLog(@"%@",self.str);
//            NSLog(@"%@",self.str = str);
//        };
    
}

#pragma mark - 3. block的反向传值
-(void)usingBlockReverseTheValue{
    
    /********************************************************
     
     如果想要演示代码，请注意只能单独的演示，注意把其他的注释掉！！！！！
     
     ********************************************************/
    
        //1.不会循环引用
        ViewController1 *vc = [[ViewController1 alloc]init];
    
        vc.myBlock = ^(NSString *str) {
            NSLog(@"%@",str);
            //NSLog(@"%@",self.str);
            NSLog(@"%@",self.str = str);
    
        };
        [self.navigationController pushViewController:vc animated:YES];
    
//    //2.会循环引用
//       ViewController1 *vc = [[ViewController1 alloc]init];
//    
//        vc.myBlock = ^(NSString *str) {
//    
//            NSLog(@"%@",vc.VC1Str);
//            NSLog(@"%@",vc);
//    
//    
//        };
//        [self.navigationController pushViewController:vc animated:YES];
//    
//    
//    
//    //3.解除循环引用
//        ViewController1 *vc = [[ViewController1 alloc]init];
//        __weak typeof(vc) weakSelf = vc;
//    
//        vc.myBlock = ^(NSString *str) {
//            NSLog(@"%@",weakSelf.VC1Str);
//            NSLog(@"%@",weakSelf);
//            
//        };
//        [self.navigationController pushViewController:vc animated:YES];
    

    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    /********************************************************
     
     如果想要演示代码，请注意只能单独的演示，注意把其他的注释掉！！！！！
     
     ********************************************************/
    
    
    /**
     block的注意点
     1.在block内部使用外部指针且会造成循环引用情况下，需要用到_weak修饰外部指针
     __weak typeof(self) weakSelf = self;
     
     2.在block内部如果调用了延时函数还使用了弱指针会取不到指针，因为已经被销毁了，需要在block内部再将弱指针重新强引用一下。
     __strong typeof(self) strongSelf = weakSelf;
     
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
     [... test];
     });
     3.如果需要在block内部改变外部栈区变量的话，需要在用__block修饰外部变量
     */
    
    /** 
     什么情况下会造成循环引用？
     当前控制器引用着block，block引用这当前控制器，就会造成循环引用。
     
     */
   
    //1. block的简单使用
   // [self usingBlock];
    
    //2.避免循环引用详解
    //[self usingBlockToAvoidretainCycle];
    
    //3. block的反向传值
    [self usingBlockReverseTheValue];
    
//
//    // 4. block在方法中的使用
//    //只能在方法内部进行调用，用于回调和传值等
//    //我觉得是这个block是在方法中 不属于对象的属性 并没有被对象持有 所以并不会引起循环引用
//    [self.person testBlock:^(NSString *str) {
//
//        NSLog(@"%@",str);
//        NSLog(@"%@",self.str);
//        NSLog(@"%@",self.str = str);
//        NSLog(@"%@",self.person.personStr);
//    }];
    
}

-(Person *)person{
    
    if (!_person) {
        _person = [[Person alloc]init];
    }
    return _person;
}

-(NSString *)str{
    
    if (!_str) {
        _str = [[NSString alloc]init];
        
    }
    return _str;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
