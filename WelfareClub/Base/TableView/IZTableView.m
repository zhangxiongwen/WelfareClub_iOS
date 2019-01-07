//
//  IZTableView.m
//  Thief
//
//  Created by iizvv on 2018/12/19.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import "IZTableView.h"

@interface IZTableView ()<QMUITableViewDelegate, QMUITableViewDataSource>

@end

@implementation IZTableView

- (void)setIz_delegate:(id<IZTableViewDelegate>)iz_delegate {
    _iz_delegate = iz_delegate;
    if (iz_delegate) {
        self.dataSource = self;
        self.delegate = self;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.iz_delegate iz_numberOfSectionsInTableView:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.iz_delegate iz_tableView:tableView numberOfRowsInSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.iz_delegate iz_tableView:tableView cellForRowAtIndexPath:indexPath];
}


@end
