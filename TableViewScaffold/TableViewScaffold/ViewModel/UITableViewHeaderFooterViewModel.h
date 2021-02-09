//
//  UITableViewHeaderFooterViewModel.h
//  TableViewScaffold
//
//  Created by 石显军 on 2021/2/8.
//

#import <UIKit/UIKit.h>
#import "UITableViewScaffoldEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewHeaderFooterViewModel : NSObject

@property (nonatomic, strong) NSString *reuseIdentifier;

@property (nonatomic, assign) ClassInitializationMode initializationMode;

@property (nonatomic, assign) CGFloat viewHeight;

@end

NS_ASSUME_NONNULL_END
