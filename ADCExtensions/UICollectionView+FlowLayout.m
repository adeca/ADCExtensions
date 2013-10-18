//
//  UICollectionView+FlowLayout.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "UICollectionView+FlowLayout.h"
#import "NSObject+Casting.h"

@implementation UICollectionView (FlowLayout)

- (UICollectionViewFlowLayout*)collectionViewFlowLayout
{
    return [self.collectionViewLayout asObjectOfClass:[UICollectionViewFlowLayout class]];
}
- (void)setCollectionViewFlowLayout:(UICollectionViewFlowLayout *)collectionViewFlowLayout
{
    self.collectionViewLayout = collectionViewFlowLayout;
}

@end
