//
//  MasterViewController.m
//  HTMLParsing
//
//  Created by Matt Galloway on 19/05/2012.
//  Copyright (c) 2012 Swipe Stack Ltd. All rights reserved.
//
#import "RadarView.h"
#import "DetailViewController.h"
#import "TFHpple.h"
#import "Tutorial.h"

@interface RadarView () {
    NSMutableArray *_objects;
    NSMutableArray *_contributors;
    UIWebView* wv;
}
@end
// NSString *tutorialsXpathQueryString = @"//div/div[@class='mob-pane radar']/div[@class='mob-list']/div[@class='mob-item h']/div[@class='mob-item-rgt-inset txtblock']/div[@class='service-blitzer-row']";
@implementation RadarView

@synthesize detailViewController = _detailViewController;

- (void)loadTutorials {
    // 1
    NSURL *tutorialsUrl = [NSURL URLWithString:@"http://mobile.rpr1.de/mobs/radar/index.html"];
    NSData *tutorialsHtmlData = [NSData dataWithContentsOfURL:tutorialsUrl];
    // 2
    TFHpple *tutorialsParser = [TFHpple hppleWithHTMLData:tutorialsHtmlData];
    // 3
    NSString *tutorialsXpathQueryString = @"//div[@class='mob-pane radar']/div[@class='mob-list']/div/div[@class='mob-item-rgt-inset txtblock']";
    NSArray *tutorialsNodes = [tutorialsParser searchWithXPathQuery:tutorialsXpathQueryString];
    // 4
    NSMutableArray *newtutorialsa = [[NSMutableArray alloc] initWithCapacity:0];
    for (TFHppleElement *element in tutorialsNodes) {
        // 5
        Tutorial *contributora = [[Tutorial alloc] init];
        [newtutorialsa addObject:contributora];
        // 6
        for (TFHppleElement *child in element.children) {
            /*if ([child.tagName isEqualToString:@"h4"]) {
                // 7
                @try {
                    NSLog(@"%@ 1",[[child firstChild] content]);
                    contributora.title = [[child firstChild] content];
                    NSLog(@"%@ 5",contributora.title);
                }
               @catch (NSException *e) {}
            } else if ([child.tagName isEqualToString:@"div"]) {
                // 8
                NSLog(@"%@ 11",[[child firstChild] content]);
                contributora.titleb = [[child firstChild] content];
                NSLog(@"%@ 12",contributora.title);
            }*/
            if ([child.tagName isEqualToString:@"div"]) {
            NSLog(@"%@ 1",[[child firstChild] content]);
            contributora.title = [[child firstChild] content];
            NSLog(@"%@ 5",contributora.title);
            }
        }
    }
    // 9
    _contributors = newtutorialsa;
    NSLog(@"%@ 6",_contributors);
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
    return _contributors.count;
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
        Tutorial *thisTutorial = [_contributors objectAtIndex:indexPath.row];
        NSLog(@"%@ 2",thisTutorial.title);
        cell.textLabel.text = thisTutorial.title;
        NSLog(@"%@ 3",cell.textLabel.text);
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
