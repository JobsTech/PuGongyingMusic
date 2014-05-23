//
//  PGYTopListMusicViewController.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-8.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYTopListMusicViewController.h"
#import "PGYChartInfoInterface.h"
#import "ChartInfoEntity.h"
#import "PGYTopListMusicTableView.h"
#import "PGYTopListClassifyView.h"
#import "PGYTopListModel.h"
#import "PGYTopListBtnModel.h"

@interface PGYTopListMusicViewController ()<PGYChartInfoInterfaceDelegate>



{
    PGYChartInfoInterface * chartInfoInterface;
    
}

@property(nonatomic,strong)PGYTopListMusicTableView *  tableView;
@property(nonatomic,strong)NSMutableArray *  topListModelArray;


@end

@implementation PGYTopListMusicViewController





- (void)viewDidLoad
{
    [super viewDidLoad];
    
    chartInfoInterface=[[PGYChartInfoInterface alloc]init];
    chartInfoInterface.delegate=self;
//    [chartInfoInterface downloadChartInfoWithPageNum:@"1" AndCurrPageCount:@"20"];
    [self setUpViews];
}



-(void)setUpViews{
    
    self.tableView=[[PGYTopListMusicTableView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60-50)];
    self.tableView.superController=self.superController;
    self.tableView.topListModelArray=self.topListModelArray;
    [self.view addSubview:self.tableView];

    
}


-(NSMutableArray *)topListModelArray{
    if (nil==_topListModelArray) {
        
        _topListModelArray=[NSMutableArray array];
        
        
        PGYTopListModel  * typeModel=[PGYTopListModel new];
        typeModel.headTitle=@"分类";
        typeModel.btnArray=[NSMutableArray array];
        PGYTopListBtnModel * typeBtnModel1=[PGYTopListBtnModel new];
        typeBtnModel1.btnTitle=@"摇滚";
        typeBtnModel1.btnType=TopListBtnTypeSearchKeyWord;
        [typeModel.btnArray addObject:typeBtnModel1];
        
        PGYTopListBtnModel * typeBtnModel2=[PGYTopListBtnModel new];
        typeBtnModel2.btnTitle=@"爵士";
        typeBtnModel2.btnType=TopListBtnTypeSearchKeyWord;
        [typeModel.btnArray addObject:typeBtnModel2];
        
        PGYTopListBtnModel * typeBtnModel3=[PGYTopListBtnModel new];
        typeBtnModel3.btnTitle=@"流行歌曲";
        typeBtnModel3.btnType=TopListBtnTypeSearchKeyWord;
        [typeModel.btnArray addObject:typeBtnModel3];
        
        PGYTopListBtnModel * typeBtnModel4=[PGYTopListBtnModel new];
        typeBtnModel4.btnTitle=@"欧美";
        typeBtnModel4.btnType=TopListBtnTypeSearchKeyWord;
        [typeModel.btnArray addObject:typeBtnModel4];
        
        PGYTopListBtnModel * typeBtnModel5=[PGYTopListBtnModel new];
        typeBtnModel5.btnTitle=@"中国风";
        typeBtnModel5.btnType=TopListBtnTypeSearchKeyWord;
        [typeModel.btnArray addObject:typeBtnModel5];
        
        PGYTopListBtnModel * typeBtnModel6=[PGYTopListBtnModel new];
        typeBtnModel6.btnTitle=@"老歌曲";
        typeBtnModel6.btnType=TopListBtnTypeSearchKeyWord;
        [typeModel.btnArray addObject:typeBtnModel6];
        
        PGYTopListBtnModel * typeBtnModel7=[PGYTopListBtnModel new];
        typeBtnModel7.btnTitle=@"说唱";
        typeBtnModel7.btnType=TopListBtnTypeSearchKeyWord;
        [typeModel.btnArray addObject:typeBtnModel7];
        
        PGYTopListBtnModel * typeBtnModel8=[PGYTopListBtnModel new];
        typeBtnModel8.btnTitle=@"古风";
        typeBtnModel8.btnType=TopListBtnTypeSearchKeyWord;
        [typeModel.btnArray addObject:typeBtnModel8];
        
        PGYTopListBtnModel * typeBtnModel9=[PGYTopListBtnModel new];
        typeBtnModel9.btnTitle=@"古典";
        typeBtnModel9.btnType=TopListBtnTypeSearchKeyWord;
        [typeModel.btnArray addObject:typeBtnModel9];
        
        PGYTopListBtnModel * typeBtnModel10=[PGYTopListBtnModel new];
        typeBtnModel10.btnTitle=@"轻音乐";
        typeBtnModel10.btnType=TopListBtnTypeSearchKeyWord;
        [typeModel.btnArray addObject:typeBtnModel10];
        
        PGYTopListBtnModel * typeBtnModel11=[PGYTopListBtnModel new];
        typeBtnModel11.btnTitle=@"蓝调";
        typeBtnModel11.btnType=TopListBtnTypeSearchKeyWord;
        [typeModel.btnArray addObject:typeBtnModel11];
        
        PGYTopListBtnModel * typeBtnModel12=[PGYTopListBtnModel new];
        typeBtnModel12.btnTitle=@"电子";
        typeBtnModel12.btnType=TopListBtnTypeSearchKeyWord;
        [typeModel.btnArray addObject:typeBtnModel12];
        
        PGYTopListBtnModel * typeBtnModel13=[PGYTopListBtnModel new];
        typeBtnModel13.btnTitle=@"钢琴曲";
        typeBtnModel13.btnType=TopListBtnTypeSearchKeyWord;
        [typeModel.btnArray addObject:typeBtnModel13];
        
        PGYTopListBtnModel * typeBtnModel14=[PGYTopListBtnModel new];
        typeBtnModel14.btnTitle=@"R&B";
        typeBtnModel14.btnType=TopListBtnTypeSearchKeyWord;
        [typeModel.btnArray addObject:typeBtnModel14];
        
        [_topListModelArray addObject:typeModel];

        
    }
    return _topListModelArray;

}



-(void)arrayWithDownChartInfoComplete:(NSMutableArray *)chartInfoArray{
    PGYTopListModel  * chartModel=[PGYTopListModel new];
    chartModel.headTitle=@"榜单";
    chartModel.btnArray=[NSMutableArray array];
    for (ChartInfoEntity *model in chartInfoArray) {
        
        PGYTopListBtnModel * chartBtnModel=[PGYTopListBtnModel new];
        chartBtnModel.btnTitle=model.chartName;
        [chartBtnModel.btnTitle stringByReplacingOccurrencesOfString:@"蒲公英" withString:@"咪咕"];
        chartBtnModel.chartId=model.chartCode;
        chartBtnModel.btnType=TopListBtnTypeChartId;
        [chartModel.btnArray addObject:chartBtnModel];
    }
    
    if ([self.topListModelArray count]>=2) {
        [self.topListModelArray replaceObjectAtIndex:1 withObject:chartModel];
    }else{
        [self.topListModelArray addObject:chartModel];
    }

    [self.tableView reloadData];
}



@end
