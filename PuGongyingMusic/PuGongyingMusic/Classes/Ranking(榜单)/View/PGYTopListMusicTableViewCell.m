//
//  PGYTopListMusicTableViewCell.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYTopListMusicTableViewCell.h"
#import "PGYTopListButton.h"
#import "PGYMusicListViewController.h"

@interface PGYTopListMusicTableViewCell()
@property(nonatomic,strong)NSMutableArray *classifyTitleArray;

@end

@implementation PGYTopListMusicTableViewCell



+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID=@"PGYTopListMusicTableViewCell";
    PGYTopListMusicTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (nil == cell) {
        cell = [[PGYTopListMusicTableViewCell  alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.1]];
//        self.userInteractionEnabled=NO;
//        [self setBackgroundColor:[UIColor greenColor]];
        // 0.设置cell选中时的背景
        UIView *selectedBgView=[[UIView alloc]init];
        [selectedBgView setBackgroundColor:[UIColor clearColor]];
        self.selectedBackgroundView = selectedBgView;
        [self setUpViews];
        
    }
    return self;
}





-(void)setFrame:(CGRect)frame{
    frame.size.height=500;
 
    [super setFrame:frame];
}














-(void)setUpViews{
    
    [self setTopView];
    [self setContentView];
    
    
    
}

-(void)setTopView{
    
    float topViewX=0;
    float topViewY=0;
    float topViewW=self.frame.size.width;
    float topViewH=40;
    UIView *topView=[[UIView alloc]initWithFrame:CGRectMake(topViewX, topViewY, topViewW, topViewH)];
    
    float topViewTitleX=10;
    float topViewTitleY=10;
    float topViewTitleW=topViewW-20;
    float topViewTitleH=topViewH;
    UILabel *topViewTitleLabel=[[UILabel alloc]initWithFrame:CGRectMake(topViewTitleX, topViewTitleY, topViewTitleW, topViewTitleH)];
    
    topViewTitleLabel.text=@"分类";
    [topViewTitleLabel setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]];
    [topView addSubview:topViewTitleLabel];
    
    
//    UITextField *topViewTitle=[[UITextField alloc]initWithFrame:CGRectMake(topViewTitleX, topViewTitleY, topViewTitleW, topViewTitleH)];
//    [topView addSubview:topViewTitle];
    [self addSubview:topView];
}
-(void)setContentView{
    
    float contentW=self.frame.size.width;
    float contentH=self.frame.size.height;
    UIView *contentView=[[UIView alloc]initWithFrame:CGRectMake(0, 50, contentW, contentH)];
    float splitWH=10;
    float contentBtnWH=(contentW-10*4)/3;
    for (int i=0; i<[self.classifyTitleArray count]; i++) {
        int cel=i%3; //列
        int row=i/3;    //行
        float contentBtnX=cel*(contentBtnWH+splitWH)+splitWH;
        float contentBtnY=row*(contentBtnWH+splitWH)+splitWH;
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(contentBtnX,contentBtnY, contentBtnWH, contentBtnWH)];
        [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        [btn setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.3]];
//        [btn setBackgroundColor:[UIColor redColor]];
        [btn setTitle:[self.classifyTitleArray objectAtIndex:i] forState:UIControlStateNormal];
        [contentView addSubview:btn];
    }
    
    
    
    [self addSubview:contentView];
}


-(void)click{
//    UINavigationController *controller=[[UINavigationController alloc]init];
    PGYMusicListViewController *one=[[PGYMusicListViewController alloc]init];
    
   
    
//    
//    [self.superController presentViewController:controller animated:YES completion:^{
//        NSLog(@"ssssssssssssssssswancheng");
//    }];
    self.superController.navigationBarHidden=NO;
    self.superController.title=@"淘歌";
    [self.superController pushViewController:one animated:YES];
}
-(NSMutableArray *)classifyTitleArray{
    
    if (nil==_classifyTitleArray) {
        _classifyTitleArray=[NSMutableArray array];
        [_classifyTitleArray addObject:@"摇滚"];
        [_classifyTitleArray addObject:@"爵士"];
        [_classifyTitleArray addObject:@"小清新"];
        [_classifyTitleArray addObject:@"飞人"];
        [_classifyTitleArray addObject:@"老歌曲"];
        [_classifyTitleArray addObject:@"流行歌曲"];
        [_classifyTitleArray addObject:@"欧美"];
        [_classifyTitleArray addObject:@"中国风"];
        [_classifyTitleArray addObject:@"happy"];
        [_classifyTitleArray addObject:@"not"];
        [_classifyTitleArray addObject:@"quick"];
        
        
    }
    
    
    
    return _classifyTitleArray;
    
}

-(void)setHighlighted:(BOOL)highlighted{


}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{

}




-(void)setSelected:(BOOL)selected{
    super.selected=NO;

}




//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
// Configure the view for the selected state
//}

@end
