//
//  YLConfirmOrdeSectionHeaderView.m
//  ConfirmOrder
//
//  Created by zhangxing on 2017/5/26.
//  Copyright © 2017年 zhangxing. All rights reserved.
//

#import "YLConfirmOrdeSectionHeaderView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation YLConfirmOrdeSectionHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 45);
        self.contentView.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

@end
