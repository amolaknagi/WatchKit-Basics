//
//  HackathonInfoInterfaceController.h
//  Watch Basic Scrolling
//
//  Created by Amolak Nagi on 9/5/15.
//  Copyright © 2015 Amolak Nagi. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface HackathonInfoInterfaceController : WKInterfaceController

@property (strong, nonatomic) NSString *hackathon;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *hackathonImage;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *hackathonName;

@end
