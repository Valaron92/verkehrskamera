//
//  DetailViewController.m
//  HTMLParsing
//
//  Created by Matt Galloway on 19/05/2012.
//  Copyright (c) 2012 Swipe Stack Ltd. All rights reserved.
//
#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailItemb = _detailItemb;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize detailtext = _detailtext;
#pragma mark - Managing the detail item
- (void)setDetailItemb:(id)newDetailItem{
    if (_detailItemb != newDetailItem) {
        _detailItemb = newDetailItem;
        // Update the view.
        [self configureView];
    }
}
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        // Update the view.
        [self configureView];
    }
    
}

- (void)configureView
{
    // Update the user interface for the detail item.
        self.detailDescriptionLabel.text = [self.detailItem description];
        self.detailDescriptionLabel.numberOfLines = 0;
        self.detailDescriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.detailtext.text = [self.detailItemb description];
        self.detailtext.numberOfLines = 0;
        self.detailtext.lineBreakMode = NSLineBreakByWordWrapping;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

/*- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.detailDescriptionLabel = nil;
    self.detailtext = nil;
    self.detailItem = nil;
    self.detailItemb = nil;
}*/

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}
							
@end
