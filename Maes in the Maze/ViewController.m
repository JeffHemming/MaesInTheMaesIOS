//
//  ViewController.m
//  Maes in the Maze
//
//  Created by student on 3/30/15.
//  Copyright (c) 2015 Hemming. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "LevelSelectViewController.h"
#import "LevelViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *mMTitle = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 500, 100)];
    mMTitle.text=@"Maes in the Maze";
    [mMTitle setFont:[UIFont fontWithName:@"Georgia" size:64]];
    mMTitle.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:mMTitle];
    
    UIButton *newGame = [[UIButton alloc] initWithFrame:CGRectMake(80,100,448,100)];
    [newGame setTitle:@"New Game" forState:UIControlStateNormal];
    [newGame setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [newGame setBackgroundColor:[UIColor grayColor]];
    [newGame addTarget:self action:@selector(startNewGame) forControlEvents:UIControlEventTouchUpInside];
    newGame.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:newGame];
    
    UIButton *selectLevel = [[UIButton alloc] initWithFrame:CGRectMake(180,100,448,100)];
    [selectLevel setTitle:@"Select Level" forState:UIControlStateNormal];
    [selectLevel setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [selectLevel setBackgroundColor:[UIColor grayColor]];
    [selectLevel addTarget:self action:@selector(pushSelectLevel) forControlEvents:UIControlEventTouchUpInside];
    selectLevel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:selectLevel];
    
    UIButton *instructions = [[UIButton alloc] initWithFrame:CGRectMake(280,100,448,100)];
    [instructions setTitle:@"Instructions" forState:UIControlStateNormal];
    [instructions setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [instructions setBackgroundColor:[UIColor grayColor]];
    [instructions addTarget:self action:@selector(pushInstructions) forControlEvents:UIControlEventTouchUpInside];
    instructions.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:instructions];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                               @"H:|-200-[NG]-200-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:@{@"NG" : newGame}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                               @"V:|-400-[MMT]-300-[NG]-20-[SL]-20-[I]"
                                                                      options:kNilOptions
                                                                      metrics:nil
                                                                        views:@{@"MMT" : mMTitle,
                                                                                @"NG" : newGame,
                                                                                @"SL" : selectLevel,
                                                                                @"I" : instructions}]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:mMTitle
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:selectLevel
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:newGame
                                                          attribute:NSLayoutAttributeLeft
                                                          multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:instructions
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:newGame
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:selectLevel
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:newGame
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:instructions
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:newGame
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:0]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startNewGame
{
    [Model sharedInstance].currentLevel=1;
    LevelViewController *levelView = [[LevelViewController alloc] init];
    [self.navigationController pushViewController:levelView animated:YES];
    //code for a new level, level 1;
}

-(void)pushSelectLevel
{
    //code to push the Select Level view
    LevelSelectViewController *selectLevelView = [[LevelSelectViewController alloc] init];
    [self.navigationController pushViewController:selectLevelView animated:YES];
}

-(void)pushInstructions
{
    //code to push the Instructions view
}
@end
