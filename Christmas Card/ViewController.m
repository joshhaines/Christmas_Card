//
//  ViewController.m
//  Christmas Card
//
//  Created by Joshua Haines on 12/13/14.
//  Copyright (c) 2014 Joshua Haines. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[NYCViewController class]]) {
        NYCViewController *nextViewController = segue.destinationViewController;
        nextViewController.delegate = self;
    }
}

- (IBAction)recognizer:(UISwipeGestureRecognizer *)sender {
}

-(void)didSwipeRight
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
