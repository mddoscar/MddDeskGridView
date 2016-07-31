//
//  MddDeskGridViewController.m
//  com.mddoscar.mddhelper
//
//  Created by mac on 16/6/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MddDeskGridViewController.h"

#import "MddDeskItem.h"

@interface MddDeskGridViewController ()

//-(NSMutableArray*)createMenuItems;
@end
@implementation MddDeskGridViewController
//@synthesize contextView=_contextView;
//@synthesize gridView=_gridView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    NSLog(@" init line=%d,%s",__LINE__,__FUNCTION__);
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSMutableArray *)createMenuItems
{
    NSMutableArray * result=[NSMutableArray array];
    for (int i=0; i<20; i++) {
        
        [result addObject:[[MddDeskItem alloc]initMenuItemWithText:@"1" info:@"infoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfo" icon:@"wellcome" badge:@""] ];
        
    }
    return  result;
    
}
-(void)gridView:(MddDeskMenuItemView *)gridViewCell menuItemViewAtIndex:(NSUInteger)index
{
    NSLog(@"布局子%ld",index);
}

- (NSUInteger)numberOfMenuItemsInGridView:(MddDeskGridView *)gridView{
    return self.menuItems.count;
}

- (MddDeskItem *)gridView:(MddDeskGridView *)gridView menuItemAtIndex:(NSUInteger)index{
    return [self.menuItems objectAtIndex:index];
}

-(void)gridView:(MddDeskGridView *)gridView didSelectMenuItemAtIndex:(NSUInteger)index{
    
    NSLog(@"select item index=%lu",(unsigned long)index);
    NSAssert(self.menuItems, @"please implement createMenuItems");
    MddDeskItem *selectedMenuItem=[self.menuItems objectAtIndex:index];
//    UIViewController *targetViewControl;
//    if(selectedMenuItem.targetStoryboardName){
//        UIStoryboard *moduleStoreboard= [UIStoryboard storyboardWithName:selectedMenuItem.targetStoryboardName bundle:nil];
//        targetViewControl=[moduleStoreboard instantiateInitialViewController];
//    }
//    //[self pushViewController:<#(UIViewController *)#> animated:<#(BOOL)#>];
//    targetViewControl.hidesBottomBarWhenPushed=YES;
//    [self.navigationController pushViewController:targetViewControl animated:YES];
    NSLog(@"selectedMenuItem:%@",selectedMenuItem);
    //[self pushViewController:targetViewControl animated:YES];
}

- (id)init{
    NSLog(@"line=%d,%s",__LINE__,__FUNCTION__);
    return [super init];
}

-(void)loadView{
    [super loadView];
    NSLog(@"line=%d,%s",__LINE__,__FUNCTION__);
    //self.vi
    // self.view.backgroundColor=[UIColor whiteColor];
    //NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"line=%d,%s",__LINE__,__FUNCTION__);
    //新建一个44像素的卡位
//    UIView * topView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
//    [self.view addSubview:topView];
    /*顶部高度*/
//    _contextView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
//    //去除布局影响
//    _contextView.translatesAutoresizingMaskIntoConstraints =NO;
//    [self.view addSubview:_contextView];
//    [_contextView setBackgroundColor:[UIColor clearColor]];
//    //约束
//    NSArray * TopConstraintsH=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(-16)-[_contextView]-(-16)-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(_contextView)];
//    NSArray * TopConstraintsV=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_contextView(>=60)]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(_contextView)];
//    [self.view addConstraints:TopConstraintsH];
//    [self.view addConstraints:TopConstraintsV];
//    // 得到当前视图的最低基准限制，这个是对于Auto Layout constraint来说的。
//        id topGuide = self.topLayoutGuide;
//        NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings (_contextView, topGuide);
//        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat: @"V:[_contextView]-0-[topGuide]"
//                                                                          options: 0
//                                                                          metrics: nil
//                                                                            views: viewsDictionary]];
//    id bottomGuide = self.bottomLayoutGuide;
//    NSDictionary *viewsDictionary1 = NSDictionaryOfVariableBindings (_contextView, bottomGuide);
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat: @"V:[_contextView]-0-[bottomGuide]"
//                                                                      options: 0
//                                                                      metrics: nil
//                                                                        views: viewsDictionary1]];
    NSLog(@"pre view=%@",NSStringFromCGRect(self.view.bounds));
     [self reloadDataCallBack:^(MddDeskGridView *pResult) {
    
     }];
    NSLog(@"after view=%@",NSStringFromCGRect(self.view.bounds));
    //[self per]
    
    //self.view=[[MDGridView alloc] init];
    
    // Do any additional setup after loading the view, typically from a nib.
}
//重新刷新数据
-(void) reloadDataCallBack:(void(^)(MddDeskGridView* pResult)) pCallBack
{
    self.menuItems=[self createMenuItems];
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    
    //    if (IsIOS7) {
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.extendedLayoutIncludesOpaqueBars = NO;
    
    self.modalPresentationCapturesStatusBarAppearance = NO;
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.tabBarController.tabBar.translucent = NO;
    
    //    }
    
#endif
    //导航条bug
    self.automaticallyAdjustsScrollViewInsets = YES;
    MddDeskGridView * _gridView=[[MddDeskGridView alloc] initWithFrame:self.view.bounds];
    _gridView.startPoint=CGPointMake(0, 44);
    _gridView.gridViewDelegate=self;
    
    self.view=_gridView;
    pCallBack(_gridView);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"line=%d,%s",__LINE__,__FUNCTION__);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"line=%d,%s",__LINE__,__FUNCTION__);
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"line=%d,%s",__LINE__,__FUNCTION__);
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"line=%d,%s",__LINE__,__FUNCTION__);
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"line=%d,%s",__LINE__,__FUNCTION__);
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"line=%d,%s",__LINE__,__FUNCTION__);
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
