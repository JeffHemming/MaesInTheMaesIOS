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
@property (nonatomic, strong) UILabel *tl1;
@property (nonatomic, strong) UILabel *tl2;
@property (nonatomic, strong) UILabel *tl3;
@property (nonatomic, strong) UILabel *tl4;
@property (nonatomic, strong) UILabel *tl5;
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
        UITextView *levelTitle = [[UITextView alloc] initWithFrame:CGRectMake(300, 840, 200, 160)];
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
        UILabel *bottomBorder=[[UILabel alloc] initWithFrame:CGRectMake(40, 820, 680, 20)];
        bottomBorder.backgroundColor=[UIColor yellowColor];
        [self.view addSubview:bottomBorder];
        UILabel *leftBorder=[[UILabel alloc] initWithFrame:CGRectMake(40, 160, 20, 680)];
        leftBorder.backgroundColor=[UIColor yellowColor];
        [self.view addSubview:leftBorder];
        UILabel *rightBorder=[[UILabel alloc] initWithFrame:CGRectMake(700, 160, 20, 680)];
        rightBorder.backgroundColor=[UIColor yellowColor];
        [self.view addSubview:rightBorder];
        
        
        
        //Paint walls
        for( NSInteger i=0;i<8;i++){
            for(NSInteger j=0;j<8;j++){
                if([[[self.lev.rows objectAtIndex:i] objectAtIndex: j] isEqual:@"w"]){
                    UILabel *wall=[[UILabel alloc] initWithFrame:CGRectMake(j*80+60, i*80+180, 80, 80)];
                    wall.backgroundColor=[UIColor yellowColor];
                    [self.view addSubview:wall];
                }
                else if(i==0||[[[self.lev.rows objectAtIndex:i-1] objectAtIndex: j] isEqual:@"w"]){
                    UILabel *halfwall=[[UILabel alloc] initWithFrame:CGRectMake(j*80+60, i*80+180, 80, 80)];
                    halfwall.backgroundColor=[UIColor cyanColor];
                    [self.view addSubview:halfwall];
                }
            }
        }
        
        //Place turrets
        self.tl1=[[UILabel alloc] initWithFrame:CGRectMake(self.lev.t1.x*80+60, self.lev.t1.y*80+180, 80, 80)];
        self.tl1.backgroundColor=[UIColor redColor];
        [self.view addSubview:self.tl1];
        
        self.tl2=[[UILabel alloc] initWithFrame:CGRectMake(self.lev.t2.x*80+60, self.lev.t2.y*80+180, 80, 80)];
        self.tl2.backgroundColor=[UIColor redColor];
        [self.view addSubview:self.tl2];
        
        self.tl3=[[UILabel alloc] initWithFrame:CGRectMake(self.lev.t3.x*80+60, self.lev.t3.y*80+180, 80, 80)];
        self.tl3.backgroundColor=[UIColor redColor];
        [self.view addSubview:self.tl3];
        
        self.tl4=[[UILabel alloc] initWithFrame:CGRectMake(self.lev.t4.x*80+60, self.lev.t4.y*80+180, 80, 80)];
        self.tl4.backgroundColor=[UIColor redColor];
        [self.view addSubview:self.tl4];
        
        self.tl5=[[UILabel alloc] initWithFrame:CGRectMake(self.lev.t5.x*80+60, self.lev.t5.y*80+180, 80, 80)];
        self.tl5.backgroundColor=[UIColor redColor];
        [self.view addSubview:self.tl5];
        
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
