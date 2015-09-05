//
//  InterfaceController.m
//  iPhone Watch Communication WatchKit Extension
//
//  Created by Amolak Nagi on 9/5/15.
//  Copyright © 2015 Amolak Nagi. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@property (nonatomic, strong) WCSession *watchSession;

@property (nonatomic) int count;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    if ([WCSession isSupported])
    {
        self.watchSession = [WCSession defaultSession];
        self.watchSession.delegate = self;
        [self.watchSession activateSession];
    }

    // Configure interface objects here.
}


- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message
{
    NSLog(@"Message Recieved on Watch");
    NSNumber *countNumber = message[@"count"];
    self.count = [countNumber intValue];
    [self.countLabel setText:[NSString stringWithFormat:@"%i",self.count]];
}

- (IBAction)userPressedUp
{
    self.count++;
    [self updateCounter];
}


- (IBAction)userPressedDown
{
    self.count--;
    [self updateCounter];

}

- (void)updateCounter
{
    if (self.watchSession.reachable)
    {
        NSLog(@"Phone is reachable");
    }
    else
    {
        NSLog(@"Phone is NOT reachable");
    }
    NSLog(@"Message sent to phone");

    [self.countLabel setText:[NSString stringWithFormat:@"%i",self.count]];
    NSDictionary *dictionary = @{@"count": [NSNumber numberWithInt:self.count]};
    [self.watchSession sendMessage:dictionary replyHandler:nil errorHandler:^(NSError *error) {
        if (error)
        {
            NSLog(@"Error");
        }
    }];
}

@end



