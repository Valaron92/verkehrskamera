//
//  Verkehrkamera
//
//  Copyright (c) 2014 Markus. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "HauptTabellenView.h"
// AGB
#import "InfoView.h"
//
#import "MasterViewController.h"
#import "RadarView.h"
@interface StartView : GAITrackedViewController
{
    UITableView *ivMainTableView;
    NSMutableArray *arryweiterFunktionen;
    NSMutableArray *arrydetail;
}
@property (nonatomic,strong) IBOutlet MasterViewController *masterview;
@property (nonatomic,strong) IBOutlet RadarView *radarview;
@property(strong,nonatomic) NSMutableArray *filteredCandyArray;

@property(nonatomic, strong)HauptTabellenView* haupttabellenview;
@property(nonatomic, strong)IBOutlet InfoView* infoview;
@property (nonatomic, strong) IBOutlet UITableView *mainTableView;

- (IBAction) EditTable:(id)sender;
- (IBAction)test:(id)sender;
@end
