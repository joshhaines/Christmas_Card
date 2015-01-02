//
//  DifficultyViewController.m
//  Christmas Card
//
//  Created by Joshua Haines on 12/28/14.
//  Copyright (c) 2014 Joshua Haines. All rights reserved.
//

#import "DifficultyViewController.h"

@interface DifficultyViewController ()

@end

@implementation DifficultyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Highlight the current selected difficulty
    self.difficultySegmentedControl.selectedSegmentIndex = [self.difficulty integerValue];
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

- (IBAction)saveButtonPressed:(UIButton *)sender {
    // Check if there was actually a new selection made
    if ([self.difficulty integerValue] == self.difficultySegmentedControl.selectedSegmentIndex) {
        // If no new selection was made, then perform a didCancel
        [self.delegate didCancel];
    }
    else {
        // If a new selection was made, set the difficulty and call the delegate's didSave method
        self.difficulty = [NSNumber numberWithInteger:self.difficultySegmentedControl.selectedSegmentIndex];
        [self.delegate didSave:self.difficulty];
    }
}

- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self.delegate didCancel];
}
@end
