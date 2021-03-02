//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSizeChar:(enum PizzaSizeChar)size toppings:(NSArray *)toppings;
{
    Pizza *pizza = [[Pizza alloc] initWithSizeChar:size AndToppings:toppings];
    NSString *pizzaSize = [pizza getPizzaSizeWith:size];
    if (pizzaSize == nil) {
        NSLog(@"Size is invalid, please select again.");
    } else {
        NSLog(@"Your order has been submitted....");
        NSLog(@"selected size: <%@>", pizzaSize);
        NSLog(@"selected toppings: %@", toppings);
    }
    return pizza;
}

@end
