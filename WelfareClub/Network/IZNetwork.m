//
//  IZNetwork.m
//  Thief
//
//  Created by 鼎立华服 on 2018/12/19.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import "IZNetwork.h"
#import <DWNetworking.h>

@implementation IZNetwork

#pragma mark - 无参get请求带
+ (void)iz_getUrlString:(NSString *)urlString callback:(callback)callback {
    [self iz_getUrlString:urlString params:@{} callback:callback];
}

#pragma mark - 带参get请求
+ (void)iz_getUrlString:(NSString *)urlString params:(NSDictionary *)params callback:(callback)callback {
    [DWNetworking getUrlString:urlString params:params resultCallBack:^(id success, NSError *error, BOOL isCache) {
        if (!error && !isCache && success) {
            callback(success);
        }else {
            [[NSNotificationCenter defaultCenter] postNotificationName:iz_networkRequestFailure object:error];
        }
    }];
}

#pragma mark - post请求
+ (void)iz_postUrlString:(NSString *)urlString params:(NSDictionary *)params callback:(callback)callback {
    [DWNetworking postUrlString:urlString params:params resultCallBack:^(id success, NSError *error, BOOL isCache) {
        if (!error && !isCache && success) {
            callback(success);
        }else {
            [[NSNotificationCenter defaultCenter] postNotificationName:iz_networkRequestFailure object:error];
        }
    }];
}


@end
