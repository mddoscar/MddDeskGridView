//
//  MddDeskGridViewController.h
//  com.mddoscar.mddhelper
//
//  Created by mac on 16/6/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MddDeskGridView.h"
#import "BaseProccessViewController.h"
@class MddDeskMenuItemView;
@protocol MddDeskGridViewControlDelegate <NSObject>

@required
-(NSMutableArray*)createMenuItems;
//布局子实体
-(void)gridView:(MddDeskMenuItemView *)gridViewCell menuItemViewAtIndex:(NSUInteger)index;
@end

@interface MddDeskGridViewController : BaseProccessViewController<MddDeskGridViewControlDelegate,MddDeskGridViewDelegate>

@property(nonatomic,strong)NSMutableArray *menuItems;
//@property(nonatomic,strong) UIView * contextView;
//@property(nonatomic,strong) MddDeskGridView *gridView;
//重新刷新数据
-(void) reloadDataCallBack:(void(^)(MddDeskGridView * pResult)) pCallBack;

@end

