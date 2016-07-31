//
//  MddDeskMenuItemView.m
//  com.mddoscar.mddhelper
//
//  Created by mac on 16/6/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MddDeskMenuItemView.h"
#import "MddDeskItem.h"
#import "MddDeskImageView.h"
#define NIBNAME @"MddDeskMenuItemView"
@implementation MddDeskMenuItemView
- (id)init{
    if(self=[super init]){
        
        //NSLog(@"MenuItemView init begin");
        NSArray *views=[[NSBundle mainBundle] loadNibNamed:NIBNAME owner:self options:nil];
        [self addSubview:[views objectAtIndex:0]];
        // self.icon.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
        //self.icon.center=
        //self.icon.layer.borderWidth=1.0;
        //self.icon.layer.borderColor=[UIColor  colorWithWhite:0.4 alpha:0.4].CGColor;
        //self.icon.clipsToBounds=YES;
        //self.icon.layer.cornerRadius=5.0;
        //self.icon.layer.backgroundColor=[UIColor orangeColor].CGColor;
        //self.icon.layer.
        //NSLog(@"MenuItemView init end");
    }
    return self;
}

-(void)addTarget:(id)target action:(SEL)action{
    //[target action];
    if(self.icon){
        [self.icon addTarget:target action:action];
        //self.icon.userInteractionEnabled=YES;
        //NSLog(@"icon=%d",self.icon.tag);
        //UITapGestureRecognizer *singleClick=[[UITapGestureRecognizer alloc] initWithTarget:target action:action];
        //[self.icon addGestureRecognizer:singleClick];
    }
}

+(id)menuItemView:(MddDeskItem*)menuItem;
{
    MddDeskMenuItemView *menuItemView=[[MddDeskMenuItemView alloc] init];
    menuItemView.text.text=menuItem.text;
    menuItemView.info.text=menuItem.info;
    menuItemView.badge.text=menuItem.badge;
    menuItemView.text.font=kBaseFontLargeFontSizeC;
    menuItemView.backgroundColor=[UIColor clearColor];
//    menuItemView.alpha=0.1f;
//    [menuItemView.icon setImage:[UIImage imageNamed:menuItem.icon] forState:UIControlStateNormal];
    [menuItemView.icon setImage:[UIImage imageNamed:menuItem.icon]];
    return menuItemView;
}

-(MddDeskImageView *) getIcon
{
    return self.icon;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
