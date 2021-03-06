//
//  NoYetPayCell.h
//  MYWowGoing
//
//  Created by zhangM on 13-7-30.
//
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"
@interface NoYetPayCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIButton *selectButton;  // 选中按钮
@property (retain, nonatomic) IBOutlet UILabel *productNameLable;  //产品名称
@property (retain, nonatomic) IBOutlet UILabel *colorAndSizeLable; //颜色、尺寸、折扣 标签
@property (retain, nonatomic) IBOutlet UILabel *priceLable;  //价格标签
@property (retain, nonatomic) IBOutlet UILabel *addressLabe; //取货地址标签
@property (retain, nonatomic) IBOutlet UIButton *deleteButton; //删除按钮
@property (retain, nonatomic) IBOutlet UILabel *lastTimeLable;

@property (retain, nonatomic) IBOutlet UIButton *shanChuBut;

@property (retain,nonatomic)  AsyncImageView *productImage;  //产品图片
@property (retain, nonatomic) IBOutlet UIImageView *magnifierImage; //放大镜图片
@property (retain, nonatomic) IBOutlet UIButton *addressButton;  //取货店铺查看按钮
@end
