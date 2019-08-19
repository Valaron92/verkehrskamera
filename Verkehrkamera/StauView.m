//
//  StauView.m
//  Verkehrkamera
//
//  Created by Markus on 21.06.15.
//  Copyright (c) 2015 Markus. All rights reserved.
//
#import "StauView.h"

@interface StauView ()
@end

@implementation StauView
@synthesize htmlFile,imageb,navbar,urllabel,Tittel,titelheadr;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
- (void)viewDidAppear:(BOOL)animated{
    NSURL * imageURL = [NSURL URLWithString:htmlFile];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage * imagea = [UIImage imageWithData:imageData];
    imageb.image = imagea;
    
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Reload"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(nachladen)];
    self.navigationItem.rightBarButtonItem = flipButton;
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

-(void)viewDidUnload{
    [super viewDidUnload];
    self.title = nil;
    imageb.image = nil;
}
-(void)viewDidDisappear:(BOOL)animated{
    self.imageb.image = nil;
}

-(void) nachladen{
    NSURL * imageURL = [NSURL URLWithString:htmlFile];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage * imagea = [UIImage imageWithData:imageData];
    imageb.image = imagea;
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end
