//
//  WatchTableRow.h
//  Watch Basic Scrolling
//
//  Created by Amolak Nagi on 9/5/15.
//  Copyright © 2015 Amolak Nagi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface WatchTableRow : NSObject

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *image;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label;

@end
