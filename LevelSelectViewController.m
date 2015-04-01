//
//  LevelSelectViewController.m
//  Maes in the Maze
//
//  Created by Student User on 4/1/15.
//  Copyright (c) 2015 Hemming. All rights reserved.
//

#import "LevelSelectViewController.h"
#import "Model.h"

@interface LevelSelectViewController ()

@end

@implementation LevelSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *mMTitle = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 500, 100)];
    mMTitle.text=@"Select a Level";
    [mMTitle setFont:[UIFont fontWithName:@"Georgia" size:48]];
    mMTitle.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:mMTitle];
    
    UIButton *one = [[UIButton alloc] initWithFrame:CGRectMake(80,100,448,100)];
    [one setTitle:@"Level 1" forState:UIControlStateNormal];
    [one setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [one setBackgroundColor:[UIColor grayColor]];
    [one addTarget:self action:@selector(setCurrent1) forControlEvents:UIControlEventTouchUpInside];
    one.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:one];
    
    UIButton *two = [[UIButton alloc] initWithFrame:CGRectMake(80,100,448,100)];
    [two setTitle:@"Level 2" forState:UIControlStateNormal];
    [two setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [two setBackgroundColor:[UIColor grayColor]];
    [two addTarget:self action:@selector(setCurrent2) forControlEvents:UIControlEventTouchUpInside];
    two.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:two];
    
    UIButton *three = [[UIButton alloc] initWithFrame:CGRectMake(80,100,448,100)];
    [three setTitle:@"Level 3" forState:UIControlStateNormal];
    [three setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [three setBackgroundColor:[UIColor grayColor]];
    [three addTarget:self action:@selector(setCurrent3) forControlEvents:UIControlEventTouchUpInside];
    three.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:three];
    
    UIButton *four = [[UIButton alloc] initWithFrame:CGRectMake(80,100,448,100)];
    [four setTitle:@"Level 4" forState:UIControlStateNormal];
    [four setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [four setBackgroundColor:[UIColor grayColor]];
    [four addTarget:self action:@selector(setCurrent4) forControlEvents:UIControlEventTouchUpInside];
    four.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:four];
    
    UIButton *five = [[UIButton alloc] initWithFrame:CGRectMake(80,100,448,100)];
    [five setTitle:@"Level 5" forState:UIControlStateNormal];
    [five setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [five setBackgroundColor:[UIColor grayColor]];
    [five addTarget:self action:@selector(setCurrent5) forControlEvents:UIControlEventTouchUpInside];
    five.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:five];
    
    UIButton *six = [[UIButton alloc] initWithFrame:CGRectMake(80,100,448,100)];
    [six setTitle:@"Level 6" forState:UIControlStateNormal];
    [six setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [six setBackgroundColor:[UIColor grayColor]];
    [six addTarget:self action:@selector(setCurrent6) forControlEvents:UIControlEventTouchUpInside];
    six.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:six];
    
    UIButton *seven = [[UIButton alloc] initWithFrame:CGRectMake(80,100,448,100)];
    [seven setTitle:@"Level 7" forState:UIControlStateNormal];
    [seven setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [seven setBackgroundColor:[UIColor grayColor]];
    [seven addTarget:self action:@selector(setCurrent7) forControlEvents:UIControlEventTouchUpInside];
    seven.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:seven];
    
    UIButton *eight = [[UIButton alloc] initWithFrame:CGRectMake(80,100,448,100)];
    [eight setTitle:@"Level 8" forState:UIControlStateNormal];
    [eight setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [eight setBackgroundColor:[UIColor grayColor]];
    [eight addTarget:self action:@selector(setCurrent8) forControlEvents:UIControlEventTouchUpInside];
    eight.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:eight];
    
    UIButton *nine = [[UIButton alloc] initWithFrame:CGRectMake(80,100,448,100)];
    [nine setTitle:@"Level 9" forState:UIControlStateNormal];
    [nine setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [nine setBackgroundColor:[UIColor grayColor]];
    [nine addTarget:self action:@selector(setCurrent9) forControlEvents:UIControlEventTouchUpInside];
    nine.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:nine];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                               @"H:|-100-[ONE]-100-[TWO]-100-[THREE]-100-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:@{@"ONE" : one,
                                                                                @"TWO" : two,
                                                                                @"THREE" : three}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                               @"H:|-100-[ONE]-100-[TWO]-100-[THREE]-100-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:@{@"ONE" : four,
                                                                                @"TWO" : five,
                                                                                @"THREE" : six}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                               @"H:|-100-[ONE]-100-[TWO]-100-[THREE]-100-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:@{@"ONE" : seven,
                                                                                @"TWO" : eight,
                                                                                @"THREE" : nine}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                               @"V:|-160-[MMT]-200-[ONE]-80-[FOUR]-80-[SEVEN]"
                                                                      options:kNilOptions
                                                                      metrics:nil
                                                                        views:@{@"MMT" : mMTitle,
                                                                                @"ONE" : one,
                                                                                @"FOUR" : four,
                                                                                @"SEVEN" : seven}]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:mMTitle
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:two
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:one
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:three
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:one
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:five
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:four
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:six
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:four
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:eight
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:four
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:nine
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:four
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:four
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:one
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:seven
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:one
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:four
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:one
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:seven
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:one
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:two
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:one
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:three
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:one
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:two
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:one
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:three
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:one
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:five
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:four
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:six
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:four
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:six
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:four
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:five
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:four
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:eight
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:seven
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:nine
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:seven
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:eight
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:seven
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:nine
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:seven
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0]];
    
    if([Model sharedInstance].maxLevel<9)nine.hidden=YES;
    else nine.hidden=NO;
    if([Model sharedInstance].maxLevel<8)eight.hidden=YES;
    else eight.hidden=NO;
    if([Model sharedInstance].maxLevel<7)seven.hidden=YES;
    else seven.hidden=NO;
    if([Model sharedInstance].maxLevel<6)six.hidden=YES;
    else six.hidden=NO;
    if([Model sharedInstance].maxLevel<5)five.hidden=YES;
    else five.hidden=NO;
    if([Model sharedInstance].maxLevel<4)four.hidden=YES;
    else four.hidden=NO;
    if([Model sharedInstance].maxLevel<3)three.hidden=YES;
    else three.hidden=NO;
    if([Model sharedInstance].maxLevel<2)two.hidden=YES;
    else two.hidden=NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setCurrent1
{
    [Model sharedInstance].currentLevel=1;
    [self startLevel];
}
-(void)setCurrent2
{
    [Model sharedInstance].currentLevel=2;
    [self startLevel];
}
-(void)setCurrent3
{
    [Model sharedInstance].currentLevel=3;
    [self startLevel];
}
-(void)setCurrent4
{
    [Model sharedInstance].currentLevel=4;
    [self startLevel];
}
-(void)setCurrent5
{
    [Model sharedInstance].currentLevel=5;
    [self startLevel];
}
-(void)setCurrent6
{
    [Model sharedInstance].currentLevel=6;
    [self startLevel];
}
-(void)setCurrent7
{
    [Model sharedInstance].currentLevel=7;
    [self startLevel];
}
-(void)setCurrent8
{
    [Model sharedInstance].currentLevel=8;
    [self startLevel];
}
-(void)setCurrent9
{
    [Model sharedInstance].currentLevel=9;
    [self startLevel];
}
-(void)startLevel
{
    //code for pushing new level;
}

@end

