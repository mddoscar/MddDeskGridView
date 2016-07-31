//
//  MddDeskImageView.h
//  com.mddoscar.mddhelper
//
//  Created by mac on 16/6/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MddDeskImageView : UIImageView
@property(nonatomic)CGRect imageViewFrame;
@property(nonatomic) id target;
@property(nonatomic)SEL action;
//@property(nonatomic,)
-(void)addTarget:(id)target action:(SEL)action;
@end
