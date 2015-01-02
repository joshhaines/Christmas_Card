//
//  ViewController.h
//  Christmas Card
//
//  Created by Joshua Haines on 12/13/14.
//  Copyright (c) 2014 Joshua Haines. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NYCViewController.h"

@interface ViewController : UIViewController <NYCViewControllerDelegate>

- (IBAction)recognizer:(UISwipeGestureRecognizer *)sender;

@end

