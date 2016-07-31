//
//  MddDeskGridView.m
//  com.mddoscar.mddhelper
//
//  Created by mac on 16/6/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MddDeskGridView.h"

#import "MddDeskItem.h"
#import "MddDeskMenuItemView.h"
#import "MddDeskImageView.h"
#import "DeviceHelper.h"

@interface MddDeskGridView()

//开放吧
@property(nonatomic,strong)NSMutableArray *menuItemViews;

-(void)createMenuItemViews;
-(void)layoutMenuItemViews;
-(void)menuItemClick:(id)sender;
@end
@implementation MddDeskGridView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor whiteColor];
        self.menuItemViews=[[NSMutableArray alloc] init];
        self.menuItemSize=CGSizeMake(100, 100);
        self.columnLandscapeCount=4;
        self.columnPortraitCount=3;
        self.isAutoFit=YES;
        self.topPadding=10;
        self.startPoint=CGPointMake(0, 0);
        //self.padding=5;
        //self.
    }
    NSLog(@"init GridVew:%d:%s",__LINE__,__FUNCTION__);
    return self;
}

-(void)menuItemClick:(MddDeskImageView *)sender{
    //NSLog(@"sender=%@,index=%d",sender,sender.tag);
    [self.gridViewDelegate gridView:self didSelectMenuItemAtIndex:sender.tag];
}

-(void)createMenuItemViews{
    //比例缩放
    long panding=[DeviceHelper screenWidth]/320*5;
    
    long count=[self.gridViewDelegate numberOfMenuItemsInGridView:self];
    for(int i=0;i<count;i++){
        MddDeskItem *menuItem=[self.gridViewDelegate gridView:self menuItemAtIndex:i];
        MddDeskMenuItemView *menuItemView=[MddDeskMenuItemView menuItemView:menuItem];
        menuItemView.frame=CGRectMake(self.center.x+self.startPoint.x, self.center.y+self.startPoint.y, 100, 100);
        menuItemView.icon.tag=i;
        [menuItemView addTarget:self action:@selector(menuItemClick:)];
        [self.menuItemViews addObject:menuItemView];
        [self addSubview:menuItemView];
        [self.gridViewDelegate gridView:menuItemView menuItemViewAtIndex:i];

    }
    
    long rows=count/3;
    if(count%3>0)
        rows=rows+1;
    //    self.contentSize=CGSizeMake(self.bounds.size.width,(rows*100+5));
    self.contentSize=CGSizeMake(self.bounds.size.width,(rows*100+panding));
}
-(void)gridView:(MddDeskMenuItemView *)gridViewCell menuItemViewAtIndex:(NSUInteger)index
{

}

-(void)layoutMenuItemViews{
    

    
    int columnCount=3,padding=0;
    //BOOL isPortrait=[DeviceHelper isPortrait:self];
    if ([DeviceHelper isPortrait:self]) {
        columnCount=[DeviceHelper screenWidth]/(self.menuItemSize.width);
        padding=([DeviceHelper screenWidth]-(self.menuItemSize.width*columnCount))/(columnCount+1);
    }else{
        columnCount=[DeviceHelper screenWidth]/(self.menuItemSize.width);
        padding=([DeviceHelper screenWidth]-(self.menuItemSize.width*columnCount))/(columnCount+1);
    }
//    padding=([DeviceHelper screenWidth]-(self.menuItemSize.width*columnCount))/(columnCount+1);
    //int padding=[DeviceHelper];
    
    //if(Dev)
    long totalCount=self.menuItemViews.count;
    __block int menuItemX=0,menuItemY=0;
    //int columCount=3,totalCount=self.menuItemViews.count;
    for(int i=0;i<totalCount;i++){
        MddDeskMenuItemView *menuItemView=[self.menuItemViews objectAtIndex:i];
        // NSLog(@"index=%d,frame=%@",i,NSStringFromCGRect(menuItemView.frame));
        [UIView animateWithDuration:0.8 animations:^{
            //            if (i%columnCount==0) {
            //                menuItemX=5;
            //            }else{
            //                menuItemX=(i%columnCount)*(100+padding);
            //            }
            //            if(i<columnCount){
            //                menuItemY=10;
            //            }else{
            //                menuItemY=(i/columnCount)*(100+padding);
            //            }
            
            menuItemX=(i%columnCount)*(self.menuItemSize.width+padding);
            menuItemY=(i/columnCount)*(self.menuItemSize.width+padding);
            //修改起始位置
            menuItemView.frame=CGRectMake(menuItemX+padding/2+self.startPoint.x,menuItemY+self.startPoint.y, menuItemView.bounds.size.width, menuItemView.bounds.size.height);
            
        }];
        //NSLog(@"index=%d,frame=%@",i,NSStringFromCGRect(menuItemView.frame));
    }
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    NSLog(@"gridview begin %d:%s",__LINE__,__FUNCTION__);
    long count=[self.gridViewDelegate numberOfMenuItemsInGridView:self];
    if(count!=self.menuItemViews.count){
        NSLog(@"createMenuItemViews-----");
        [self createMenuItemViews];
    }
    
    [self layoutMenuItemViews];
    NSLog(@"gridview end %d:%s",__LINE__,__FUNCTION__);
    
}


@end
