//
//  UIViewController+Loading.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 2/27/15.
//  Copyright (c) 2015 Agustín de Cabrera. All rights reserved.
//

#import "UIViewController+Loading.h"
#import "NSObject+Casting.h"

@implementation UIViewController (Loading)

+ (instancetype)viewControllerInStoryboard:(UIStoryboard*)storyboard
{
    return [[self viewControllerWithIdentifier:nil inStoryboard:storyboard] asObjectOfClass:self];
}
+ (id)viewControllerWithIdentifier:(NSString*)identifier inStoryboard:(UIStoryboard*)storyboard
{
    if (!identifier)
        identifier = NSStringFromClass(self);
    
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}

+ (instancetype)viewControllerInStoryboardNamed:(NSString*)storyboardName
{
    return [[self viewControllerWithIdentifier:nil inStoryboardNamed:storyboardName] asObjectOfClass:self];
}
+ (id)viewControllerWithIdentifier:(NSString*)identifier inStoryboardNamed:(NSString*)storyboardName
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [self viewControllerWithIdentifier:identifier inStoryboard:storyboard];
}

@end
