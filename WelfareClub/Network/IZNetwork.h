//
//  IZNetwork.h
//  Thief
//
//  Created by 鼎立华服 on 2018/12/19.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IZNetwork : NSObject

/** 请求成功的block */
typedef void (^callback)(id success);

/**
 无参get请求
 
 @param urlString 请求地址
 @param callback 请求成功
 */
+ (void)iz_getUrlString:(NSString *)urlString callback:(callback)callback;

/**
 带参get请求
 
 @param urlString 请求地址
 @param params 请求参数
 @param callback 请求成功
 */
+ (void)iz_getUrlString:(NSString *)urlString params:(NSDictionary *)params callback:(callback)callback;

/**
 post请求
 
 @param urlString 请求地址
 @param params 请求参数
 @param callback 请求成功
 */
+ (void)iz_postUrlString:(NSString *)urlString params:(NSDictionary *)params callback:(callback)callback;

@end

NS_ASSUME_NONNULL_END
