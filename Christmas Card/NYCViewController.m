//
//  NYCViewController.m
//  Christmas Card
//
//  Created by Joshua Haines on 12/13/14.
//  Copyright (c) 2014 Joshua Haines. All rights reserved.
//

#import "NYCViewController.h"

@interface NYCViewController ()

@end

@implementation NYCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[TextViewController class]]) {
        TextViewController *nextViewController = segue.destinationViewController;
        nextViewController.delegate = self;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)rightRecognizer:(UISwipeGestureRecognizer *)sender {
    [self.delegate didSwipeRight];
}

-(void)didSwipe
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
