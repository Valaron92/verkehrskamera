//
//  MasterViewController.m
//  HTMLParsing
//
//  Created by Matt Galloway on 19/05/2012.
//  Copyright (c) 2012 Swipe Stack Ltd. All rights reserved.
//
#import "MasterViewController.h"
#import "DetailViewController.h"
#import "TFHpple.h"
#import "Tutorial.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
    NSMutableArray *_contributors;
    UIWebView* wv;
}
@end

@implementation MasterViewController
@synthesize detailViewController = _detailViewController;

- (void)loadTutorials {
    // 1
     NSURL *tutorialsUrl = [NSURL URLWithString:@"https://www.rpr1.de/verkehr"];
    NSData *tutorialsHtmlData = [NSData dataWithContentsOfURL:tutorialsUrl];
    // 2
    TFHpple *tutorialsParser = [TFHpple hppleWithHTMLData:tutorialsHtmlData];
    // 3
    //NSString *tutorialsXpathQueryString = @"//div[@class='mob-pane traffic']/div[@class='mob-list']/div/div[@class='mob-item-rgt-inset txtblock']";
     NSString *tutorialsXpathQueryString = @"//div/main/div/div/div/div/div/div/div/ul/li[@class='list-traffic__item']/div/div[@class='col-traffic__list col-traffic__list--left']";
    NSArray *tutorialsNodes = [tutorialsParser searchWithXPathQuery:tutorialsXpathQueryString];
    // 4
    NSMutableArray *newtutorials = [[NSMutableArray alloc] initWithCapacity:0];
    for (TFHppleElement *element in tutorialsNodes) {
        // 5
        Tutorial *contributor = [[Tutorial alloc] init];
        [newtutorials addObject:contributor];
        // 6
        for (TFHppleElement *child in element.children) {
            if ([child.tagName isEqualToString:@"span"]) {
                // 7
                @try {
                    contributor.title = [[child firstChild] content];
                    NSLog(@"&%@",contributor.title);
                }
                @catch (NSException *e) {}
            } else if ([child.tagName isEqualToString:@"span"]) {
                // 8
                contributor.titleb = [[child firstChild] content];
                NSLog(@"&%@",contributor.titleb);
            }
        }
    }
    // 9
    _objects = newtutorials;
    [self.tableView reloadData];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadTutorials];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Reload"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(nachladen)];
    self.navigationItem.rightBarButtonItem = flipButton;
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

-(void) nachladen{
    [self loadTutorials];
}

#pragma mark - Table View

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
            return _objects.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 120;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.section == 0) {
        Tutorial *thisTutorial = [_objects objectAtIndex:indexPath.row];
        cell.textLabel.text = thisTutorial.title;
        cell.detailTextLabel.text = thisTutorial.titleb;
        cell.detailTextLabel.numberOfLines = 0;
        cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    }
    Tutorial *thisTutorial = [_objects objectAtIndex:indexPath.row];
    
    NSString *object = thisTutorial.title;
    NSString *objextb = thisTutorial.titleb;
    self.detailViewController.detailItem = object;
    self.detailViewController.detailItemb = objextb;
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
