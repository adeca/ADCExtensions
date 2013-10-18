//
//  UICollectionViewCell+ADC.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (ADC)

+ (instancetype)dequeueReusableCellFromCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;

@end
