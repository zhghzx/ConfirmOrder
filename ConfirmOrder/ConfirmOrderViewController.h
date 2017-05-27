//
//  ConfirmOrderViewController.h
//  ConfirmOrder
//
//  Created by zhangxing on 2017/5/26.
//  Copyright © 2017年 zhangxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfirmOrderViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
//底部
@property (weak, nonatomic) IBOutlet UILabel *totalMoney;//合计金额

//headerView
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *receiver;//人
@property (weak, nonatomic) IBOutlet UILabel *receiveLocation;//地址
@property (weak, nonatomic) IBOutlet UIView *addLocationView;

//footerView
@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (weak, nonatomic) IBOutlet UILabel *allMoney;//总金额
@property (weak, nonatomic) IBOutlet UIButton *OnlinePayBtn;
@property (weak, nonatomic) IBOutlet UIButton *CashOnDeliveryBtn;





@end
