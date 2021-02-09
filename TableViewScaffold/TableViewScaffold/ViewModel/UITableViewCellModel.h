//
//  UITableViewCellModel.h
//  TableViewScaffold
//
//  Created by 石显军 on 2021/2/8.
//

#import <UIKit/UIKit.h>
#import "UITableViewScaffoldEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCellModel : NSObject

@property (nonatomic, strong) NSString *reuseIdentifier;

@property (nonatomic, assign) ClassInitializationMode initializationMode;

@property (nonatomic, assign) CGFloat rowHeight;

@property (nonatomic, copy) void (^ tableViewDidSelectRowAtIndexPathCallback)(__kindof UITableViewCellModel *tableViewCellModel, NSIndexPath *indexPath);

@end

NS_ASSUME_NONNULL_END
