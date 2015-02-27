//
//  UIView+Loading.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 2/27/15.
//  Copyright (c) 2015 Agustín de Cabrera. All rights reserved.
//

#import "UIView+Loading.h"
#import "NSArray+Functional.h"

@implementation UIView (Loading)

#pragma mark -

+ (id)viewFromNibName:(NSString*)nibName bundle:(NSBundle*)bundle
{
    if (!nibName)
        nibName = NSStringFromClass(self);
    
    if (!bundle)
        bundle = [NSBundle mainBundle];
    
#if DEBUG == 1
    if (![bundle pathForResource:nibName ofType:@"nib"]) {
        NSLog(@"nib not found: '%@'", nibName);
        return nil;
    }
#endif
    
    NSArray *nibObjects = [bundle loadNibNamed:nibName owner:nil options:nil];
    id viewObject = [nibObjects match:^BOOL(id obj){
        return [obj isKindOfClass:self];
    }];
    
#if DEBUG == 1
    if (!viewObject) {
        NSLog(@"view of class '%@' not found in nib '%@'", self, nibName);
        return nil;
    }
#endif
    
    return viewObject;
}

+ (id)viewFromNibName:(NSString*)nibName
{
    return [self viewFromNibName:nibName bundle:nil];
}
+ (id)viewFromNib
{
    return [self viewFromNibName:nil bundle:nil];
}

@end
