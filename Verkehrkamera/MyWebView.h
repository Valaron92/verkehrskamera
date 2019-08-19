//
//  Verkehrkamera
//
//  Copyright (c) 2014 Markus. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "MZTimerLabel.h"
@interface MyWebView : UIViewController <NSURLConnectionDelegate,NSURLConnectionDataDelegate,MZTimerLabelDelegate,UIScrollViewDelegate>
{
    IBOutlet UILabel* urllabel;
    IBOutlet UILabel* titelheadr;
    IBOutlet UINavigationBar* navbar;
    MZTimerLabel *timerExample3;
    MZTimerLabel *timerExample13;
    UIScrollView *imageScrollView;
}
@property (nonatomic,strong) IBOutlet UINavigationBar* navbar;
@property (nonatomic,strong) IBOutlet UILabel* titelheadr;
@property (nonatomic, strong) IBOutlet UILabel* urllabel;
@property (nonatomic,strong) IBOutlet UIImageView *imageb;
@property (nonatomic, strong) NSString *htmlFile;
@property (nonatomic, strong) NSString *Tittel;
@property (nonatomic, strong) NSString *land;
@property (strong, nonatomic) NSTimer *myTimer;
@property int counter;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
/*Controls for Example 3*/
@property (weak, nonatomic) IBOutlet UILabel *lblTimerExample3;



@property (nonatomic, strong) IBOutlet UIScrollView *imageScrollView;

@end
