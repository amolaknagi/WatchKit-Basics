//
//  WatchTableInterfaceController.m
//  Watch Basic Scrolling
//
//  Created by Amolak Nagi on 9/4/15.
//  Copyright © 2015 Amolak Nagi. All rights reserved.
//

#import "WatchTableInterfaceController.h"
#import "WatchTableRow.h"
#import "HackathonInfoInterfaceController.h"

@interface WatchTableInterfaceController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *watchTable;
@property (strong, nonatomic) NSArray *hackathons;

@end

@implementation WatchTableInterfaceController


#pragma mark - View Initialization

- (void)willActivate
{
    [self loadData];

    [self loadWatchTable];
    
}

- (void)loadData
{
    self.hackathons = @[@"HackMIT",
                        @"PennApps",
                        @"TartanHacks"];
}

- (void)loadWatchTable
{
    [self.watchTable setNumberOfRows:3 withRowType:@"hackathonRow"];
    
    for (int i = 0; i < self.hackathons.count; i++)
    {
        WatchTableRow *row = [self.watchTable rowControllerAtIndex:i];
        
        NSString *hackathon = self.hackathons[i];
        [row.label setText:hackathon];
        [row.image setImageNamed:hackathon];
    }
}


- (id)contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex
{
    NSMutableDictionary *properties = [NSMutableDictionary dictionary];
    
    if ([segueIdentifier isEqualToString:@"pushHackathon"] &&
        table == self.watchTable)
    {
        NSLog(@"Pushed Hackathon");
        NSString *hackathon = self.hackathons[rowIndex];
        [properties setObject:hackathon forKey:@"hackathon"];
    }
    
    return properties;
}








#pragma mark - User Interaction


- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    NSLog(@"Selected Row");
}

@end



