//
//  TextView.m
//  Dec11
//
//  Created by Lisa Jenkins on 12/13/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import "TextView.h"

@implementation TextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        textView = [[UITextView alloc] initWithFrame:self.bounds];
        textView.backgroundColor = [UIColor darkGrayColor];
        textView.textColor = [UIColor whiteColor];
        textView.font = [UIFont fontWithName:@"Courier" size:18];
        textView.editable = NO;
        
        textView.text =
        @"i got it\n\n"
        @"Your chains can't hold me \n"
        @"I'd escape like Whodini \n"
        @"This just 4 plus minutes of funk n"
        @"But you'll feel me! \n"
        @"This ain't high class like caviar & martinis \n"
        @"Think More gutter like McFish and Riunite \n"
        @"started seeing the world mad clearly. \n"
        @"It ain't nothing like TV \n"
        @"smell of burnt flesh won't leave me \n"
        @"Thoughts remain like the Lincoln motel ... Seedy. \n"
        @"ain't a good neighbor,  ain't Mr. McFeely. \n"
        @"I'm your sworn enemy won't sign no treaties \n"
        @"Fight till the death. no imprisonment For the weary. \n\n"
        
        @"i got it \n\n"
        
        @"Chains self inflicted like gun wounds to right temple \n"
        @"Embodiment of a god with ideas of a devil. \n"
        @"I'm the thorn of a rose that stabbed it's own pedal. \n"
        @"I'm the kid who ain't got shit \n"
        @"And refuses to settle. \n"
        @"The one who ain't scared to get bruises,believe me got several. \n"
        @"To put it short, I test your meddle. \n"
        @"Model citizens tend to cross streets when we cross paths. \n"
        @"Invoke the wrath of a 1920's chain gang. \n"
        @"Cause you to chain smoke. \n"
        @"Provoke you to clench fists before you realize that the chain that hold me back broke! \n"
        @"Will I show pity, show remorse? Nope \n"
        @"CAnt quite cope with societal restraints. \n"
        @"And I'm well aware of the type of picture that this paints. \n"
        @"Time to grab your rosaries, pray to your saints \n"
        @"Nothing good ever comes to those who don't wait. \n"
        @"So wait a minute while I reload this Trey-eight. \n"
        @"Call it prophesy ... call it fate. \n"
        @"Every decision I make reverberates \n"
        @"hold communal memories like dusty record creates. \n"
        @"Im Well known in my hood like family first or section 8. \n";
        
        [self addSubview:textView];
    }
    return self;
}

-(void) showAlert:(NSTimer *)timer{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Buy the Album"
                          message:@"Do you want to buy the album?"
                          delegate:timer.userInfo
                          cancelButtonTitle:@"No"
                          otherButtonTitles:@"Yes", @"Remind me later", nil];
    [alert show];
    //[timer invalidate];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
