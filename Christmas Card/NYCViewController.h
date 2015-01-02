//
//  NYCViewController.h
//  Christmas Card
//
//  Created by Joshua Haines on 12/13/14.
//  Copyright (c) 2014 Joshua Haines. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextViewController.h"

@protocol NYCViewControllerDelegate <NSObject>

@required
-(void)didSwipeRight;

@end

@interface NYCViewController : UIViewController <TextViewControllerDelegate>
@property (weak, nonatomic) id <NYCViewControllerDelegate> delegate;
- (IBAction)rightRecognizer:(UISwipeGestureRecognizer *)sender;

@end
