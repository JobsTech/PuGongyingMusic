//
//  DDScrollViewController.h
//  
//
//  Created by Hirat on 13-11-8.
//
//

#import <UIKit/UIKit.h>

@protocol DDScrollViewDataSource;

@protocol DDScrollViewDelegate;


@interface DDScrollViewController : UIViewController
@property (nonatomic, weak) id <DDScrollViewDataSource> dataSource;

@property(nonatomic,weak)id<DDScrollViewDelegate>  delegate;

- (void)reloadData;

-(void)showTopMenuView;

-(void)hideTopMenuView;



@end


#pragma mark - dataSource
@protocol DDScrollViewDataSource <NSObject>

- (NSUInteger)numberOfViewControllerInDDScrollView:(DDScrollViewController*)DDScrollView;
- (UIViewController *)ddScrollView:(DDScrollViewController*)ddScrollView contentViewControllerAtIndex:(NSUInteger)index;

- (NSMutableArray *)topMenuButtonModelArrayInDDScrollView:(DDScrollViewController *)ddScrollView;

@end

@protocol DDScrollViewDelegate <NSObject>

@required
-(void)DDScrollViewDidScroll;

@end
