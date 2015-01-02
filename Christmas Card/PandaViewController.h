//
//  PandaViewController.h
//  Christmas Card
//
//  Created by Joshua Haines on 12/20/14.
//  Copyright (c) 2014 Joshua Haines. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DifficultyViewController.h"

#define HIGH_SCORE @"high score"
#define DIFFICULTY_LEVEL @"difficulty level"
#define HIGH_SCORE_ARRAY @"high score array"

@protocol PandaViewControllerDelegate <NSObject>

@required
-(void)didPressDone;

@end

@interface PandaViewController : UIViewController <DifficultyViewControllerDelegate>
@property (weak, nonatomic) id <PandaViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) IBOutlet UIButton *panda1Button;
@property (strong, nonatomic) IBOutlet UIButton *panda2Button;
@property (strong, nonatomic) IBOutlet UIButton *panda3Button;
@property (strong, nonatomic) IBOutlet UIButton *panda4Button;
@property (strong, nonatomic) IBOutlet UIButton *panda5Button;
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) NSMutableArray *buttonArray;
@property (strong, nonatomic) NSMutableArray *modifierArray;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) IBOutlet UILabel *highScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *button1TimeModifierLabel;
@property (strong, nonatomic) IBOutlet UILabel *button2TimeModifierLabel;
@property (strong, nonatomic) IBOutlet UILabel *button3TimeModifierLabel;
@property (strong, nonatomic) IBOutlet UILabel *button4TimeModifierLabel;
@property (strong, nonatomic) IBOutlet UILabel *button5TimeModifierLabel;
@property (strong, nonatomic) IBOutlet UIButton *difficultyButton;
@property (strong, nonatomic) NSNumber *difficulty;
@property (strong, nonatomic) NSMutableArray *highScoreArray;
- (IBAction)panda1ButtonPressed:(UIButton *)sender;
- (IBAction)panda2ButtonPressed:(UIButton *)sender;
- (IBAction)panda3ButtonPressed:(UIButton *)sender;
- (IBAction)panda4ButtonPressed:(UIButton *)sender;
- (IBAction)panda5ButtonPressed:(UIButton *)sender;
- (IBAction)startButtonPressed:(UIButton *)sender;
- (IBAction)doneButtonPressed:(UIButton *)sender;
- (IBAction)difficultyButtonPressed:(UIButton *)sender;

@end
