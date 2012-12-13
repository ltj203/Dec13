//
//  ImageViewController.m
//  Dec11
//
//  Created by Lisa Jenkins on 12/13/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import "ImageViewController.h"
#import "ImageView.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) loadView {
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    self.view = [[ImageView alloc] initWithFrame:frame];
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

-(BOOL) shouldAutorotate {
    return YES;
}

@end
