//
//  UITableViewCell+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "UITableViewCell+ADC.h"
#import "NSObject+Casting.h"

@implementation UITableViewCell (ADC)

+ (instancetype)dequeueReusableCellFromTableView:(UITableView*)tableView
{
    NSString *identifier = NSStringFromClass(self);
    return [[tableView dequeueReusableCellWithIdentifier:identifier] asObjectOfClass:self];
}
+ (instancetype)dequeueReusableCellFromTableView:(UITableView*)tableView forIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = NSStringFromClass(self);
    return [[tableView dequeueReusableCellWithIdentifier:identifier
                                            forIndexPath:indexPath]
            asObjectOfClass:self];
}

@end
