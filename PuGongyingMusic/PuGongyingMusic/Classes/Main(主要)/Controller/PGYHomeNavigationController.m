//
//  PGYHomeNavigationController.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-14.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYHomeNavigationController.h"

@interface PGYHomeNavigationController ()

@end

@implementation PGYHomeNavigationController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBarHidden=YES;
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    [super pushViewController:viewController animated:animated];

}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated{

    self.navigationBarHidden=YES;
    return [super popViewControllerAnimated:animated];

}



@end
