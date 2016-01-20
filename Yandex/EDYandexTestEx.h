//
//  EDYandexTestEx.h
//  Yandex
//
//  Created by Паша on 19.01.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EDYandexTestEx : NSObject

//В этом классе описаны задания №1, №2, №4.
//Три теста для задания №2 (Задание №3) описано в папке YandexTests\ThirdEx
//Шестое задание в файле YandexTestsSixthExTest.m

//1
+ (UIImage *)syncProcessData:(NSData *)data;

//2
+(void)processItems:(NSArray *)items
           revision:(NSInteger)revision
         completion:(void(^)(NSInteger newRevision))completion;
//4
+ (void) downloadImageFromURL:(NSURL *)URL intoCell:(UITableViewCell *)cell;

@end
