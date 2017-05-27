//
//  YLOrderCommitModel.h
//  CityYouTian
//
//  Created by FuYunLei on 2017/5/26.
//  Copyright © 2017年 qz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLOrderCommitGoods : NSObject

@property(nonatomic,copy)NSString *cart_id;
@property(nonatomic,copy)NSString *store_id;
@property(nonatomic,copy)NSString *goods_name;
@property(nonatomic,copy)NSString *goods_cover;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *goods_num;
@property(nonatomic,copy)NSString *spec_text;

@end

@interface YLOrderCommitStore : NSObject

@property(nonatomic,copy)NSString *store_id;
@property(nonatomic,copy)NSString *store_name;
@property(nonatomic,copy)NSString *logistics_cost;
@property(nonatomic,copy)NSString *min_pay_money;
@property(nonatomic,strong)NSArray *goods;
@property(nonatomic,copy)NSString *store_num;
@property(nonatomic,copy)NSString *store_price;

@end

@interface YLOrderCommitModel : NSObject

@property(nonatomic,strong)NSDictionary *address;
@property(nonatomic,strong)NSArray *goods;
@property(nonatomic,copy)NSString *money;

+ (instancetype)createAModel;

@end
