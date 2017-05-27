//
//  YLOrderCommitTableViewCell.m
//  ConfirmOrder
//
//  Created by zhangxing on 2017/5/26.
//  Copyright © 2017年 zhangxing. All rights reserved.
//

#import "YLOrderCommitTableViewCell.h"

@implementation YLOrderCommitTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setGoodsModel:(YLOrderCommitGoods *)goodsModel {
    if (_goodsModel != goodsModel) {
        _goodsModel = goodsModel;
    }
    _goodsName.text = _goodsModel.goods_name;
    _goodsCount.text = [NSString stringWithFormat:@"x%@", _goodsModel.goods_num];
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"¥%@%@", _goodsModel.price, _goodsModel.spec_text]];
    NSRange redRange = [[attStr string] rangeOfString:_goodsModel.price];
    [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:redRange];
    [_goodsInfo setAttributedText:attStr];
}

@end
