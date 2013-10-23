//
//  DetailVC.m
//  twitter
//
//  Created by pradyut panda on 10/22/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "DetailVC.h"

@interface DetailVC ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *twitterHandleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;

@end

@implementation DetailVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   // check if we have a valid tweet
    if ( self.tweet )
    {
        self.tweetLabel.text = self.tweet.text;
        self.userLabel.text = self.tweet.username;
        self.twitterHandleLabel.text = self.tweet.twitterhandle;
        self.dateLabel.text = self.tweet.timestamp;
        
        NSString *profileURL = self.tweet.profileURL;
        self.profileImageView.image = [UIImage imageWithData:
                                [NSData dataWithContentsOfURL:
                                 [NSURL URLWithString:profileURL]]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
