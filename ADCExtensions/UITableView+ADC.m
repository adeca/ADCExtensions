//
//  UITableView+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "UITableView+ADC.h"

@implementation UITableView (ADC)

- (void)insertSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self insertSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:animation];
}
- (void)deleteSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self deleteSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:animation];
}
- (void)reloadSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:animation];
}

@end
