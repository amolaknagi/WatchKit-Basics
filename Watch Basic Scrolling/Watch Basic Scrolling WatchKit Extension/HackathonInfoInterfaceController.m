//
//  HackathonInfoInterfaceController.m
//  Watch Basic Scrolling
//
//  Created by Amolak Nagi on 9/5/15.
//  Copyright © 2015 Amolak Nagi. All rights reserved.
//

#import "HackathonInfoInterfaceController.h"

@interface HackathonInfoInterfaceController ()

@end

@implementation HackathonInfoInterfaceController

- (void)awakeWithContext:(id)context
{
    [super awakeWithContext:context];
    
    NSDictionary *values = (NSDictionary *)context;
    
    self.hackathon = values[@"hackathon"];
    
    [self.hackathonImage setImageNamed:self.hackathon];
    [self.hackathonName setText:self.hackathon];
    
}


@end



