//
//  PGYSettingTableViewCell.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-14.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYSettingTableViewCell.h"
#import "PGYSettingModel.h"
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
        
    }
    return self;
}


-(void)setUpViews{
    if (self.settingModel.imageName) {
        UIImage *img=[UIImage imageNamed:self.settingModel.imageName];
        UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        imgView.image=img;
        
        
    }
    
    UILabel *title=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
    title.text=self.settingModel.title;
    [self addSubview:title];

}


-(void)setSettingModel:(PGYSettingModel *)settingModel{
    _settingModel=settingModel;
    [self setUpViews];
}




@end
