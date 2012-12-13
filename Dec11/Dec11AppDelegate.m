//
//  Dec11AppDelegate.m
//  Dec11
//
//  Created by Lisa Jenkins on 12/13/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import "Dec11AppDelegate.h"
#import "TextViewController.h"
#import "ImageViewController.h"
#import <MediaPlayer/MediaPlayer.h>


@implementation Dec11AppDelegate
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIScreen *screen = [UIScreen mainScreen];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    NSBundle *bundle = [NSBundle mainBundle];
    videoURL = [NSURL fileURLWithPath:[bundle pathForResource:@"IGotIt" ofType:@"MOV"]];
    
    NSArray *controllers =
    [NSArray arrayWithObjects:
     [[TextViewController alloc] initWithNibName:nil bundle:nil],
     [[ImageViewController alloc] initWithNibName:nil bundle:nil],
     [[MPMoviePlayerViewController alloc] initWithContentURL:videoURL],
     [[UIViewController alloc] initWithNibName:nil bundle:nil],
     nil];
    
    UIViewController *viewController = [controllers objectAtIndex:0];
    viewController.title = @"Lyrics";
    viewController.tabBarItem.image = [UIImage imageNamed: @"Text.png"];
    
    viewController = [controllers objectAtIndex:1];
    viewController.title = @"Poster";
    viewController.tabBarItem.image = [UIImage imageNamed:@"Postericon.png"];
    
    viewController = [controllers objectAtIndex:2];
    viewController.title = @"Video";
    viewController.tabBarItem.image = [UIImage imageNamed: @"Video.png"];
    ((MPMoviePlayerViewController *)viewController).moviePlayer.shouldAutoplay = NO;
    [((MPMoviePlayerViewController *)viewController).moviePlayer prepareToPlay];
    
    viewController = [controllers objectAtIndex:3];
    viewController.title = @"Music";
    viewController.tabBarItem.image = [UIImage imageNamed:@"Theme.png"];
    NSURL *audioURL = [NSURL fileURLWithPath:[bundle pathForResource:@"IGotIt" ofType:@"mp3"]];
    NSError *error = nil;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL error:&error];
    if (audioPlayer == nil) {
        NSLog(@"error == %@", error);
        return YES;
    }
    audioPlayer.numberOfLoops = 1;
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    self.window.rootViewController = tabBarController;
    tabBarController.viewControllers = controllers;
    tabBarController.delegate = self;
    last = ((UIViewController *)[tabBarController.viewControllers objectAtIndex:0]).title;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
   
    if (![last isEqualToString:@"Video"] && ![viewController.title isEqualToString:@"Video"]) {
        MPMoviePlayerViewController *moviePlayerViewController = [tabBarController.viewControllers objectAtIndex:2];
        MPMoviePlayerController *moviePlayerController = moviePlayerViewController.moviePlayer;
        NSTimeInterval currentPlaybackTime = moviePlayerController.currentPlaybackTime;
        moviePlayerController.contentURL = videoURL;
        moviePlayerController.initialPlaybackTime = currentPlaybackTime;
        [moviePlayerController prepareToPlay];
    }
    
    if ([viewController.title isEqualToString:@"Music"]) {
        [audioPlayer play];
    } else if ([last isEqualToString:@"Music"]){
        [audioPlayer pause];
    }
    
    last = viewController.title;
    
}

@end
