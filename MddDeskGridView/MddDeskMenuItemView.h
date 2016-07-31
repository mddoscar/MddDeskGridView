//
//  MddDeskMenuItemView.h
//  com.mddoscar.mddhelper
//
//  Created by mac on 16/6/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MddDeskImageView.h"

@class MddDeskItem;
//@class MddDeskImageView;

@interface MddDeskMenuItemView : UIView
@property(nonatomic,strong)IBOutlet UILabel *text;
@property(nonatomic,strong)IBOutlet UITextView *info;
@property(nonatomic,strong)IBOutlet UILabel *badge;
@property(nonatomic,strong)IBOutlet MddDeskImageView *icon;

+(id)menuItemView:(MddDeskItem*)menuItem;

-(void)addTarget:(id)target action:(SEL)action;
-(MddDeskImageView *) getIcon;

@end
