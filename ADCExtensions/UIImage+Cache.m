//
//  UIImage+Cache.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "UIImage+Cache.h"

static NSCache *UIImageImagesCache()
{
    static NSCache *imagesCache = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        imagesCache = [[NSCache alloc] init];
    });
    
    return imagesCache;
}

@implementation UIImage (Cache)

+ (UIImage*)cachedImageForPath:(NSString*)path
{
    UIImage *cachedImage = [UIImageImagesCache() objectForKey:path];
    
    if (cachedImage)
        return cachedImage;
    
    cachedImage = [UIImage imageWithContentsOfFile:path];
    
    if (cachedImage)
        [UIImageImagesCache() setObject:cachedImage forKey:path];
    
    return cachedImage;
}

@end
