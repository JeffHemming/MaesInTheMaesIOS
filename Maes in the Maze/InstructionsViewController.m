//
//  InstructionsViewController.m
//  Maes in the Maze
//
//  Created by student on 4/13/15.
//  Copyright (c) 2015 Hemming. All rights reserved.
//

#import "InstructionsViewController.h"

@interface InstructionsViewController ()

@end

@implementation InstructionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *instructionTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 120, 800, 100)];
    instructionTitle.text=@"Instructions";
    instructionTitle.textAlignment=NSTextAlignmentCenter;
    [instructionTitle setFont:[UIFont fontWithName:@"Georgia" size:42]];
    [self.view addSubview:instructionTitle];
    
    UIImage *maesImage=[UIImage imageNamed:@"maes"];
    UIImageView *maesImageView=[[UIImageView alloc] initWithFrame:CGRectMake(100, 300, 80, 80)];
    maesImageView.image=maesImage;
    maesImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:maesImageView];
    
    UITextView *maesInfo = [[UITextView alloc] initWithFrame:CGRectMake(200, 280, 460, 200)];
    maesInfo.text=@"This is Maes.\nMaes is four years old.  His older brother, Finn, and his two sisters, Nadia and Gwendolyn, have been lost in The Maze, a deadly labyrinth.  It's up to Maes to save them.  You can move Maes by swiping in the direction you want him to go.";
    maesInfo.userInteractionEnabled=NO;
    [maesInfo setFont:[UIFont fontWithName:@"Georgia" size:20]];
    maesInfo.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:maesInfo];
    
    UIImage *turretImage=[UIImage imageNamed:@"turret2"];
    UIImageView *turretImageView=[[UIImageView alloc] initWithFrame:CGRectMake(100, 500, 80, 80)];
    turretImageView.image=turretImage;
    turretImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:turretImageView];
    
    UITextView *turretInfo = [[UITextView alloc] initWithFrame:CGRectMake(200, 480, 460, 200)];
    turretInfo.text=@"This is a Turret.\nTurrets shoot lasers.  If Maes is hit by a laser, he will die.  Don't let Maes die.  Turrets turn clockwise.  Every time Maes moves, all turrets will turn and fire.  Their lasers will be blocked by walls or other turrets.";
    turretInfo.userInteractionEnabled=NO;
    [turretInfo setFont:[UIFont fontWithName:@"Georgia" size:20]];
    turretInfo.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:turretInfo];
    
    UIImage *goalImage=[UIImage imageNamed:@"goal"];
    UIImageView *goalImageView=[[UIImageView alloc] initWithFrame:CGRectMake(100, 700, 80, 80)];
    goalImageView.image=goalImage;
    goalImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:goalImageView];
    
    UITextView *goalInfo = [[UITextView alloc] initWithFrame:CGRectMake(200, 680, 460, 200)];
    goalInfo.text=@"This is a Portal.\nPortals will lead Maes to the next level of the Maze.  Get to the portal as quickly as possible.  But watch out for lasers.";
    goalInfo.userInteractionEnabled=NO;
    [goalInfo setFont:[UIFont fontWithName:@"Georgia" size:20]];
    goalInfo.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:goalInfo];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
