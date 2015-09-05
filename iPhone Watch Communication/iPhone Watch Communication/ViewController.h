//
//  ViewController.h
//  iPhone Watch Communication
//
//  Created by Amolak Nagi on 9/5/15.
//  Copyright © 2015 Amolak Nagi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WatchConnectivity/WatchConnectivity.h>

@interface ViewController : UIViewController <WCSessionDelegate>

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

