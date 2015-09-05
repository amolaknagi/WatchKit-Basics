//
//  ViewController.m
//  iPhone Watch Communication
//
//  Created by Amolak Nagi on 9/5/15.
//  Copyright © 2015 Amolak Nagi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) int count;
@property (nonatomic, strong) WCSession *watchSession;

@end

@implementation ViewController

- (void)viewDidLoad
{
    if ([WCSession isSupported])
    {
        NSLog(@"WCSession isSupported");
        self.watchSession = [WCSession defaultSession];
        self.watchSession.delegate = self;
        [self.watchSession activateSession];
    }
}

- (IBAction)userPressedUp:(id)sender
{
    
    self.count++;
    [self updateCounter];
}


- (IBAction)userPressedDown:(id)sender
{
    self.count--;
    [self updateCounter];
}


- (void)updateCounter
{
    [self.countLabel setText:[NSString stringWithFormat:@"%i",self.count]];
    
    NSDictionary *dictionary = @{@"count": [NSNumber numberWithInt:self.count]};
    [self.watchSession sendMessage:dictionary replyHandler:nil errorHandler:nil];
}

- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message
{
    dispatch_async(dispatch_get_main_queue(), ^(void){
        NSLog(@"Happened");
    });
    
    
    NSLog(@"Message Recieved on Phone");
    NSNumber *countNumber = message[@"count"];
    int count = [countNumber intValue];
    self.count = count;
    [self.countLabel setText:[NSString stringWithFormat:@"%i",count]];
        
}
@end
