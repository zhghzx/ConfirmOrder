//
//  YLOrderCommitTableViewCell.h
//  ConfirmOrder
//
//  Created by zhangxing on 2017/5/26.
//  Copyright © 2017年 zhangxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLOrderCommitModel.h"

@interface YLOrderCommitTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *goodsName;
@property (weak, nonatomic) IBOutlet UILabel *goodsInfo;
@property (weak, nonatomic) IBOutlet UILabel *goodsCount;

@property (nonatomic, strong) YLOrderCommitGoods *goodsModel;

@end
