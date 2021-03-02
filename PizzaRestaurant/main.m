//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"
#import "Pizza.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // sample input: s ham pepperoni olieves
        NSLog(@"Please pick your pizza size and toppings:");
        NSLog(@"Input example: one of the size { S: Small, M: Medium, L: Large }");
        NSLog(@"And any toppings you want! (e.g. Ham Pepperoni Olieves)");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        
        while (TRUE) {
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            if([[inputString lowercaseString] isEqualToString:@"q"]) { break; }
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            
            // And then send some message to the kitchen...
            NSString *pizzaSize = [NSString stringWithString:[commandWords objectAtIndex:0]];
            char sizeChar = [[pizzaSize lowercaseString] characterAtIndex:0];
            NSArray *toppings = [commandWords subarrayWithRange: NSMakeRange(1, [commandWords count]-1)];
            [restaurantKitchen makePizzaWithCharSize:sizeChar toppings:toppings];
        }

    }
    return 0;
}

