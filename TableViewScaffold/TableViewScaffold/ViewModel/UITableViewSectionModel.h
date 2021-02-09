//
//  UITableViewSectionModel.h
//  TableViewScaffold
//
//  Created by 石显军 on 2021/2/8.
//

#import <UIKit/UIKit.h>
#import "UITableViewCellModel.h"
#import "UITableViewHeaderFooterViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewSectionModel : NSObject

@property (nonatomic, strong) UITableViewHeaderFooterViewModel *tableHeaderViewModel;

@property (nonatomic, strong) NSMutableArray<UITableViewCellModel *> *arrCellModels;

@property (nonatomic, strong) UITableViewHeaderFooterViewModel *tableFooterViewModel;

@property (nonatomic, assign) NSInteger sectionIndex;

@end

NS_ASSUME_NONNULL_END
