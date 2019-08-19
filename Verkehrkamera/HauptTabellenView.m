//
//  Verkehrkamera
//
//  Copyright (c) 2014 Markus. All rights reserved.
//
#import "HauptTabellenView.h"
@implementation HauptTabellenView
@synthesize myTableView, myWebView,masterview,radarview,recipeNameUnter;

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName
           value:recipeNameUnter];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Kameras" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    if ([recipeNameUnter isEqualToString:@"Berlin"]){
    self.navigationItem.title =  @"Berlin";
    text1 = [dict objectForKey:@"berlin-text"];
    url1 = [dict objectForKey:@"berlin-url"];
    }
    else if ([recipeNameUnter isEqualToString:@"Bremen"]){
        self.navigationItem.title =  @"Bremen";
        text1 = [dict objectForKey:@"bremen-text"];
        url1 = [dict objectForKey:@"bremen-url"];
    }
    else if ([recipeNameUnter isEqualToString:@"Niedersachsen"]){
        self.navigationItem.title =  @"Niedersachsen";
        text1 = [dict objectForKey:@"niedersachsen-text"];
        url1 = [dict objectForKey:@"niedersachsen-url"];
    }
    else if ([recipeNameUnter isEqualToString:@"Hessen"]){
        self.navigationItem.title =  @"Hessen";
        text1 = [dict objectForKey:@"hessen-text"];
        url1 = [dict objectForKey:@"hessen-url"];
    }
    else if ([recipeNameUnter isEqualToString:@"Bayern"]){
    text1 = [dict objectForKey:@"bayern-text-1"];
    url1 = [dict objectForKey:@"bayern-url-1"];
    text1detail = [dict objectForKey:@"bayern-detail-1"];
    text2 =[dict objectForKey:@"bayern-text-2"];
    url2 =[dict objectForKey:@"bayern-url-2"];
    text2detail = [dict objectForKey:@"bayern-detail-2"];
    text3 =[dict objectForKey:@"bayern-text-3"];
    url3 =[dict objectForKey:@"bayern-url-3"];
    text3detail = [dict objectForKey:@"bayern-detail-3"];
    text4 =[dict objectForKey:@"bayern-text-4"];
    url4 =[dict objectForKey:@"bayern-url-4"];
    text4detail = [dict objectForKey:@"bayern-detail-4"];
    text5 =[dict objectForKey:@"bayern-text-5"];
    url5 =[dict objectForKey:@"bayern-url-5"];
    text5detail = [dict objectForKey:@"bayern-detail-5"];
    text6 =[dict objectForKey:@"bayern-text-6"];
    url6 =[dict objectForKey:@"bayern-url-6"];
    text6detail = [dict objectForKey:@"bayern-detail-6"];
    }
    else if ([recipeNameUnter isEqualToString:@"Nordrhein Westfalen"]){
    text1 = [dict objectForKey:@"NRW-text-1"];
    url1 = [dict objectForKey:@"NRW-url-1"];
    text1detail = [dict objectForKey:@"NRW-detail-1"];
    text2 =[dict objectForKey:@"NRW-text-2"];
    url2 =[dict objectForKey:@"NRW-url-2"];
    text2detail = [dict objectForKey:@"NRW-detail-2"];
    text3 =[dict objectForKey:@"NRW-text-3"];
    url3 =[dict objectForKey:@"NRW-url-3"];
    text4 =[dict objectForKey:@"NRW-text-4"];
    url4 =[dict objectForKey:@"NRW-url-4"];
    text5 =[dict objectForKey:@"NRW-text-5"];
    url5 =[dict objectForKey:@"NRW-url-5"];
    text6 =[dict objectForKey:@"NRW-text-6"];
    url6 =[dict objectForKey:@"NRW-url-6"];
    text7 =[dict objectForKey:@"NRW-text-7"];
    url7 =[dict objectForKey:@"NRW-url-7"];
    text8 =[dict objectForKey:@"NRW-text-8"];
    url8 =[dict objectForKey:@"NRW-url-8"];
    text9 =[dict objectForKey:@"NRW-text-9"];
    url9 =[dict objectForKey:@"NRW-url-9"];
    text10 =[dict objectForKey:@"NRW-text-10"];
    url10 =[dict objectForKey:@"NRW-url-10"];
    text11 =[dict objectForKey:@"NRW-text-11"];
    url11 =[dict objectForKey:@"NRW-url-11"];
    text12 =[dict objectForKey:@"NRW-text-12"];
    url12 =[dict objectForKey:@"NRW-url-12"];
    text13 =[dict objectForKey:@"NRW-text-13"];
    url13 =[dict objectForKey:@"NRW-url-13"];
    text14 =[dict objectForKey:@"NRW-text-14"];
    url14 =[dict objectForKey:@"NRW-url-14"];
    text15 =[dict objectForKey:@"NRW-text-15"];
    url15 =[dict objectForKey:@"NRW-url-15"];
    text16 =[dict objectForKey:@"NRW-text-16"];
    url16 =[dict objectForKey:@"NRW-url-16"];
    text17 =[dict objectForKey:@"NRW-text-17"];
    url17 =[dict objectForKey:@"NRW-url-17"];
    text18 =[dict objectForKey:@"NRW-text-18"];
    url18 =[dict objectForKey:@"NRW-url-18"];
    text19 =[dict objectForKey:@"NRW-text-19"];
    url19 =[dict objectForKey:@"NRW-url-19"];
    text20 =[dict objectForKey:@"NRW-text-20"];
    url20 =[dict objectForKey:@"NRW-url-20"];
    }
    else if ([recipeNameUnter isEqualToString:@"Rheinland Pfalz"]){
        text1 = [dict objectForKey:@"rlp-text-1"];
        url1 = [dict objectForKey:@"rlp-url-1"];
        text2 =[dict objectForKey:@"rlp-text-2"];
        url2 =[dict objectForKey:@"rlp-url-2"];
        text3 =[dict objectForKey:@"rlp-text-3"];
        url3 =[dict objectForKey:@"rlp-url-3"];
        text4 =[dict objectForKey:@"rlp-text-4"];
        url4 =[dict objectForKey:@"rlp-url-4"];
        text5 =[dict objectForKey:@"rlp-text-5"];
        url5 =[dict objectForKey:@"rlp-url-5"];
        text6 =[dict objectForKey:@"rlp-text-6"];
        url6 =[dict objectForKey:@"rlp-url-6"];
        text7 =[dict objectForKey:@"rlp-text-7"];
        url7 =[dict objectForKey:@"rlp-url-7"];
        text8 =[dict objectForKey:@"rlp-text-8"];
        url8 =[dict objectForKey:@"rlp-url-8"];
        text9 =[dict objectForKey:@"rlp-text-9"];
        url9 =[dict objectForKey:@"rlp-url-9"];
        text10 =[dict objectForKey:@"rlp-text-10"];
        url10 =[dict objectForKey:@"rlp-url-10"];
        text11 =[dict objectForKey:@"rlp-text-11"];
        url11 =[dict objectForKey:@"rlp-url-11"];
        text12 =[dict objectForKey:@"rlp-text-12"];
        url12 =[dict objectForKey:@"rlp-url-12"];
        text13 =[dict objectForKey:@"rlp-text-13"];
        url13 =[dict objectForKey:@"rlp-url-13"];
        text14 =[dict objectForKey:@"rlp-text-14"];
        url14 =[dict objectForKey:@"rlp-url-14"];
        text15 =[dict objectForKey:@"rlp-text-15"];
        url15 =[dict objectForKey:@"rlp-url-15"];
        text16 =[dict objectForKey:@"rlp-text-16"];
        url16 =[dict objectForKey:@"rlp-url-16"];
        text17 =[dict objectForKey:@"rlp-text-17"];
        url17 =[dict objectForKey:@"rlp-url-17"];
        text18 =[dict objectForKey:@"rlp-text-18"];
        url18 =[dict objectForKey:@"rlp-url-18"];
        text19 =[dict objectForKey:@"rlp-text-19"];
        url19 =[dict objectForKey:@"rlp-url-19"];
        text20 =[dict objectForKey:@"rlp-text-20"];
        url20 =[dict objectForKey:@"rlp-url-20"];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(void) nachladen{
    [[self navigationController] pushViewController:masterview animated:YES];
}
-(void) nachladenb{
    [[self navigationController] pushViewController:radarview animated:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([recipeNameUnter isEqualToString:@"Bayern"]){
    return 6;
    }
    else if ([recipeNameUnter isEqualToString:@"Nordrhein Westfalen"]){
    return 20;
    }
    else if ([recipeNameUnter isEqualToString:@"Rheinland Pfalz"]){
        return 20;
    }
    else {
        return 1;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    NSString *sectionName;
    if ([recipeNameUnter isEqualToString:@"Bayern"]){
    switch (section)
    {
        case 0:
            sectionName = @"A3";
            break;
        case 1:
            sectionName = @"A6";
            break;
        case 2:
            sectionName = @"A7";
            break;
        case 3:
            sectionName = @"A8 München - Salzburg";
            break;
        case 4:
            sectionName = @"A9";
            break;
        case 5:
            sectionName = @"A92";
            break;
        default:
            sectionName = @"";
            break;
    }
    }
    else if ([recipeNameUnter isEqualToString:@"Nordrhein Westfalen"]){
        switch (section)
        {
            case 0:
                sectionName = @"Kölner Ring";
                break;
            case 1:
                sectionName = @"Aachener Kreuz";
                break;
            case 2:
                sectionName = @"A1 Unna";
                break;
            case 3:
                sectionName = @"A2 Dortmund";
                break;
            case 4:
                sectionName = @"A3 Oberhausen";
                break;
            case 5:
                sectionName = @"A3 Duisburg";
                break;
            case 6:
                sectionName = @"A3 Köln";
                break;
            case 7:
                sectionName = @"A4 Aachen";
                break;
            case 8:
                sectionName = @"A4 Köln ";
                break;
            case 9:
                sectionName = @"A31";
                break;
            case 10:
                sectionName = @"A42";
                break;
            case 11:
                sectionName = @"A43";
                break;
            case 12:
                sectionName = @"A45";
                break;
            case 13:
                sectionName = @"A46 Düsseldorf";
                break;
            case 14:
                sectionName = @"A46 Wuppertal";
                break;
            case 15:
                sectionName = @"A52 Rattingen";
                break;
            case 16:
                sectionName = @"A57 Neuss";
                break;
            case 17:
                sectionName = @"A61";
                break;
            case 18:
                sectionName = @"Ring Bonn A555";
                break;
            case 19:
                sectionName = @"Ring Bonn A565";
                break;
            default:
                sectionName = @"";
                break;
        }
    }
    else if ([recipeNameUnter isEqualToString:@"Rheinland Pfalz"]){
        switch (section)
        {
            case 0:
                sectionName = @"A6 Richtung Sarbrücken";
                break;
            case 1:
                sectionName = @"A6 Richtung Frankenthal";
                break;
            case 2:
                sectionName = @"A60 Richtung Bingen";
                break;
            case 3:
                sectionName = @"A60 Richtung Rüsselsheim";
                break;
            case 4:
                sectionName = @"A61 Richtung Speyer";
                break;
            case 5:
                sectionName = @"A643 Richtung Bingen";
                break;
            case 6:
                sectionName = @"A643 Richtung Wiesbaden";
                break;
            case 7:
                sectionName = @"A63 Richtung Kaiserslautern";
                break;
            case 8:
                sectionName = @"A63 Richtung Mainz";
                break;
            case 9:
                sectionName = @"A65 Richtung Frankenthal";
                break;
            case 10:
                sectionName = @"A65 Richtung Karlsruhel";
                break;
            case 11:
                sectionName = @"A65/B10 Richtung Ludwigshafen";
                break;
            case 12:
                sectionName = @"A65/B10 Richtung Richtung Karlsruhe";
                break;
            case 13:
                sectionName = @"B10 Richtung Saarbrücken";
                break;
            case 14:
                sectionName = @"B10 Richtung Koblenz";
                break;
            case 15:
                sectionName = @"B9 Richtung Bonn";
                break;
            case 16:
                sectionName = @"Koblenz Richtung Koblenz";
                break;
            case 17:
                sectionName = @"Trier Richtung Trier";
                break;
            case 18:
                sectionName = @"Mainz Richtung Mainz";
                break;
            case 19:
                sectionName = @"Mainz Richtung Mainz";
                break;
            default:
                sectionName = @"";
                break;
        }
    }
    else{
        sectionName = @"";
    }
     return sectionName;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([recipeNameUnter isEqualToString:@"Bayern"]){
        switch (section) {
            case 0:
                return [text1 count];
                break;
            case 1:
                return [text2 count];
                break;
            case 2:
                return [text3 count];
                break;
            case 3:
                return [text4 count];
                break;
            case 4:
                return [text5 count];
                break;
            case 5:
                return [text6 count];
                break;
            default:
                return 1;
                break;
        }
    }
    else if ([recipeNameUnter isEqualToString:@"Nordrhein Westfalen"]){
        switch (section) {
            case 0:
                return 1;
                break;
            case 1:
                return 1;
                break;
            case 2:
                return [text3 count];
                break;
            case 3:
                return [text4 count];
                break;
            case 4:
                return [text5 count];
                break;
            case 5:
                return [text6 count];
                break;
            case 6:
                return [text7 count];
                break;
            case 7:
                return [text8 count];
                break;
            case 8:
                return [text9 count];
                break;
            case 9:
                return [text10 count];
                break;
            case 10:
                return [text11 count];
                break;
            case 11:
                return [text12 count];
                break;
            case 12:
                return [text13 count];
                break;
            case 13:
                return [text14 count];
                break;
            case 14:
                return [text15 count];
                break;
            case 15:
                return [text16 count];
                break;
            case 16:
                return [text17 count];
                break;
            case 17:
                return [text18 count];
                break;
            case 18:
                return [text19 count];
                break;
            case 19:
                return [text20 count];
                break;
            default:
                return 1;
                break;
        }
    }
    else if ([recipeNameUnter isEqualToString:@"Rheinland Pfalz"]){
    
    switch (section) {
        case 0:
            return [text1 count];
            break;
        case 1:
            return [text2 count];
            break;
        case 2:
            return [text3 count];
            break;
        case 3:
            return [text4 count];
            break;
        case 4:
            return [text5 count];
            break;
        case 5:
            return [text6 count];
            break;
        case 6:
            return [text7 count];
            break;
        case 7:
            return [text8 count];
            break;
        case 8:
            return [text9 count];
            break;
        case 9:
            return [text10 count];
            break;
        case 10:
            return [text11 count];
            break;
        case 11:
            return [text12 count];
            break;
        case 12:
            return [text13 count];
            break;
        case 13:
            return [text14 count];
            break;
        case 14:
            return [text15 count];
            break;
        case 15:
            return [text16 count];
            break;
        case 16:
            return [text17 count];
            break;
        case 17:
            return [text18 count];
            break;
        case 18:
            return [text19 count];
            break;
        case 19:
            return [text20 count];
            break;
        default:
            return 1;
            break;
    }
    }
    else {
        return [text1 count];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if ([recipeNameUnter isEqualToString:@"Bayern"]){
        if(indexPath.section == 0){
            cell.textLabel.text = [text1 objectAtIndex:indexPath.row];
            cell.detailTextLabel.text = [text1detail objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 1) {
            cell.textLabel.text = [text2 objectAtIndex:indexPath.row];
            cell.detailTextLabel.text = [text2detail objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 2) {
            cell.textLabel.text = [text3 objectAtIndex:indexPath.row];
            cell.detailTextLabel.text = [text3detail objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 3) {
            cell.textLabel.text = [text4 objectAtIndex:indexPath.row];
            cell.detailTextLabel.text = [text4detail objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 4) {
            cell.textLabel.text = [text5 objectAtIndex:indexPath.row];
            cell.detailTextLabel.text = [text5detail objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 5) {
            cell.textLabel.text = [text6 objectAtIndex:indexPath.row];
            cell.detailTextLabel.text = [text6detail objectAtIndex:indexPath.row];
        }
    }
    else if ([recipeNameUnter isEqualToString:@"Nordrhein Westfalen"]){
        if(indexPath.section == 0){
            cell.textLabel.text = @"Kölner Autobahnkreuz kommt noch.";
            //cell.textLabel.text = [text1 objectAtIndex:indexPath.row];
            //cell.detailTextLabel.text = [text1detail objectAtIndex:indexPath.row];
            
            
            
        }
        else if(indexPath.section == 1) {
            cell.textLabel.text = @"Aachener Autobahnkreuz kommt noch.";
            //cell.textLabel.text = [text2 objectAtIndex:indexPath.row];
            //cell.detailTextLabel.text = [text2detail objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 2) {
            cell.textLabel.text = [text3 objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 3) {
            cell.textLabel.text = [text4 objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 4) {
            cell.textLabel.text = [text5 objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 5) {
            cell.textLabel.text = [text6 objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 6) {
            cell.textLabel.text = [text7 objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 7) {
            cell.textLabel.text = [text8 objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 8) {
            cell.textLabel.text = [text9 objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 9) {
            cell.textLabel.text = [text10 objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 10) {
            cell.textLabel.text = [text11 objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 11) {
            cell.textLabel.text = [text12 objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 12) {
            cell.textLabel.text = [text13 objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 13) {
            cell.textLabel.text = [text14 objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 14) {
            cell.textLabel.text = [text15 objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 15) {
            cell.textLabel.text = [text16 objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 16) {
            cell.textLabel.text = [text17 objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 17) {
            cell.textLabel.text = [text18 objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 18) {
            cell.textLabel.text = [text19 objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 19) {
            cell.textLabel.text = [text20 objectAtIndex:indexPath.row];
        }
    }
    else if ([recipeNameUnter isEqualToString:@"Rheinland Pfalz"]){
        if(indexPath.section == 0){
            cell.textLabel.text = [text1 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 1) {
            cell.textLabel.text = [text2 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 2) {
            cell.textLabel.text = [text3 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 3) {
            cell.textLabel.text = [text4 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 4) {
            cell.textLabel.text = [text5 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 5) {
            cell.textLabel.text = [text6 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 6) {
            cell.textLabel.text = [text7 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 7) {
            cell.textLabel.text = [text8 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 8) {
            cell.textLabel.text = [text9 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 9) {
            cell.textLabel.text = [text10 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 10) {
            cell.textLabel.text = [text11 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 11) {
            cell.textLabel.text = [text12 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 12) {
            cell.textLabel.text = [text13 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 13) {
            cell.textLabel.text = [text14 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 14) {
            cell.textLabel.text = [text15 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 15) {
            cell.textLabel.text = [text16 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 16) {
            cell.textLabel.text = [text17 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 17) {
            cell.textLabel.text = [text18 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 18) {
            cell.textLabel.text = [text19 objectAtIndex:indexPath.row];}
        else if(indexPath.section == 19) {
            cell.textLabel.text = [text20 objectAtIndex:indexPath.row];}
    }
    else{
    cell.textLabel.text = [text1 objectAtIndex:indexPath.row];
    cell.textLabel.numberOfLines = 2;
    }
    return cell;
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.myWebView == nil)
    {
        MyWebView *temp = [[MyWebView alloc] initWithNibName:@"MyWebView" bundle:[NSBundle mainBundle]];
        self.myWebView = temp;
    }
    if (indexPath.section == 0) {
        myWebView.htmlFile = [url1 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text1 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 1){
        myWebView.htmlFile = [url2 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text2 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 2){
        myWebView.htmlFile = [url3 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text3 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 3){
        myWebView.htmlFile = [url4 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text4 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 4){
        myWebView.htmlFile = [url5 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text5 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 5){
        myWebView.htmlFile = [url6 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text6 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 6){
        myWebView.htmlFile = [url7 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text7 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 7){
        myWebView.htmlFile = [url8 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text8 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 8){
        myWebView.htmlFile = [url9 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text9 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 9){
        myWebView.htmlFile = [url10 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text10 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 10){
        myWebView.htmlFile = [url11 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text11 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 11){
        myWebView.htmlFile = [url12 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text12 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 12){
        myWebView.htmlFile = [url13 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text13 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 13){
        myWebView.htmlFile = [url14 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text14 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 14){
        myWebView.htmlFile = [url15 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text15 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 15){
        myWebView.htmlFile = [url16 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text16 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 16){
        myWebView.htmlFile = [url17 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text17 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 17){
        myWebView.htmlFile = [url18 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text18 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 18){
        myWebView.htmlFile = [url19 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text19 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 19){
        myWebView.htmlFile = [url20 objectAtIndex:indexPath.row];
        myWebView.Tittel = [text20 objectAtIndex:indexPath.row];
    }
    
    [self.navigationController pushViewController:myWebView animated:YES];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
