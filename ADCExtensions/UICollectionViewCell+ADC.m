//
//  UICollectionViewCell+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "UICollectionViewCell+ADC.h"
#import "NSObject+Casting.h"

@implementation UICollectionViewCell (ADC)

+ (instancetype)dequeueReusableCellFromCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = NSStringFromClass(self);
    return [[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath] asObjectOfClass:self];
}

@end
