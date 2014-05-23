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
@property(nonatomic,strong)UIView * topView;
@property(nonatomic,strong)UILabel *topViewTitleLabel;
@property(nonatomic,strong)UIView * myContentView;
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
        
        
    }
    return self;
}














-(void)setUpViews{
    
    [self setUpTopView];
    [self setUpContentView];
    
    
    
}

-(void)setUpTopView{
    
    float topViewX=0;
    float topViewY=0;
    float topViewW=self.frame.size.width;
    float topViewH=40;
    
    if (nil==self.topView) {
        self.topView=[[UIView alloc]init];
        [self addSubview:self.topView];
    }
    self.topView.frame=CGRectMake(topViewX, topViewY, topViewW, topViewH);
    
    float topViewTitleX=10;
    float topViewTitleY=10;
    float topViewTitleW=topViewW-20;
    float topViewTitleH=topViewH;
    if (nil==self.topViewTitleLabel) {
        self.topViewTitleLabel=[[UILabel alloc]init];
        [self.topViewTitleLabel setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]];
        [self.topView addSubview:self.topViewTitleLabel];
    }
    
    self.topViewTitleLabel.frame=CGRectMake(topViewTitleX, topViewTitleY, topViewTitleW, topViewTitleH);
    self.topViewTitleLabel.text=self.topListModel.headTitle;
    
    
    
}
-(void)setUpContentView{
    
    float contentW=self.frame.size.width;
    float contentH=self.frame.size.height;
    
    if (nil==self.myContentView) {
        self.myContentView=[[UIView alloc]init];
        [self addSubview:self.myContentView];
    }
    self.myContentView.frame=CGRectMake(0, 50, contentW, contentH);
    
    for (UIView *view in self.myContentView.subviews) {
        [view removeFromSuperview];
    }
    
    
    float splitWH=10;
    float contentBtnWH=(contentW-10*4)/3;
    for (int i=0; i<[self.topListModel.btnArray count]; i++) {
        int cel=i%3; //列
        int row=i/3;    //行
        PGYTopListBtnModel *btnModel=[self.topListModel.btnArray objectAtIndex:i];
        float contentBtnX=cel*(contentBtnWH+splitWH)+splitWH;
        float contentBtnY=row*(contentBtnWH+splitWH)+splitWH;
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(contentBtnX,contentBtnY, contentBtnWH, contentBtnWH)];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [btn setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.3]];
        [btn setTitle:btnModel.btnTitle forState:UIControlStateNormal];
        btn.tag=i;
        [self.myContentView addSubview:btn];
    }
    
    
    
    
}


-(void)click:(UIButton *)btn{
    PGYMusicListViewController *musicListController=[[PGYMusicListViewController alloc]init];
    self.superController.navigationBarHidden=NO;
    [self.superController pushViewController:musicListController animated:YES];
    
    
    PGYTopListBtnModel *model=[self.topListModel.btnArray objectAtIndex:btn.tag];
    if (model.btnType==TopListBtnTypeChartId) {
        musicListController.chartId=model.chartId;
    }
    if (model.btnType==TopListBtnTypeSearchKeyWord) {
        musicListController.keyWord=model.btnTitle;
    }
}


-(void)setHighlighted:(BOOL)highlighted{


}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{

}




-(void)setSelected:(BOOL)selected{
    super.selected=NO;

}


-(void)setTopListModel:(PGYTopListModel *)topListModel{

    _topListModel = topListModel;
    
    int num=[topListModel.btnArray count];
    
    float contentBtnWH=(self.frame.size.width-10*4)/3+10;
    
    int height=(num+2)/3*contentBtnWH+50+10;
    
    CGRect myFrame=self.frame;
    
    myFrame.size.height=height;

    self.frame=myFrame;
    
    [self setUpViews];
    
}



@end
