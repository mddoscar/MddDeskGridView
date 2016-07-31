//
//  MddDeskImageView.m
//  com.mddoscar.mddhelper
//
//  Created by mac on 16/6/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MddDeskImageView.h"

#define kmaxCount 1 //最大两秒

@interface MddDeskImageView ()
{
    
}
@property(nonatomic,assign) __block BOOL isLong;
@property(nonatomic,assign) __block int index;
@end

@implementation MddDeskImageView
@synthesize index;
@synthesize isLong;
-(void)awakeFromNib
{
    self.isLong=false;
    self.index=0;
    //添加手势
//    [self addGestureRecognizer:self.mUIGestureRecognizer];
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super initWithCoder:aDecoder]){
        self.userInteractionEnabled=YES;
        self.layer.borderWidth=1.0;
        self.layer.borderColor=[UIColor colorWithWhite:0.5 alpha:0.1].CGColor;
        self.clipsToBounds=YES;
        self.layer.cornerRadius=5;
        self.layer.backgroundColor=[UIColor whiteColor].CGColor;
    }
    return  self;
}

- (void)addTarget:(id)target action:(SEL)action{
    self.target=target;
    self.action=action;
//    [self addTarget: self.target action:self.action forControlEvents:UIControlEventTouchUpInside];
}
//ad for
-(void) doTimeLoop:(int) pSpeed
{
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    __block dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC/pSpeed, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        //不能超过view最大值
        if(index>=kmaxCount){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            //            dispatch_release(_timer);
            _timer=nil;
            isLong=true;
//            [[NSNotificationCenter defaultCenter] postNotificationName:kNtfName_LongPress object:self];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                NSLog(@"index:%d",index);
            });
            index++;
            
        }
    });
    dispatch_resume(_timer);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // [super touchesBegan:touches withEvent:event];
    NSLog(@"touches Begin");
    //不是长按
    if (!self.isLong) {
        [self doTimeLoop:1000];
    }else{
        
    }
    self.imageViewFrame=self.frame;
    [UIView animateWithDuration:0.5 animations:^{
        self.frame=CGRectMake(self.frame.origin.x-5, self.frame.origin.y-5, self.frame.size.width+10, self.frame.size.height+10);
        
    }];
    
//    }
    //[UIView commitAnimations];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touches ended begin");
    //    [UIView animateWithDuration:0.5 animations:^{
    //
    //
    //    }];
    if(self.isLong)
    {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.frame=self.imageViewFrame;
        } completion:^(BOOL finished) {
            [[NSNotificationCenter defaultCenter] postNotificationName:kNtfName_LongPress object:self];
            self.isLong=false;
            self.index=0;
        }];
    }else{
    [UIView animateWithDuration:0.5 animations:^{
        self.frame=self.imageViewFrame;
    } completion:^(BOOL finished) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.target performSelector:self.action withObject:self];
#pragma clang diagnostic pop
        self.isLong=false;
        self.index=0;
    }];
    }
    
}
-(BOOL) gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
}

@end
