//
//  EDYandexTestEx.m
//  Yandex
//
//  Created by Паша on 19.01.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import "EDYandexTestEx.h"


@implementation EDYandexTestEx

//первое задание

+ (void)asyncProcessData:(NSData *)data
                 success:(void(^)(UIImage *image))success
                 failure:(void(^)(NSError *failure))failure {
    
    UIImage *image = [UIImage imageWithData:data];
    
    if (image&&success) {
        success(image);
    } else
        failure([NSError errorWithDomain:@"" code:112 userInfo:nil]);
    
}

+ (UIImage *)syncProcessData:(NSData *)data {
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    __block UIImage *_image = nil;
    
    [self asyncProcessData:[NSData data] success:^(UIImage *image) {
        
        _image = image;
        
        dispatch_semaphore_signal(semaphore);
        
    } failure:^(NSError *failure) {
        
        dispatch_semaphore_signal(semaphore);
        
    }];
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    return _image;
    
}

//второе задание

+(void)processItem:(id)item
          revision:(NSInteger)revision
        completion:(void(^)(NSInteger newRevision))completion {
    
    if ([item respondsToSelector:@selector(appendString:)]) {
        [item appendString:@"."];
    }
    
    if (completion) {
        completion(revision+1);
    }
}

+(void)processItems:(NSArray *)items
           revision:(NSInteger)revision
         completion:(void(^)(NSInteger newRevision))completion {
    
    __weak typeof(self) wSelf = self;
    
    [self processItem:items[revision] revision:revision completion:^(NSInteger newRevision) {
        
        if (revision>=[items count]-1) {
            
            if (completion) {
                completion(0);
            }
            
        } else
            
            [wSelf processItems:items revision:newRevision completion:^(NSInteger newRevision_) {
                completion(newRevision_);
            }];
        
    }];
    
}

//четвертое задание

+ (void) downloadImageFromURL:(NSURL *)URL intoCell:(UITableViewCell *)cell {
    
    __block UIImage *image;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        image = [UIImage imageWithData:[NSData dataWithContentsOfURL:URL]];
        
        dispatch_async(dispatch_get_main_queue(), ^(void){
            
            if (cell) {
                
                [cell.imageView setImage:image];
            }
            
            
        });
        
    });
    
}


@end
