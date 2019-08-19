//
//  Verkehrkamera
//
//  Copyright (c) 2014 Markus. All rights reserved.
//
#import "StartView.h"
#import "HauptTabellenView.h"
@implementation StartView
@synthesize haupttabellenview,radarview,masterview,infoview;
@synthesize mainTableView = ivMainTableView;
@synthesize filteredCandyArray;

- (void)viewDidLoad{
    self.screenName = @"Start View";
    self.automaticallyAdjustsScrollViewInsets = NO;
    arryweiterFunktionen = [[[NSArray alloc] initWithObjects:
                             @"Baden Wüttenberg",
                             @"Bayern",
                             @"Berlin",
                             @"Brandenburg",
                             @"Bremen",
                             @"Hamburg",
                             @"Hessen",
                             @"Mecklenburg Vorpommern",
                             @"Niedersachsen",
                             @"Nordrhein Westfalen",
                             @"Rheinland Pfalz",
                             @"Saarland",
                             @"Sachsen",
                             @"Sachsen Anhalt",
                             @"Schleswig Holstein",
                             @"Thüringen",nil] mutableCopy] ;
    arrydetail = [[[NSArray alloc] initWithObjects:
                             @"Keine Verkehrskameras verfügbar (Java)",
                             @"50 Verkehrskameras",
                             @"40 Verkehrskameras",
                             @"Keine Verkehrskameras verfügbar",
                             @"11 Verkehrskameras",
                             @"Beim nächsten Update verfügbar",
                             @"16 Verkehrskameras",
                             @"Keine Verkehrskameras verfügbar",
                             @"12 Verkehrskameras",
                             @"80 Verkehrskameras",
                             @"71 Verkehrskameras",
                             @"Keine Verkehrskameras verfügbar",
                             @"Beim nächsten Update verfügbar",
                             @"Keine Verkehrskameras verfügbar",
                             @"Beim nächsten Update verfügbar",
                             @"Keine Verkehrskameras verfügbar",nil] mutableCopy] ;
    [[self mainTableView] reloadData];
    [super viewDidLoad];
#pragma Test
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Staumeldungen"
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(nachladen)];
    UIBarButtonItem *flipButtonb = [[UIBarButtonItem alloc]
                                    initWithTitle:@"Info"
                                    style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(nachladenb)];
    
    self.navigationItem.rightBarButtonItem = flipButton;
    self.navigationItem.leftBarButtonItem = flipButtonb;
    /*UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(EditTable:)];
    [self.navigationItem setLeftBarButtonItem:addButton];
    */
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                               initWithTarget:self action:@selector(longPressGestureRecognized:)];
    [self.mainTableView addGestureRecognizer:longPress];
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (IBAction)longPressGestureRecognized:(id)sender {
    UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)sender;
    UIGestureRecognizerState state = longPress.state;
    CGPoint location = [longPress locationInView:self.mainTableView];
    NSIndexPath *indexPath = [self.mainTableView indexPathForRowAtPoint:location];
    static UIView       *snapshot = nil;        ///< A snapshot of the row user is moving.
    static NSIndexPath  *sourceIndexPath = nil; ///< Initial index path, where gesture begins.
    switch (state) {
        case UIGestureRecognizerStateBegan: {
            if (indexPath) {
                sourceIndexPath = indexPath;
                UITableViewCell *cell = [self.mainTableView cellForRowAtIndexPath:indexPath];
                // Take a snapshot of the selected row using helper method.
                snapshot = [self customSnapshoFromView:cell];
                // Add the snapshot as subview, centered at cell's center...
                __block CGPoint center = cell.center;
                snapshot.center = center;
                snapshot.alpha = 0.0;
                [self.mainTableView addSubview:snapshot];
                [UIView animateWithDuration:0.25 animations:^{
                    // Offset for gesture location.
                    center.y = location.y;
                    snapshot.center = center;
                    snapshot.transform = CGAffineTransformMakeScale(1.05, 1.05);
                    snapshot.alpha = 0.98;
                    cell.alpha = 0.0;
                } completion:^(BOOL finished) {
                    cell.hidden = YES;
                }];
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
            CGPoint center = snapshot.center;
            center.y = location.y;
            snapshot.center = center;
            // Is destination valid and is it different from source?
            if (indexPath && ![indexPath isEqual:sourceIndexPath]) {
                // ... update data source.
                [arryweiterFunktionen exchangeObjectAtIndex:indexPath.row withObjectAtIndex:sourceIndexPath.row];
                // ... move the rows.
                [self.mainTableView moveRowAtIndexPath:sourceIndexPath toIndexPath:indexPath];
                // ... and update source so it is in sync with UI changes.
                sourceIndexPath = indexPath;
            }
            break;
        }
        default: {
            // Clean up.
            UITableViewCell *cell = [self.mainTableView cellForRowAtIndexPath:sourceIndexPath];
            cell.hidden = NO;
            cell.alpha = 0.0;
            [UIView animateWithDuration:0.25 animations:^{
                snapshot.center = cell.center;
                snapshot.transform = CGAffineTransformIdentity;
                snapshot.alpha = 0.0;
                cell.alpha = 1.0;
            } completion:^(BOOL finished) {
                sourceIndexPath = nil;
                [snapshot removeFromSuperview];
                snapshot = nil;
            }];
            break;
        }
    }
}
/** @brief Returns a customized snapshot of a given view. */
- (UIView *)customSnapshoFromView:(UIView *)inputView {
    // Make an image from the input view.
    UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, NO, 0);
    [inputView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    // Create an image view.
    UIView *snapshot = [[UIImageView alloc] initWithImage:image];
    snapshot.layer.masksToBounds = NO;
    snapshot.layer.cornerRadius = 0.0;
    snapshot.layer.shadowOffset = CGSizeMake(-5.0, 0.0);
    snapshot.layer.shadowRadius = 5.0;
    snapshot.layer.shadowOpacity = 0.4;
    return snapshot;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(void) nachladen{
    [[self navigationController] pushViewController:masterview animated:YES];
}
-(void) nachladenb{
    [[self navigationController] pushViewController:infoview animated:YES];
}
- (IBAction)test:(id)sender{
    [[self navigationController] pushViewController:radarview animated:YES];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = @"";
            break;
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return [arryweiterFunktionen count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [arryweiterFunktionen objectAtIndex:[indexPath row]];
    cell.detailTextLabel.text =[arrydetail objectAtIndex: [indexPath row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // neu ---test----
    NSString *cellText = [arryweiterFunktionen objectAtIndex:indexPath.row];
    HauptTabellenView *viewTwo = [[HauptTabellenView alloc] initWithNibName:@"HauptTabellenView" bundle:[NSBundle mainBundle]];
    self.haupttabellenview = viewTwo;
    [self.navigationController pushViewController: self.haupttabellenview animated:YES];
    haupttabellenview.recipeNameUnter = cellText;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ( [[segue identifier] isEqualToString:@"candyDetail"] ) {
        UIViewController *candyDetailViewController = [segue destinationViewController];
            NSIndexPath *indexPath = [self.mainTableView indexPathForSelectedRow];
            NSString *destinationTitle = [[arryweiterFunktionen objectAtIndex:[indexPath row]] name];
            [candyDetailViewController setTitle:destinationTitle];
    }
}

- (IBAction) EditTable:(id)sender{
    if(self.editing)
    {
        [super setEditing:NO animated:NO];
        [self.mainTableView setEditing:NO animated:NO];
        [self.mainTableView reloadData];
        [self.navigationItem.leftBarButtonItem setTitle:@"Edit"];
        [self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStylePlain];
    }
    else
    {
        [super setEditing:YES animated:YES];
        [self.mainTableView setEditing:YES animated:YES];
        [self.mainTableView reloadData];
        [self.navigationItem.leftBarButtonItem setTitle:@"Fertig"];
        [self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStyleDone];
    }
}

// Update the data model according to edit actions delete or insert.
- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [arryweiterFunktionen removeObjectAtIndex:indexPath.row];
        [arrydetail removeObjectAtIndex:indexPath.row];
        [self.mainTableView reloadData];
    }
}

#pragma mark Row reordering
// Determine whether a given row is eligible for reordering or not.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
// Process the row move. This means updating the data model to correct the item indices.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
      toIndexPath:(NSIndexPath *)toIndexPath {
    NSString *item = [arryweiterFunktionen objectAtIndex:fromIndexPath.row];
    [arryweiterFunktionen removeObject:item];
    [arryweiterFunktionen insertObject:item atIndex:toIndexPath.row];
}

@end
