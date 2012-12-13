//
//  Dec11AppDelegate.h
//  Dec11
//
//  Created by Lisa Jenkins on 12/13/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface Dec11AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>{
    
    UIWindow *_window;
    AVAudioPlayer *audioPlayer;
    NSURL *videoURL;
    NSString *last;
}

@property (strong, nonatomic) UIWindow *window;

@end
