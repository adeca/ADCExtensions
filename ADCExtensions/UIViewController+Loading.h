//
//  UIViewController+Loading.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 2/27/15.
//  Copyright (c) 2015 Agustín de Cabrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Loading)

+ (id)viewControllerWithIdentifier:(NSString*)identifier inStoryboard:(UIStoryboard*)storyboard;
+ (instancetype)viewControllerInStoryboard:(UIStoryboard*)storyboard; // use class name as identifier

+ (id)viewControllerWithIdentifier:(NSString*)identifier inStoryboardNamed:(NSString*)storyboardName;
+ (instancetype)viewControllerInStoryboardNamed:(NSString*)storyboardName; // use class name as identifier

@end
