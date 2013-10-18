//
//  UIImage+Orientation.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "UIImage+Orientation.h"

/**
 UIImageOrientationUp,            // default orientation
 UIImageOrientationDown,          // 180 deg rotation
 UIImageOrientationLeft,          // 90 deg CCW
 UIImageOrientationRight,         // 90 deg CW
 UIImageOrientationUpMirrored,    // as above but image mirrored along other axis. horizontal flip
 UIImageOrientationDownMirrored,  // horizontal flip
 UIImageOrientationLeftMirrored,  // vertical flip
 UIImageOrientationRightMirrored, // vertical flip
 */
static UIImageOrientation verticallyMirroredOrientation(UIImageOrientation orientation)
{
    switch (orientation)
    {
        case UIImageOrientationUp:            return UIImageOrientationDownMirrored;
        case UIImageOrientationDown:          return UIImageOrientationUpMirrored;
        case UIImageOrientationLeft:          return UIImageOrientationLeftMirrored;
        case UIImageOrientationRight:         return UIImageOrientationRightMirrored;
        case UIImageOrientationUpMirrored:    return UIImageOrientationDown;
        case UIImageOrientationDownMirrored:  return UIImageOrientationUp;
        case UIImageOrientationLeftMirrored:  return UIImageOrientationLeft;
        case UIImageOrientationRightMirrored: return UIImageOrientationRight;
    }
}
static UIImageOrientation horizontallyMirroredOrientation(UIImageOrientation orientation)
{
    switch (orientation)
    {
        case UIImageOrientationUp:            return UIImageOrientationUpMirrored;
        case UIImageOrientationDown:          return UIImageOrientationDownMirrored;
        case UIImageOrientationLeft:          return UIImageOrientationRightMirrored;
        case UIImageOrientationRight:         return UIImageOrientationLeftMirrored;
        case UIImageOrientationUpMirrored:    return UIImageOrientationUp;
        case UIImageOrientationDownMirrored:  return UIImageOrientationDown;
        case UIImageOrientationLeftMirrored:  return UIImageOrientationRight;
        case UIImageOrientationRightMirrored: return UIImageOrientationLeft;
    }
}

@implementation UIImage (Orientation)

- (UIImage*)imageWithOrientation:(UIImageOrientation)orientation
{
    return [UIImage imageWithCGImage:self.CGImage
                               scale:self.scale
                         orientation:orientation];
}

- (UIImage*)verticallyMirroredImage
{
    return [self imageWithOrientation:verticallyMirroredOrientation(self.imageOrientation)];
}
- (UIImage*)horizontallyMirroredImage
{
    return [self imageWithOrientation:horizontallyMirroredOrientation(self.imageOrientation)];
}

@end
