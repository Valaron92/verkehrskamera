//
//  InfoView.m
//  Verkehrkamera
//
//  Created by Markus on 27.12.15.
//  Copyright © 2015 Markus. All rights reserved.
//
#import "InfoView.h"
#import <MessageUI/MessageUI.h>

@implementation InfoView
@synthesize wv;

- (void)viewWillAppear:(BOOL)animated{
    NSString *urlAddress = [[NSBundle mainBundle] pathForResource:@"agb" ofType:@"html"];
    NSData *htmlData = [NSData dataWithContentsOfFile:urlAddress];
    NSString *resourceURL = [[NSBundle mainBundle] resourcePath];
    resourceURL = [resourceURL stringByReplacingOccurrencesOfString:@"/" withString:@"//"];
    resourceURL = [resourceURL stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSURL *baseURL = [NSURL URLWithString:[NSString stringWithFormat:@"file:/%@//",resourceURL]];
    [self.wv loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:baseURL];
    self.wv.scalesPageToFit = YES;
    self.wv.delegate = self;
    [super viewWillAppear:YES];
}

- (void)viewDidLoad
{
    self.navigationItem.title =  NSLocalizedString(@"AGB","");
    [super viewDidLoad];
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
     initWithTitle:NSLocalizedString(@"Feedback / Support","")
     style:UIBarButtonItemStylePlain
     target:self
     action:@selector(sendEmailAction:)];
    self.navigationItem.rightBarButtonItem = flipButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)sendEmailAction:(UIButton *)sender
{
    if ([MFMailComposeViewController canSendMail])
    {
        NSString *a = [[UIDevice currentDevice] localizedModel];
        NSString *e = [[UIDevice currentDevice] systemName];
        NSString *f = [[UIDevice currentDevice] systemVersion];
        NSString *g = [[[NSBundle mainBundle]infoDictionary]objectForKey:@"CFBundleVersion"];
        [[NSUserDefaults standardUserDefaults]setObject:g forKey:@"version_preference"];
        NSString *emailBody = [NSString stringWithFormat:@" \n\n\n    \r\n \r\n \r\n ------------------\r\n Bitte diese Informationen nicht entfernen! \r\n Modell %@\n Device %@\n iOS Version: %@\n Verkehrskamera \n App Version %@\n",a,e,f,g];
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        mail.mailComposeDelegate = self;
        [mail setSubject:@"Feedback / Support Verkehrskamera"];
        [mail setToRecipients:@[@"user.goldcrest@gmail.com"]];
        [mail setMessageBody:emailBody isHTML:NO];
        [self presentViewController:mail animated:YES completion:NULL];
    }
    else
    {
        NSLog(@"This device cannot send email");
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"You sent the email.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"You saved a draft of this email");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"You cancelled sending this email.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed:  An error occurred when trying to compose this email");
            break;
        default:
            NSLog(@"An error occurred when trying to compose this email");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
