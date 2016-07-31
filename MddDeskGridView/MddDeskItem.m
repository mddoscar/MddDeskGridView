//
//  MddDeskItem.m
//  com.mddoscar.mddhelper
//
//  Created by mac on 16/6/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MddDeskItem.h"

@implementation MddDeskItem
-(id)initMenuItemWithText:(NSString*)text info:(NSString*)pInfo icon:(NSString*)pIcon badge:(NSString *)pBadge
{
    if (self=[super init]) {
        self.text=text;
        self.info=pInfo;
        self.icon=pIcon;
        self.badge=pBadge;
    }
    return self;
}
+(id)menuItemWithText:(NSString *)text info:(NSString *)pInfo icon:(NSString *)pIcon badge:(NSString *)pBadge
{
    MddDeskItem *menuItem=[[[self class] alloc] initMenuItemWithText:text info:pInfo icon:pIcon badge:pBadge];
    return menuItem;
}

@end
