//
//  Verkehrkamera
//
//  Copyright (c) 2014 Markus. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "MyWebView.h"
#import "MasterViewController.h"
#import "RadarView.h"
@interface HauptTabellenView : GAITrackedViewController
{
    // 1
    NSArray *url1;
    NSArray *text1;
    NSArray *text1detail;
    // 2
    NSArray *url2;
    NSArray *text2;
    NSArray *text2detail;
    // 3
    NSArray *url3;
    NSArray *text3;
    NSArray *text3detail;
    // 4
    NSArray *url4;
    NSArray *text4;
    NSArray *text4detail;
    // 5
    NSArray *url5;
    NSArray *text5;
    NSArray *text5detail;
    // 6
    NSArray *url6;
    NSArray *text6;
    NSArray *text6detail;
    // 7
    NSArray *url7;
    NSArray *text7;
    NSArray *text7detail;
    // 8
    NSArray *url8;
    NSArray *text8;
    NSArray *text8detail;
    // 9
    NSArray *url9;
    NSArray *text9;
    NSArray *text9detail;
    // 10
    NSArray *url10;
    NSArray *text10;
    NSArray *text10detail;
    // 11
    NSArray *url11;
    NSArray *text11;
    NSArray *text11detail;
    // 12
    NSArray *url12;
    NSArray *text12;
    NSArray *text12detail;
    // 13
    NSArray *url13;
    NSArray *text13;
    NSArray *text13detail;
    // 14
    NSArray *url14;
    NSArray *text14;
    NSArray *text14detail;
    // 15
    NSArray *url15;
    NSArray *text15;
    NSArray *text15detail;
    // 16
    NSArray *url16;
    NSArray *text16;
    NSArray *text16detail;
    // 17
    NSArray *url17;
    NSArray *text17;
    NSArray *text17detail;
    // 18
    NSArray *url18;
    NSArray *text18;
    NSArray *text18detail;
    // 19
    NSArray *url19;
    NSArray *text19;
    NSArray *text19detail;
    // 20
    NSArray *url20;
    NSArray *text20;
    NSArray *text20detail;
}
@property (nonatomic, strong) IBOutlet UITableView *myTableView;
@property (nonatomic, strong) IBOutlet MyWebView *myWebView;
@property (nonatomic,strong) IBOutlet MasterViewController *masterview;
@property (nonatomic,strong) IBOutlet RadarView *radarview;
@property (nonatomic, strong) NSString *recipeNameUnter;
@end
