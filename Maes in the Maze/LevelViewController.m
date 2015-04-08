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

@interface LevelViewController ()
@property (nonatomic, strong) Maes *maes;
@property (nonatomic, strong) UILabel *maesLabel;
@property (nonatomic, strong) NSMutableArray *turretList;
@end

@implementation LevelViewController
-(instancetype)init
{
    self = [super init];
    if(self)
    {
        self.view.backgroundColor = [UIColor blackColor];
        
        
        UITextView *levelTitle = [[UITextView alloc] initWithFrame:CGRectMake(300, 700, 200, 200)];
        switch ([Model sharedInstance].currentLevel){
            case 1: levelTitle.text=@"Level 1 \nMaes sets out into the Maze...";
                break;
            case 2:levelTitle.text=@"Level 2 \nNot too bad so far...";
                break;
            case 3:levelTitle.text=@"Level 3 \nMaes's big brother, Finn, is somewhere on this level...";
                break;
            case 4:levelTitle.text=@"Level 4 \nWith Finn safe, it's time to find Maes's sisters...";
                break;
            case 5:levelTitle.text=@"Level 5 \nThings are starting to get tricky...";
                break;
            case 6:levelTitle.text=@"Level 6 \nMaes's older sister, Nadia, is here, somewhere...";
                break;
            case 7:levelTitle.text=@"Level 7 \nTwo siblings down, one to go...";
                break;
            case 8:levelTitle.text=@"Level 8 \nDespite the danger, Maes knows he's getting close...";
                break;
            case 9:levelTitle.text=@"Level 9 \nMaes's baby sister, Gwendolyn, is here.  Almost done...";
                break;
        }
        levelTitle.textColor=[UIColor whiteColor];
        levelTitle.userInteractionEnabled=NO;
        levelTitle.backgroundColor=[UIColor blackColor];
        levelTitle.textAlignment=NSTextAlignmentCenter;
        [self.view addSubview:levelTitle];
        
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
