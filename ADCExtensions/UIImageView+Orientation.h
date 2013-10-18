//
//  UIImageView+Orientation.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Orientation)

- (void)setImageOrientation:(UIImageOrientation)orientation;

- (void)mirrorVertically;
- (void)mirrorHorizontally;

@end
