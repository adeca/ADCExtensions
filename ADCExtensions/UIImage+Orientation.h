//
//  UIImage+Orientation.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Orientation)

- (UIImage*)imageWithOrientation:(UIImageOrientation)orientation;

- (UIImage*)verticallyMirroredImage;
- (UIImage*)horizontallyMirroredImage;

@end
