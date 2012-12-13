//
//  TextViewController.m
//  Dec11
//
//  Created by Lisa Jenkins on 12/13/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import "TextViewController.h"
#import "TextView.h"

enum {
    alertNo,
    alertYes,
    alertLater,
};

@interface TextViewController ()

@end

@implementation TextViewController

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
    self.view = [[TextView alloc] initWithFrame:frame];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [NSTimer scheduledTimerWithTimeInterval:3
                                     target:self.view
                                   selector:@selector(showAlert:)
                                   userInfo:self
                                    repeats:NO];
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case alertYes:{
            NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/us/album/for-ones-feat.-oddateee-komplx/id471071037?uo=4"];
            UIApplication *application = [UIApplication sharedApplication];
            if (![application canOpenURL:url]) {
                NSLog(@"Can't open url");
            }
            if (![application openURL:url]) {
                NSLog(@"Open url");
            }
        }
            break;
        case alertLater:
            [NSTimer scheduledTimerWithTimeInterval:7
                                             target:self.view
                                           selector:@selector(showAlert:) userInfo:self repeats:YES];
            break;
        case alertNo:
            NSLog(@"does not want to buy the album");
            break;
        default:
            break;
    }
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
