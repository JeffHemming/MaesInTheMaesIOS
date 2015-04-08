//
//  LevelViewController.m
//  Maes in the Maze
//
//  Created by student on 4/3/15.
//  Copyright (c) 2015 Hemming. All rights reserved.
//

#import "LevelViewController.h"
#import "Model.h"
#import "Maes.h"
#import "Level.h"

@interface LevelViewController ()
@property (nonatomic, strong) Maes *maes;
@property (nonatomic, strong) Level *lev;
@property (nonatomic, strong) UILabel *maesLabel;
@property (nonatomic, strong) UILabel *t1;
@property (nonatomic, strong) UILabel *t2;
@property (nonatomic, strong) UILabel *t3;
@property (nonatomic, strong) UILabel *t4;
@property (nonatomic, strong) UILabel *t5;
@property (nonatomic, strong) NSMutableArray *turretList;
@end

@implementation LevelViewController
-(instancetype)init
{
    self = [super init];
    if(self)
    {
        self.view.backgroundColor = [UIColor blackColor];
        self.lev = [[Level alloc] initWithCurrent:[Model sharedInstance].currentLevel];
        self.maes = [[Maes alloc] init];
        UITextView *levelTitle = [[UITextView alloc] initWithFrame:CGRectMake(300, 860, 200, 160)];
        levelTitle.text=self.lev.desc;

        //Level Title and Description
        levelTitle.textColor=[UIColor whiteColor];
        levelTitle.userInteractionEnabled=NO;
        levelTitle.backgroundColor=[UIColor blackColor];
        levelTitle.textAlignment=NSTextAlignmentCenter;
        [self.view addSubview:levelTitle];
        
        //Border around Maze
        UILabel *topBorder=[[UILabel alloc] initWithFrame:CGRectMake(40, 160, 680, 20)];
        topBorder.backgroundColor=[UIColor yellowColor];
        [self.view addSubview:topBorder];
        UILabel *bottomBorder=[[UILabel alloc] initWithFrame:CGRectMake(40, 840, 680, 20)];
        bottomBorder.backgroundColor=[UIColor yellowColor];
        [self.view addSubview:bottomBorder];
        UILabel *leftBorder=[[UILabel alloc] initWithFrame:CGRectMake(40, 160, 20, 680)];
        leftBorder.backgroundColor=[UIColor yellowColor];
        [self.view addSubview:leftBorder];
        UILabel *rightBorder=[[UILabel alloc] initWithFrame:CGRectMake(700, 160, 20, 680)];
        rightBorder.backgroundColor=[UIColor yellowColor];
        [self.view addSubview:rightBorder];
        
        //Maes label
        self.maesLabel=[[UILabel alloc] initWithFrame:CGRectMake(60, 180, 80, 80)];
        self.maesLabel.backgroundColor=[UIColor greenColor];
        [self.view addSubview:self.maesLabel];
        
    }
    return self;
}

-(void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

// this is called right before the view will be displayed
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


@end
