//
//  YLOrderCommitModel.m
//  CityYouTian
//
//  Created by FuYunLei on 2017/5/26.
//  Copyright © 2017年 qz. All rights reserved.
//

#import "YLOrderCommitModel.h"

@implementation YLOrderCommitGoods

@end

@implementation YLOrderCommitStore
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"goods" : [YLOrderCommitGoods class]};
}
@end

@implementation YLOrderCommitModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"goods" : [YLOrderCommitStore class]};
}


+ (instancetype)createAModel{
    
    YLOrderCommitModel *model = [[YLOrderCommitModel alloc] init];
    
    //模拟 有或者没有地址的
    if (arc4random()%2) {
        model.address = @{@"address_id":@"123",@"name":@"zx",@"mobile":@"102010313",@"areainfo":@"大华三路搞基室"};
    }else
    {
        model.address = nil;
    }
    //随机店铺数量
    int storeCount = arc4random()%4;
    NSMutableArray *stores = [NSMutableArray array];
    for (int i = 0; i<storeCount; i++) {
        YLOrderCommitStore *store = [[YLOrderCommitStore alloc] init];
        
        //随机店铺内商品数量
        int goodsCount = arc4random()%4+1;
        NSMutableArray *goodsArr = [NSMutableArray array];
        for (int j = 0; j<goodsCount; j++) {
            YLOrderCommitGoods *goods = [[YLOrderCommitGoods alloc] init];

            goods.goods_name = @"老鼠撒尿牛丸";

            //
            goods.price = @"101";
            goods.spec_text = @"/件/800g";
            goods.goods_num = [NSString stringWithFormat:@"%d", goodsCount];
            [goodsArr addObject:goods];
        }
        store.goods = goodsArr;
        store.store_name = @"老鼠牛丸店";
        
        //
        store.store_num = [NSString stringWithFormat:@"%d", goodsCount];
        store.logistics_cost = [NSString stringWithFormat:@"%d", arc4random()%20];
        store.store_price = [NSString stringWithFormat:@"%d", arc4random()%50];
        
        [stores addObject:store];
    }
    model.goods = stores;
    model.money = @"100";
    
    return model;
}
@end
