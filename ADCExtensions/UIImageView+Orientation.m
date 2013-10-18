//
//  UIImageView+Orientation.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "UIImageView+Orientation.h"
#import "UIImage+Orientation.h"

@implementation UIImageView (Orientation)

- (void)setImageOrientation:(UIImageOrientation)orientation
{
    self.image = [self.image imageWithOrientation:orientation];
}

- (void)mirrorVertically
{
    self.image = [self.image verticallyMirroredImage];
}
- (void)mirrorHorizontally
{
    self.image = [self.image horizontallyMirroredImage];
}

@end
