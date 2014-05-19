//
//  ViewController.m
//  SlidingPuzzle
//
//  Created by Shaver, Brandon L on 2/21/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        View *myView = [[View alloc]
                          initWithFrame:[[UIScreen mainScreen] bounds]];
        
        
        self.view = myView; //set the default view of controller to myView
        [myView release];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
