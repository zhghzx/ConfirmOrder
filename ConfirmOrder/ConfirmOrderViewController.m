//
//  ConfirmOrderViewController.m
//  ConfirmOrder
//
//  Created by zhangxing on 2017/5/26.
//  Copyright © 2017年 zhangxing. All rights reserved.
//

#import "ConfirmOrderViewController.h"
#import "YLOrderCommitModel.h"
#import "YLConfirmOrdeSectionHeaderView.h"
#import "YLConfirmOrdeSectionFooterView.h"
#import "YLOrderCommitTableViewCell.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ConfirmOrderViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ConfirmOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupUI];

    [_tableView registerNib:[UINib nibWithNibName:@"YLConfirmOrdeSectionHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"YLConfirmOrdeSectionHeaderView"];
    [_tableView registerNib:[UINib nibWithNibName:@"YLConfirmOrdeSectionFooterView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"YLConfirmOrdeSectionFooterView"];
    [_tableView registerNib:[UINib nibWithNibName:@"YLOrderCommitTableViewCell" bundle:nil] forCellReuseIdentifier:@"YLOrderCommitTableViewCell"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.rowHeight = 45;
    
    //测试 生成假数据
    YLOrderCommitModel *model = [YLOrderCommitModel createAModel];
    //设置地址
    if ([model.address count]) {
        //有地址
        _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 80);
        _addLocationView.hidden = YES;
        _receiver.text = [NSString stringWithFormat:@"收货人：%@ %@", model.address[@"name"], model.address[@"mobile"]];
        _receiveLocation.text = [NSString stringWithFormat:@"收货地址：%@", model.address[@"areainfo"]];
    }   else {
        _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 45);
        _addLocationView.hidden = NO;
    }
    
    self.dataSource = [NSMutableArray arrayWithArray:model.goods];
    
    [_tableView reloadData];
    
    //计算总价
    int totalCount = 0;
    for (YLOrderCommitStore *model in self.dataSource) {
        int n = [model.store_price intValue];
        totalCount += n;
    }
    _totalMoney.text = [NSString stringWithFormat:@"¥%d", totalCount];
    _allMoney.text = [NSString stringWithFormat:@"¥%d", totalCount];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI {
    _tableView.tableHeaderView = _headerView;
    _tableView.tableFooterView = _footerView;
    
    _OnlinePayBtn.layer.borderColor = [UIColor grayColor].CGColor;
    _CashOnDeliveryBtn.layer.borderColor = [UIColor grayColor].CGColor;
    //在线付款默认付款方式
    [_OnlinePayBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    _OnlinePayBtn.layer.borderWidth = 0;
    _CashOnDeliveryBtn.layer.borderWidth = 1;
}

#pragma mark -TableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.dataSource[section] goods] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YLOrderCommitGoods *model = [self.dataSource[indexPath.section] goods][indexPath.row];
    YLOrderCommitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YLOrderCommitTableViewCell"];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor redColor];
    cell.goodsModel = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 55;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    YLOrderCommitStore *model = self.dataSource[section];
    NSString *storeName = model.store_name;
    NSString *goodsCount = [NSString stringWithFormat:@"共%@件商品", model.store_num];
    YLConfirmOrdeSectionHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"YLConfirmOrdeSectionHeaderView"];
    headView.storeName.text = storeName;
    headView.goodsCount.text = goodsCount;
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 45;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    YLOrderCommitStore *model = self.dataSource[section];
    NSString *postage;
    if (model.logistics_cost.intValue > 300) {
        //免运费?
        postage = @"";
    }   else {
        postage = [NSString stringWithFormat:@"运费：¥%@（大于300免运费）", model.logistics_cost];

    }
    NSString *subtotal = [NSString stringWithFormat:@"小计：¥%@", model.store_price];
    
    YLConfirmOrdeSectionFooterView *footView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"YLConfirmOrdeSectionFooterView"];
    footView.postage.text = postage;
    footView.subtotal.text = subtotal;
    
    return footView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    YLOrderCommitGoods *model = [self.dataSource[indexPath.section] goods][indexPath.row];

    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -setter
- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

#pragma mark -在线支付
- (IBAction)onlinePayBtnClick:(id)sender {
    NSLog(@"付款方式:在线支付");
    [_OnlinePayBtn setBackgroundImage:[UIImage imageNamed:@"zhifufangshi_xuanzhong"] forState:UIControlStateNormal];
    _OnlinePayBtn.layer.borderWidth = 0;
    _CashOnDeliveryBtn.layer.borderWidth = 1;
    [_CashOnDeliveryBtn setBackgroundImage:nil forState:UIControlStateNormal];
}

#pragma mark -货到付款
- (IBAction)cashOnDeliveryBtnClick:(id)sender {
    NSLog(@"付款方式:货到付款");
    [_CashOnDeliveryBtn setBackgroundImage:[UIImage imageNamed:@"zhifufangshi_xuanzhong"] forState:UIControlStateNormal];
    _CashOnDeliveryBtn.layer.borderWidth = 0;
    _OnlinePayBtn.layer.borderWidth = 1;
    [_OnlinePayBtn setBackgroundImage:nil forState:UIControlStateNormal];
}

#pragma mark -提交订单
- (IBAction)submitOrder:(id)sender {
    NSLog(@"点击了提交订单");
}


- (IBAction)addLocation:(id)sender {
    NSLog(@"点击了添加地址");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
