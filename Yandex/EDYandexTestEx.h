//
//  EDYandexTestEx.h
//  Yandex
//
//  Created by Паша on 19.01.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDYandexTestEx : NSObject

+(void)processItems:(NSArray *)items
           revision:(NSInteger)revision
         completion:(void(^)(NSInteger newRevision))completion;

@end
