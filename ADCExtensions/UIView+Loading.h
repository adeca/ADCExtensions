//
//  UIView+Loading.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 2/27/15.
//  Copyright (c) 2015 Agustín de Cabrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Loading)

/*!
 Loads a nib, then finds and returns the first view that matches the current class.
 
 @param nibName     name of the nib file. Optional, pass a nil nib name to use the class name.
 @param bundle      bundle to load the view from. Optional, will use the main bundle by default.
 @result            A view object, instance of the current class.
 */
+ (id)viewFromNibName:(NSString*)nibName bundle:(NSBundle*)bundle;
+ (id)viewFromNibName:(NSString*)nibName; // uses the main bundle
+ (id)viewFromNib; // uses the main bundle, class name as nibName.

@end
