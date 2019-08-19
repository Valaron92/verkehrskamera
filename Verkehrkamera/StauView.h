//
//  StauView.h
//  Verkehrkamera
//
//  Created by Markus on 21.06.15.
//  Copyright (c) 2015 Markus. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface StauView : UIViewController <NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{
    IBOutlet UIActivityIndicatorView *spinner;
    IBOutlet UILabel* urllabel;
    IBOutlet UILabel* titelheadr;
    IBOutlet UINavigationBar* navbar;
}

@property (nonatomic,strong) IBOutlet UINavigationBar* navbar;
@property (nonatomic,strong) IBOutlet UILabel* titelheadr;
@property (nonatomic, strong) IBOutlet UILabel* urllabel;
@property (nonatomic,strong) IBOutlet UIImageView *imageb;
@property (nonatomic, strong) NSString *htmlFile;
@property (nonatomic, strong) NSString *Tittel;

@end