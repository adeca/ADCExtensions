//
//  UITableViewCell+ADC.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (ADC)

+ (instancetype)dequeueReusableCellFromTableView:(UITableView*)tableView;
+ (instancetype)dequeueReusableCellFromTableView:(UITableView*)tableView forIndexPath:(NSIndexPath *)indexPath;

@end
