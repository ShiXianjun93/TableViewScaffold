//
//  TableViewScaffold.m
//  TableViewScaffold
//
//  Created by 石显军 on 2021/2/8.
//

#import "UITableViewScaffold.h"

@interface UITableViewScaffold ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray<UITableViewSectionModel *> *arrSectionModels;

@end

@implementation UITableViewScaffold

+ (instancetype)tableViewScaffoldWithTableView:(UITableView *)tableView
                              arrSectionModels:(NSMutableArray<UITableViewSectionModel *> *)arrSectionModels
{
    UITableViewScaffold *scaffold = [UITableViewScaffold new];
    
    scaffold.arrSectionModels = arrSectionModels;
    
    scaffold.tableView      = tableView;
    tableView.dataSource    = scaffold;
    tableView.delegate      = scaffold;
    
    return scaffold;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arrSectionModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    UITableViewSectionModel *sectionModel = self.arrSectionModels[section];
    return sectionModel.arrCellModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewSectionModel *sectionModel = self.arrSectionModels[indexPath.section];
    UITableViewCellModel *cellModel = sectionModel.arrCellModels[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellModel.reuseIdentifier];
    
    SEL setModelSEL = NSSelectorFromString(@"setCellModel:");
    
    if ([cell respondsToSelector:setModelSEL]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        
        [cell performSelector:setModelSEL withObject:cellModel];
        
#pragma clang diagnostic pop
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewSectionModel *sectionModel = self.arrSectionModels[indexPath.section];
    UITableViewCellModel *cellModel = sectionModel.arrCellModels[indexPath.row];
    if (cellModel.tableViewDidSelectRowAtIndexPathCallback) {
        cellModel.tableViewDidSelectRowAtIndexPathCallback(cellModel, indexPath);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    UITableViewSectionModel *sectionModel = self.arrSectionModels[section];

    return sectionModel.tableHeaderViewModel.viewHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    UITableViewSectionModel *sectionModel = self.arrSectionModels[section];

    return sectionModel.tableFooterViewModel.viewHeight;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewSectionModel *sectionModel = self.arrSectionModels[section];
    sectionModel.sectionIndex = section;

    if (sectionModel.tableHeaderViewModel.reuseIdentifier) {

        UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionModel.tableHeaderViewModel.reuseIdentifier];

        SEL setModelSEL = NSSelectorFromString(@"setHeaderModel:");

        if ([headerView respondsToSelector:setModelSEL]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

            [headerView performSelector:setModelSEL withObject:sectionModel.tableHeaderViewModel];

#pragma clang diagnostic pop

            return headerView;
        }
    }
    return nil;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewSectionModel *sectionModel = self.arrSectionModels[section];
    sectionModel.sectionIndex = section;

    if (sectionModel.tableFooterViewModel.reuseIdentifier) {

        UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionModel.tableFooterViewModel.reuseIdentifier];

        SEL setModelSEL = NSSelectorFromString(@"setFooterModel:");

        if ([headerView respondsToSelector:setModelSEL]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

            [headerView performSelector:setModelSEL withObject:sectionModel.tableFooterViewModel];

#pragma clang diagnostic pop

            return headerView;
        }
    }
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewSectionModel *sectionModel = self.arrSectionModels[indexPath.section];
    UITableViewCellModel *cellModel = sectionModel.arrCellModels[indexPath.row];
    return cellModel.rowHeight;
}

@end
