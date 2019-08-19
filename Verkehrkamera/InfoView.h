//
//  InfoView.h
//  Verkehrkamera
//
//  Created by Markus on 27.12.15.
//  Copyright © 2015 Markus. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@interface InfoView : UIViewController <UIWebViewDelegate,MFMailComposeViewControllerDelegate,UIAlertViewDelegate>
{
    MFMailComposeViewController *mailComposer;
    IBOutlet UIWebView *wv;
}
@property(nonatomic, strong)IBOutlet UIWebView *wv;
@end