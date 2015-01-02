//
//  TextViewController.h
//  Christmas Card
//
//  Created by Joshua Haines on 12/13/14.
//  Copyright (c) 2014 Joshua Haines. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PandaViewController.h"

@protocol TextViewControllerDelegate <NSObject>

@required
-(void)didSwipe;

@end

@interface TextViewController : UIViewController <PandaViewControllerDelegate>
@property (weak, nonatomic) id <TextViewControllerDelegate> delegate;
- (IBAction)recognizer:(UISwipeGestureRecognizer *)sender;

@end
