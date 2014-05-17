//
//  PGYSettingTableViewCell.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-14.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYSettingTableViewCell.h"
#import "PGYSettingModel.h"

@interface PGYSettingTableViewCell()

@property(nonatomic,strong)UILabel *title;

@property(nonatomic,strong)UIView *line;


@property(nonatomic,strong)UIButton *button;

@end




@implementation PGYSettingTableViewCell






+(instancetype)cellWithTableView:(UITableView *)tableView AndSettingModel:(PGYSettingModel *)settingModel{
    static NSString *ID=@"PGYSettingTableViewCell";
    PGYSettingTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (nil == cell) {
        cell = [[PGYSettingTableViewCell  alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.settingModel=settingModel;
    return cell;
}





- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
//        self.selectedBackgroundView.backgroundColor=
        [self setUpViews];
        
            }
    return self;
}


-(void)setUpViews{
//    if (self.settingModel.imageName) {
//        UIImage *img=[UIImage imageNamed:self.settingModel.imageName];
//        UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//        imgView.image=img;
//        
//        
//    }
    
    _line=[[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1)];
    //        UIView *line=[[UIView alloc]initWithFrame:CGRectMake(10, 10, 150-20, 1)];
    [_line setBackgroundColor:[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1]];
    
    //        [line setBackgroundColor:[UIColor whiteColor]];
    
    [self addSubview:_line];

    
    
    _title=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, self.frame.size.width, 40)];
    [_title setBackgroundColor:[UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0]];
    _title.textColor=[UIColor whiteColor];
    _title.textColor=[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
    [self addSubview:_title];
    
   
//    _button=[[UIButton alloc]initWithFrame:CGRectMake(20, 0, self.frame.size.width, 40)];
//    [_button setBackgroundColor:[UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0]];
//    [_button setTintColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1]];
//    [_button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:_button];
//    
    
}


-(void)click:(UIButton *)btn{
    NSLog(@"");

}



-(void)setFrame:(CGRect)frame{
    frame.size.height=41;
    frame.size.width=150;
    [super setFrame:frame];

}

-(void)setHighlighted:(BOOL)highlighted{
    
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        [self setBackgroundColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.9]];
    }else{
        [self setBackgroundColor:[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0]];
    }


}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    
//    [self setBackgroundColor:[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1]];
    [super setHighlighted:highlighted animated:animated  ];

    if (highlighted) {
        [self setBackgroundColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.9]];
    }else{
        [self setBackgroundColor:[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0]];
    }
//     [self setBackgroundColor:[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1]];
}





-(void)setSelected:(BOOL)selected{


}


-(void)setSelected:(BOOL)selected animated:(BOOL)animated{


}


-(void)setSettingModel:(PGYSettingModel *)settingModel{
    _settingModel=settingModel;
    _title.text=settingModel.title;
    
}




@end
