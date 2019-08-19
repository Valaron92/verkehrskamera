//
//  Verkehrkamera
//
//  Copyright (c) 2014 Markus. All rights reserved.
//
#import "MyWebView.h"
#import "MZTimerLabel.h"
#define ZOOM_VIEW_TAG 100
#define ZOOM_STEP 1.5
@interface MyWebView ()
- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center;
@property (strong, nonatomic) NSURLConnection *connectionManager;
@property (strong, nonatomic) NSMutableData *downloadedMutableData;
@property (strong, nonatomic) NSURLResponse *urlResponse;
@end

@implementation MyWebView
@synthesize htmlFile,imageb,navbar,urllabel,Tittel,titelheadr,land;
@synthesize imageScrollView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.title = Tittel;
    _lblTimerExample3.text = @"01:02";
    NSLog(@"%@",_lblTimerExample3);
}

- (void)viewDidAppear:(BOOL)animated{
    self.downloadedMutableData = [[NSMutableData alloc] init];
     NSLog(@"%@", htmlFile);
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:htmlFile]
                                                cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                            timeoutInterval:60.0];
    self.connectionManager = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Reload"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(nachladen)];
    self.navigationItem.rightBarButtonItem = flipButton;
    NSLog(@"2 %@",_lblTimerExample3);
    [super viewDidAppear:YES];
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad{
 [super viewDidLoad];
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:61.0 target:self selector:@selector(nachladen) userInfo:nil repeats:YES];
    NSMutableDictionary *event =
    [[GAIDictionaryBuilder createEventWithCategory:land
                                            action:@"table_Press"
                                             label:Tittel
                                             value:nil] build];
    [[GAI sharedInstance].defaultTracker send:event];
    /*******************************************
     * Count Down Timer
     ********************************************/
    timerExample3 = [[MZTimerLabel alloc] initWithLabel:_lblTimerExample3 andTimerType:MZTimerLabelTypeTimer];
    [timerExample3 setCountDownTime:1*61];
    [timerExample3 startWithEndingBlock:^(NSTimeInterval countTime) {
        timerExample3.timeLabel.text = @"00:00";
    
    timerExample3.delegate = self;
    }];
    NSLog(@"3 %@",_lblTimerExample3);
}

-(void)viewDidUnload{
    self.title = nil;
    self.imageb.image = nil;
    self.htmlFile = nil;
    self.myTimer = nil;
    [self.myTimer invalidate];
    [super viewDidUnload];
    [timerExample3 reset];
    self.imageScrollView = nil;
    [self.imageScrollView setMaximumZoomScale:5.0f];
    [self.imageScrollView setClipsToBounds:YES];
}
-(void)viewDidDisappear:(BOOL)animated{
    self.title = nil;
    self.imageb.image = nil;
    self.htmlFile = nil;
    [self.myTimer invalidate];
    self.myTimer = nil;
     [timerExample3 reset];
    [super viewDidDisappear:YES];
}

-(void) nachladen{
    self.downloadedMutableData = [[NSMutableData alloc] init];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:htmlFile]
                                                cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                            timeoutInterval:60.0];
    self.counter++;
    NSString *myNumber = [[NSString alloc]initWithFormat:@"%d", self.counter];
    NSLog(@"%@", myNumber);
    self.connectionManager = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    NSLog(@"%@", htmlFile);
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Delegate Methods
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"%lld", response.expectedContentLength);
    self.urlResponse = response;
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    [self.downloadedMutableData appendData:data];
    self.progressView.progress = ((100.0/self.urlResponse.expectedContentLength)*self.downloadedMutableData.length)/100;
    float per = ((100.0/self.urlResponse.expectedContentLength)*self.downloadedMutableData.length);
    self.title =  [NSString stringWithFormat:@"%0.f%%", per];
    if (self.progressView.progress == 1) {
        self.progressView.hidden = YES;
    } else {
        self.progressView.hidden = NO;
    }
    [timerExample3 reset];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    self.imageb.image = [UIImage imageWithData:self.downloadedMutableData];
    self.title = @"Fertig";
    [timerExample3 reset];
       [timerExample3 start];
    [self performSelector:@selector(zeigetitel) withObject:nil afterDelay:5];
}

- (void)zeigetitel{
    self.title = Tittel;
}

- (void)loadView {
    [super loadView];
    [imageb setTag:ZOOM_VIEW_TAG];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    UITapGestureRecognizer *twoFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTwoFingerTap:)];
    [doubleTap setNumberOfTapsRequired:2];
    [twoFingerTap setNumberOfTouchesRequired:2];
    [imageb addGestureRecognizer:singleTap];
    [imageb addGestureRecognizer:doubleTap];
    [imageb addGestureRecognizer:twoFingerTap];
    float minimumScale = [imageScrollView frame].size.width  / [imageb frame].size.width;
    [imageScrollView setMinimumZoomScale:minimumScale];
    [imageScrollView setZoomScale:minimumScale];
}

#pragma mark UIScrollViewDelegate methods
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollViewt {
    return [imageScrollView viewWithTag:ZOOM_VIEW_TAG];
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    [scrollView setZoomScale:scale+0.01 animated:NO];
    [scrollView setZoomScale:scale animated:NO];
}

#pragma mark TapDetectingImageViewDelegate methods

- (void)handleSingleTap:(UIGestureRecognizer *)gestureRecognizer {
}

- (void)handleDoubleTap:(UIGestureRecognizer *)gestureRecognizer {
    float newScale = [imageScrollView zoomScale] * ZOOM_STEP;
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
    [imageScrollView zoomToRect:zoomRect animated:YES];
}

- (void)handleTwoFingerTap:(UIGestureRecognizer *)gestureRecognizer {
    // two-finger tap zooms out
    float newScale = [imageScrollView zoomScale] / ZOOM_STEP;
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
    [imageScrollView zoomToRect:zoomRect animated:YES];
}

#pragma mark Utility methods

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center {
    CGRect zoomRect;
    zoomRect.size.height = [imageScrollView frame].size.height / scale;
    zoomRect.size.width  = [imageScrollView frame].size.width  / scale;
    zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0);
    return zoomRect;
}

@end
