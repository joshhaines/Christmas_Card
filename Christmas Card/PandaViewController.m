//
//  PandaViewController.m
//  Christmas Card
//
//  Created by Joshua Haines on 12/20/14.
//  Copyright (c) 2014 Joshua Haines. All rights reserved.
//

#import "PandaViewController.h"
#import <stdlib.h>

@interface PandaViewController ()

@end

@implementation PandaViewController

float seconds;
float gameSeconds = 10;
float positiveModifier;
float negativeModifier;
int pandaLocation;
int score;
int gameOn;
int numberOfSquirrels;
int squirrelLocation;
int highScore;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create an Array that holds the game buttons
    self.buttonArray = [[NSMutableArray alloc] initWithObjects:self.panda1Button, self.panda2Button, self.panda3Button, self.panda4Button, self.panda5Button, nil];
    self.modifierArray = [[NSMutableArray alloc] initWithObjects:self.button1TimeModifierLabel, self.button2TimeModifierLabel, self.button3TimeModifierLabel, self.button4TimeModifierLabel, self.button5TimeModifierLabel, nil];
    
    // Initialize the game score to 0
    score = 0;
    
    // The game is only running when gameOn equals 1. It starts at 0 so that the player needs to press "Start!" to start the game.
    gameOn = 0;
    
    // The game will run for how many seconds?
    seconds = gameSeconds;
    
    // Initialize the timer and score labels
    self.timerLabel.text = [NSString stringWithFormat:@"%.1f", seconds];
    self.scoreLabel.text = @"0";
    
    [self initializeModifierLabels];
    
    // Get the stored difficulty
    self.difficulty = [[NSUserDefaults standardUserDefaults] objectForKey:DIFFICULTY_LEVEL];
    
    // Set the default difficulty to Medium if there is no stored difficulty
    if (!self.difficulty) {
        self.difficulty = @(1);
    }
    
    [self determineDifficulty];
    
    // Get all saved high scores
    NSArray *arrayOfHighScores = [[NSUserDefaults standardUserDefaults] objectForKey:HIGH_SCORE_ARRAY];
    self.highScoreArray = [arrayOfHighScores mutableCopy];
    
    // If no saved high scores exist, initialize them to zero
    if (!self.highScoreArray) {
        self.highScoreArray = [[NSMutableArray alloc] initWithObjects:@(0), @(0), @(0), @(0), @(0), nil];
    }
    
    // Get the high score for the selected difficulty
    highScore = [self.highScoreArray[[self.difficulty intValue]] intValue];
    
    // Set the high score label
    self.highScoreLabel.text = [NSString stringWithFormat:@"%i", highScore];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - Button Methods

- (IBAction)panda1ButtonPressed:(UIButton *)sender {
    // If the game is running
    if (gameOn == 1) {
        // If this button is currently where the panda is located
        if (pandaLocation == 0) {
            [self displayModifier:positiveModifier withUserLocation:0];
            [self updateScore:1];
            [self clearButtons];
            [self updatePandaButton];
            [self createSquirrels];
            [self modifyTime:positiveModifier];
        }
        // If the panda is not at this location
        else {
            [self displayModifier:negativeModifier withUserLocation:0];
            [self updateScore:-1];
            [self clearButtons];
            [self updatePandaButton];
            [self createSquirrels];
            [self modifyTime:negativeModifier];
        }
    }
}

- (IBAction)panda2ButtonPressed:(UIButton *)sender {
    // If the game is running
    if (gameOn == 1) {
        // If this button is currently where the panda is located
        if (pandaLocation == 1) {
            [self displayModifier:positiveModifier withUserLocation:1];
            [self updateScore:1];
            [self clearButtons];
            [self updatePandaButton];
            [self createSquirrels];
            [self modifyTime:positiveModifier];
        }
        // If the panda is not at this location
        else {
            [self displayModifier:negativeModifier withUserLocation:1];
            [self updateScore:-1];
            [self clearButtons];
            [self updatePandaButton];
            [self createSquirrels];
            [self modifyTime:negativeModifier];
        }
    }
}

- (IBAction)panda3ButtonPressed:(UIButton *)sender {
    // If the game is running
    if (gameOn == 1) {
        // If this button is currently where the panda is located
        if (pandaLocation == 2) {
            [self displayModifier:positiveModifier withUserLocation:2];
            [self updateScore:1];
            [self clearButtons];
            [self updatePandaButton];
            [self createSquirrels];
            [self modifyTime:positiveModifier];
        }
        // If the panda is not at this location
        else {
            [self displayModifier:negativeModifier withUserLocation:2];
            [self updateScore:-1];
            [self clearButtons];
            [self updatePandaButton];
            [self createSquirrels];
            [self modifyTime:negativeModifier];
        }
    }
}

- (IBAction)panda4ButtonPressed:(UIButton *)sender {
    // If the game is running
    if (gameOn == 1) {
        // If this button is currently where the panda is located
        if (pandaLocation == 3) {
            [self displayModifier:positiveModifier withUserLocation:3];
            [self updateScore:1];
            [self clearButtons];
            [self updatePandaButton];
            [self createSquirrels];
            [self modifyTime:positiveModifier];
        }
        // If the panda is not at this location
        else {
            [self displayModifier:negativeModifier withUserLocation:3];
            [self updateScore:-1];
            [self clearButtons];
            [self updatePandaButton];
            [self createSquirrels];
            [self modifyTime:negativeModifier];
        }
    }
}

- (IBAction)panda5ButtonPressed:(UIButton *)sender {
    // If the game is running
    if (gameOn == 1) {
        // If this button is currently where the panda is located
        if (pandaLocation == 4) {
            [self displayModifier:positiveModifier withUserLocation:4];
            [self updateScore:1];
            [self clearButtons];
            [self updatePandaButton];
            [self createSquirrels];
            [self modifyTime:positiveModifier];
        }
        // If the panda is not at this location
        else {
            [self displayModifier:negativeModifier withUserLocation:4];
            [self updateScore:-1];
            [self clearButtons];
            [self updatePandaButton];
            [self createSquirrels];
            [self modifyTime:negativeModifier];
        }
    }
}

- (IBAction)startButtonPressed:(UIButton *)sender {
    // If the game is not currently running
    if (gameOn == 0) {
        // Clear the buttons just in case
        [self clearButtons];
        
        // Reset the score to 0
        self.scoreLabel.textColor = [UIColor blackColor];
        score = 0;
        
        // Turn the game on
        gameOn = 1;
        
        // Change the title of the start button to "Stop!"
        [self.startButton setTitle:@"Stop!" forState:UIControlStateNormal];
        
        // Initialize the panda's location witha random integer between 0 and 4
        pandaLocation = arc4random_uniform(5);
        
        // Get the button located in the button array for the panda's location, and set the image to the "panda head.jpg"
        UIButton *pandaButton = self.buttonArray[pandaLocation];
        [pandaButton setImage:[UIImage imageNamed:@"panda head.jpg"] forState:UIControlStateNormal];
        
        [self createSquirrels];
        
        // Update the timer and score labels with their initial values
        self.timerLabel.text = [NSString stringWithFormat:@"%.1f", seconds];
        self.scoreLabel.text = [NSString stringWithFormat:@"%i", score];
        
        // Start the timer
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerMethod:) userInfo:nil repeats:YES];
    }
    // If the start button says "Stop!" and is pressed
    else {
        // Set the title back to "Start!"
        [self.startButton setTitle:@"Start!" forState:UIControlStateNormal];
        
        // Stop the timer
        [self.timer invalidate];
        self.timer = nil;
        
        // Set the timer back to its initial value
        seconds = gameSeconds;
        
        // Stop the game
        gameOn = 0;
        
        [self updateHighScore];
        [self clearButtons];
    }
}

- (IBAction)doneButtonPressed:(UIButton *)sender {
    // Call the delegate method, which dismisses this view.
    [self.delegate didPressDone];
}

- (IBAction)difficultyButtonPressed:(UIButton *)sender {
}

#pragma mark - Timer Methods

-(void)timerMethod:(NSTimer *)timer
{
    if (seconds > 0.1) {
        // Subtract 0.1 of a second during each tick of the timer
        seconds = seconds - 0.1;
        self.timerLabel.text = [NSString stringWithFormat:@"%.1f", seconds];
    }
    else {
        // Set seconds to 0.0 so that it doesn't display some fractional or negative value besides zero
        seconds = 0.0;
        
        // Update the timer label
        self.timerLabel.text = [NSString stringWithFormat:@"%.1f", seconds];
        
        // Set the start button back to "Start!"
        [self.startButton setTitle:@"Start!" forState:UIControlStateNormal];
        
        // Stop the timer
        [self.timer invalidate];
        self.timer = nil;
        
        // Set seconds back to its initial value
        seconds = gameSeconds;
        
        // Turn the game off
        gameOn = 0;
        
        [self updateHighScore];
        [self clearButtons];
    }
}

#pragma mark - Helper Methods

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[DifficultyViewController class]]) {
        DifficultyViewController *nextViewController = segue.destinationViewController;
        nextViewController.difficulty = self.difficulty;
        nextViewController.delegate = self;
        
        if (gameOn == 1) {
            // Set the title back to "Start!"
            [self.startButton setTitle:@"Start!" forState:UIControlStateNormal];
            
            // Stop the timer
            [self.timer invalidate];
            self.timer = nil;
            
            // Set the timer back to its initial value
            seconds = gameSeconds;
            
            // Stop the game
            gameOn = 0;
            
            [self updateHighScore];
            [self clearButtons];
        }
    }
}

-(void)updatePandaButton
{
    // Get the current panda location and save it
    int oldPandaLocation = pandaLocation;
    
    // Get a new panda location so that it is not the same as the last location
    while (oldPandaLocation == pandaLocation) {
        pandaLocation = arc4random_uniform(5);
    }
    
    // Update the image on the button to be the panda head
    UIButton *pandaButton = self.buttonArray[pandaLocation];
    [pandaButton setImage:[UIImage imageNamed:@"panda head.jpg"] forState:UIControlStateNormal];
}

-(void)createSquirrels
{
    // Randomly pick a number of squirrels between 0 and 2
    numberOfSquirrels = arc4random_uniform(3);
    
    // Initialize the old squirrel location to -1 so that it is invalid for the first run through the following loop
    int oldSquirrelLocation = -1;
    
    // Randomly place a squirrel on the board for each count in numberOfSquirrels
    for (int i = 0; i < numberOfSquirrels; i++) {
        squirrelLocation = arc4random_uniform(5);
        
        // Get a new squirrel location so that it doesn't match the panda location or another squirrel location
        while (squirrelLocation == pandaLocation || squirrelLocation == oldSquirrelLocation) {
            squirrelLocation = arc4random_uniform(5);
        }
        
        // Set the button to "Aspect Fit" content mode so that the squirrel head is not stretched
        UIButton *squirrelButton = self.buttonArray[squirrelLocation];
        [squirrelButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        
        // Set the button image to the squirrel head
        [squirrelButton setImage:[UIImage imageNamed:@"squirrel-head-md.png"] forState:UIControlStateNormal];
        
        // Set the current squirrel location to the old squirrel location (note this only works for up to two squirrels)
        oldSquirrelLocation = squirrelLocation;
    }
}

-(void)clearButtons{
    for (int i = 0; i < 5; i++) {
        UIButton *button = self.buttonArray[i];
        
        // Set the content mode back to "Scale to Fill"
        [button.imageView setContentMode:UIViewContentModeScaleToFill];
        
        // Set the button image back to the gray circle
        [button setImage:[UIImage imageNamed:@"circle-512.jpg"] forState:UIControlStateNormal];
    }
}

-(void)updateScore:(int)modifier
{
    // Update the score by adding the modifier
    score = score + modifier;
    
    // If the score is less than 0 it will be red
    if (score < 0) {
        self.scoreLabel.textColor = [UIColor redColor];
    }
    else {
        self.scoreLabel.textColor = [UIColor blackColor];
    }
    
    // Update the score label
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", score];
}

-(void)updateHighScore
{
    // Check if the current score is greater than the stored high score, and update the high score.
    if (score > highScore) {
        highScore = score;
        self.highScoreLabel.text = [NSString stringWithFormat:@"%i", highScore];
        
        self.highScoreArray[[self.difficulty intValue]] = [NSNumber numberWithInt:highScore];
        
        
        [[NSUserDefaults standardUserDefaults] setObject:self.highScoreArray forKey:HIGH_SCORE_ARRAY];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

-(void)modifyTime:(float)modifier
{
    // Add the modifier to the seconds
    seconds = seconds + modifier;
    
    //Update timer label
    if (seconds > 0) {
        self.timerLabel.text = [NSString stringWithFormat:@"%.1f", seconds];
    }
    else {
        // If timer label is 0 or below, set the seconds to 0.0 to avoid any negative value
        seconds = 0.0;
        
        // Update the timer label
        self.timerLabel.text = [NSString stringWithFormat:@"%.1f", seconds];
        
        // Stop the timer
        [self.timer invalidate];
        self.timer = nil;
        
        // Set the start button back to "Start!"
        [self.startButton setTitle:@"Start!" forState:UIControlStateNormal];
        
        // Set the timer back to its initial value
        seconds = gameSeconds;
        
        // Stop the game
        gameOn = 0;
        
        [self updateHighScore];
        [self clearButtons];
    }
}

-(void)initializeModifierLabels
{
    // Make all modifier labels invisible
    for (int i = 0; i < 5; i++) {
        UILabel *buttonModifierLabel = self.modifierArray[i];
        buttonModifierLabel.alpha = 0;
    }
}

-(void)displayModifier:(float)modifier withUserLocation:(int)userLocation
{
    // If the modifier has a positive value
    if (modifier > 0) {
        // Get the modifier label that is associated with the button that the user pressed
        UILabel *buttonModifierLabel = self.modifierArray[userLocation];
        
        // Set the modifier label text - color is green for a positive value
        buttonModifierLabel.textColor = [UIColor colorWithRed:32/255.0 green:156/255.0 blue:0 alpha:1];
        buttonModifierLabel.alpha = 1;
        buttonModifierLabel.text = [NSString stringWithFormat:@"+%.1f s", modifier];
        
        // Animate the modifier label so that it fades out over 1 second
        [UIView animateWithDuration:1.0 animations:^{buttonModifierLabel.alpha = 0;}];
    }
    // Else if the modifier has a negative value
    else {
        // Get the modifier label that is associated with the button that the user pressed
        UILabel *buttonModifierLabel = self.modifierArray[userLocation];
        
        // Set the modifier label text - color is red for a negative value
        buttonModifierLabel.textColor = [UIColor colorWithRed:156/255.0 green:0 blue:6/255.0 alpha:1];
        buttonModifierLabel.alpha = 1;
        buttonModifierLabel.text = [NSString stringWithFormat:@"%.1f s", modifier];
        
        // Animate the modifier label so that it fades out over 1 second
        [UIView animateWithDuration:1.0 animations:^{buttonModifierLabel.alpha = 0;}];
    }
}

#pragma mark - DifficultyViewControllerDelegate Methods

-(void)didSave:(NSNumber*)difficulty
{
    // Set the difficulty property
    self.difficulty = difficulty;
    
    // Save the selected difficulty to ther user defaults
    [[NSUserDefaults standardUserDefaults] setObject:self.difficulty forKey:DIFFICULTY_LEVEL];
    
    [self determineDifficulty];
    
    // Load the saved high score for the selected difficulty
    highScore = [self.highScoreArray[[self.difficulty intValue]] intValue];
    self.highScoreLabel.text = [NSString stringWithFormat:@"%i", highScore];
    
    // Initialize the score and seconds for the new difficulty
    score = 0;
    seconds = gameSeconds;
    
    // Update the timer and score labels with their initial values
    self.timerLabel.text = [NSString stringWithFormat:@"%.1f", seconds];
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", score];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)determineDifficulty
{
    // Check the difficulty level and set the button and modifiers accordingly
    switch ([self.difficulty integerValue]) {
        case 0:
            [self.difficultyButton setTitle:@"Easy" forState:UIControlStateNormal];
            positiveModifier = 0.5;
            negativeModifier = -0.5;
            break;
        case 1:
            [self.difficultyButton setTitle:@"Medium" forState:UIControlStateNormal];
            positiveModifier = 0.4;
            negativeModifier = -0.4;
            break;
        case 2:
            [self.difficultyButton setTitle:@"Hard" forState:UIControlStateNormal];
            positiveModifier = 0.3;
            negativeModifier = -0.3;
            break;
        case 3:
            [self.difficultyButton setTitle:@"Very Hard" forState:UIControlStateNormal];
            positiveModifier = 0.2;
            negativeModifier = -0.2;
            break;
        case 4:
            [self.difficultyButton setTitle:@"Extreme" forState:UIControlStateNormal];
            positiveModifier = 0.1;
            negativeModifier = -0.1;
            break;
            
        default:
            break;
    }
}
@end
