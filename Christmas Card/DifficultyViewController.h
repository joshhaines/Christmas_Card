//
//  DifficultyViewController.h
//  Christmas Card
//
//  Created by Joshua Haines on 12/28/14.
//  Copyright (c) 2014 Joshua Haines. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DifficultyViewControllerDelegate <NSObject>

@required
-(void)didSave:(NSNumber*)difficulty;
-(void)didCancel;

@end

@interface DifficultyViewController : UIViewController
@property (weak, nonatomic) id <DifficultyViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UISegmentedControl *difficultySegmentedControl;
@property (strong, nonatomic) NSNumber *difficulty;
- (IBAction)saveButtonPressed:(UIButton *)sender;
- (IBAction)cancelButtonPressed:(UIButton *)sender;

@end
