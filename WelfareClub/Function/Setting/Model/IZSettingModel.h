//
//  IZSettingModel.h
//  Thief
//
//  Created by 鼎立华服 on 2018/12/19.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import "IZObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface IZSettingModel : IZObject

@property(nonatomic, copy, readonly) NSArray <NSArray <IZSettingModel *> *> *models;

/** title */
@property(nonatomic, copy, readonly) NSString *title;

/** subTitle */
@property(nonatomic, copy, readonly) NSString *subTitle;

@end

NS_ASSUME_NONNULL_END
