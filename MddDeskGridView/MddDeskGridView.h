//
//  MddDeskGridView.h
//  com.mddoscar.mddhelper
//
//  Created by mac on 16/6/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MddDeskGridView;
@class MddDeskItem;
@class MddDeskMenuItemView;
@protocol MddDeskGridViewDelegate <NSObject>
@required
-(NSUInteger)numberOfMenuItemsInGridView:(MddDeskGridView*)gridView;
-(MddDeskItem*)gridView:(MddDeskGridView*)gridView menuItemAtIndex:(NSUInteger)index;
-(void)gridView:(MddDeskGridView*)gridView didSelectMenuItemAtIndex:(NSUInteger)index;
//布局子实体
-(void)gridView:(MddDeskMenuItemView *)gridViewCell menuItemViewAtIndex:(NSUInteger)index;
@end

@interface MddDeskGridView : UIScrollView

@property(nonatomic,weak)id<MddDeskGridViewDelegate> gridViewDelegate;

//@property(nonatomic)NSUInteger padding;
@property(nonatomic)BOOL isAutoFit;//default YES
@property(nonatomic)NSUInteger topPadding;//default 10
@property(nonatomic) NSUInteger columnPortraitCount;//default count 3
@property(nonatomic) NSUInteger columnLandscapeCount;//default count 4
@property(nonatomic) CGSize menuItemSize;//default size 100*100
//添加纠偏
@property(nonatomic) CGPoint startPoint;//起始点用于纠偏


@end