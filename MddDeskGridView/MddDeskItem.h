//
//  MddDeskItem.h
//  com.mddoscar.mddhelper
//
//  Created by mac on 16/6/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 项数据
 */
@interface MddDeskItem : NSObject
@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *info;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *badge;
//@property(nonatomic,cop)

+(id)menuItemWithText:(NSString*)text info:(NSString*)pInfo icon:(NSString*)pIcon badge:(NSString *)pBadge;
-(id)initMenuItemWithText:(NSString*)text info:(NSString*)pInfo icon:(NSString*)pIcon badge:(NSString *)pBadge;
@end
