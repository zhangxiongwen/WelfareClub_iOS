//
//  IZTableView.h
//  Thief
//
//  Created by iizvv on 2018/12/19.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import "QMUITableView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol IZTableViewDelegate <NSObject>

@required

- (NSInteger)iz_numberOfSectionsInTableView:(UITableView *)tableView;

- (NSInteger)iz_tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

- (UITableViewCell *)iz_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface IZTableView : QMUITableView

@property(nonatomic, assign) id <IZTableViewDelegate> iz_delegate;

@end

NS_ASSUME_NONNULL_END
