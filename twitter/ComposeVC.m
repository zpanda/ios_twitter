//
//  ComposeVC.m
//  twitter
//
//  Created by pradyut panda on 10/22/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "ComposeVC.h"
#import "User.h"


@interface ComposeVC ()
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *twitterHandleLabel;
@property (weak, nonatomic) IBOutlet UITextView *composeTextView;


- (IBAction)onCancelButtonClicked:(id)sender;
- (IBAction)onSendButtonClicked:(id)sender;
- (IBAction)onTap:(id)sender;
@end




@implementation ComposeVC

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
    
    // get the current user and set up fields
    User *user = [User currentUser];
    
    self.userNameLabel.text = [user.data valueOrNilForKeyPath:@"name"];
    NSString *screenName = [user.data valueOrNilForKeyPath:@"screen_name"];
    self.twitterHandleLabel.text = [NSString stringWithFormat:@"@%s", screenName.UTF8String];
    
    NSString *profileURL = [user.data valueOrNilForKeyPath:@"profile_image_url"];
    self.profileImage.image = [UIImage imageWithData:
                            [NSData dataWithContentsOfURL:
                             [NSURL URLWithString:profileURL]]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onCancelButtonClicked:(id)sender
{
    NSLog(@" Cancel button was pressed ");
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onSendButtonClicked:(id)sender
{
    NSLog(@" Send button was pressed ");
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onTap:(id)sender {
    NSLog(@" Someone tapped!");
}
@end
