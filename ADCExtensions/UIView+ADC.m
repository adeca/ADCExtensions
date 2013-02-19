//
//  UIView+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "UIView+ADC.h"

@implementation UIView (ADC)

-(CGFloat)frameX        { return self.frame.origin.x; }
-(CGFloat)frameY        { return self.frame.origin.y; }
-(CGFloat)frameWidth    { return self.frame.size.width; }
-(CGFloat)frameHeight   { return self.frame.size.height; }
-(CGSize)frameSize      { return self.frame.size; }
-(CGPoint)frameOrigin   { return self.frame.origin; }

-(void)setFrameX:(CGFloat)x
{
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}
-(void)setFrameY:(CGFloat)y
{
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}
-(void)setFrameWidth:(CGFloat)width
{
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}
-(void)setFrameHeight:(CGFloat)height
{
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}
-(void)setFrameSize:(CGSize)size
{
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}
-(void)setFrameOrigin:(CGPoint)origin
{
    CGRect rect = self.frame;
    rect.origin = origin;
    self.frame = rect;
}

-(CGFloat)centerX   { return self.center.x; }
-(CGFloat)centerY   { return self.center.y; }

-(void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}
-(void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

-(CGFloat)frameMaxX     { return CGRectGetMaxX(self.frame); }
-(CGFloat)frameMaxY     { return CGRectGetMaxY(self.frame); }

@end
