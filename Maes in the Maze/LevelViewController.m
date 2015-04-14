//
//  LevelViewController.m
//  Maes in the Maze
//
//  Created by student on 4/3/15.
//  Copyright (c) 2015 Hemming. All rights reserved.
//

#import "LevelViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "Model.h"
#import "Maes.h"
#import "Level.h"

@interface LevelViewController ()
@property (nonatomic, strong) Maes *maes;
@property (nonatomic, strong) Level *lev;
@property (nonatomic, strong) UIImageView *maesLabel;
@property (nonatomic, strong) UIImageView *tl1;
@property (nonatomic, strong) UIImageView *tl2;
@property (nonatomic, strong) UIImageView *tl3;
@property (nonatomic, strong) UIImageView *tl4;
@property (nonatomic, strong) UIImageView *tl5;
@property (nonatomic, strong) NSMutableArray *turretList;
@property (nonatomic, strong) UIImage *hLaserImage;
@property (nonatomic, strong) UIImage *vLaserImage;
@property (nonatomic, strong) UILabel *dead;
@property (nonatomic, strong) AVAudioPlayer *laserSound;
@property (nonatomic, strong) AVAudioPlayer *turnSound;
@property (nonatomic, strong) AVAudioPlayer *deathSound;
@property (nonatomic, strong) AVAudioPlayer *portalSound;
@property (nonatomic, assign) BOOL canMove;
@end

@implementation LevelViewController
-(instancetype)init
{
    self = [super init];
    if(self)
    {
        self.view.backgroundColor = [UIColor blackColor];
        self.lev = [[Level alloc] initWithCurrent:[Model sharedInstance].currentLevel];
        self.canMove=YES;
        [self.turretList addObject:self.lev.t1];
        [self.turretList addObject:self.lev.t2];
        [self.turretList addObject:self.lev.t3];
        [self.turretList addObject:self.lev.t4];
        [self.turretList addObject:self.lev.t5];
        self.maes = [[Maes alloc] init];
        UITextView *levelTitle = [[UITextView alloc] initWithFrame:CGRectMake(300, 840, 200, 160)];
        levelTitle.text=self.lev.desc;
        
        //Audio
        NSURL *laserURL = [[NSBundle mainBundle] URLForResource:@"Laser" withExtension:@"wav"];
        self.laserSound = [[AVAudioPlayer alloc] initWithContentsOfURL:laserURL error:nil];
        [self.laserSound prepareToPlay];
        
        NSURL *turnURL =[[NSBundle mainBundle] URLForResource:@"Turn" withExtension:@"wav"];
        self.turnSound = [[AVAudioPlayer alloc] initWithContentsOfURL:turnURL error:nil];
        [self.turnSound prepareToPlay];

        NSURL *deathURL =[[NSBundle mainBundle] URLForResource:@"Mystery" withExtension:@"wav"];
        self.deathSound = [[AVAudioPlayer alloc] initWithContentsOfURL:deathURL error:nil];
        [self.deathSound prepareToPlay];
        
        NSURL *portalURL =[[NSBundle mainBundle] URLForResource:@"Egress" withExtension:@"wav"];
        self.portalSound = [[AVAudioPlayer alloc] initWithContentsOfURL:portalURL error:nil];
        [self.portalSound prepareToPlay];

        //Level Title and Description
        levelTitle.textColor=[UIColor whiteColor];
        levelTitle.userInteractionEnabled=NO;
        levelTitle.backgroundColor=[UIColor blackColor];
        levelTitle.textAlignment=NSTextAlignmentCenter;
        [self.view addSubview:levelTitle];
        
        //Border around Maze
        UIImage *top = [UIImage imageNamed:@"top2"];
        for(NSInteger i=0;i<10;i++){
            UIImageView *wall=[[UIImageView alloc] initWithFrame:CGRectMake(i*80-20, 100, 80, 80)];
            wall.image=top;
            wall.contentMode = UIViewContentModeScaleAspectFill;
            [self.view addSubview:wall];
        }
        for(NSInteger i=0;i<10;i++){
            UIImageView *wall=[[UIImageView alloc] initWithFrame:CGRectMake(i*80-20, 820, 80, 80)];
            wall.image=top;
            wall.contentMode = UIViewContentModeScaleAspectFill;
            [self.view addSubview:wall];
        }
        for(NSInteger i=0;i<10;i++){
            UIImageView *wall=[[UIImageView alloc] initWithFrame:CGRectMake(-20, i*80+100, 80, 80)];
            wall.image=top;
            wall.contentMode = UIViewContentModeScaleAspectFill;
            [self.view addSubview:wall];
        }
        for(NSInteger i=0;i<10;i++){
            UIImageView *wall=[[UIImageView alloc] initWithFrame:CGRectMake(700, i*80+100, 80, 80)];
            wall.image=top;
            wall.contentMode = UIViewContentModeScaleAspectFill;
            [self.view addSubview:wall];
        }
        
        //Paint walls
        for( NSInteger i=0;i<8;i++){
            for(NSInteger j=0;j<8;j++){
                if([[[self.lev.rows objectAtIndex:i] objectAtIndex: j] isEqual:@"w"]){
                    UIImageView *wall=[[UIImageView alloc] initWithFrame:CGRectMake(j*80+60, i*80+180, 80, 80)];
                    wall.image=top;
                    wall.contentMode = UIViewContentModeScaleAspectFill;
                    [self.view addSubview:wall];
                }
                else if(i==0||[[[self.lev.rows objectAtIndex:i-1] objectAtIndex: j] isEqual:@"w"]){
                    UIImageView *halfwall=[[UIImageView alloc] initWithFrame:CGRectMake(j*80+60, i*80+180, 80, 80)];
                    UIImage *hwall =[UIImage imageNamed:@"wall2"];
                    halfwall.image=hwall;
                    halfwall.contentMode= UIViewContentModeScaleAspectFill;
                    [self.view addSubview:halfwall];
                }
            }
        }
        
        //Place turrets
        
        self.tl1=[[UIImageView alloc] initWithFrame:CGRectMake(self.lev.t1.x*80+60, self.lev.t1.y*80+180, 80, 80)];
        UIImage *turretImage=[UIImage imageNamed:@"turret2"];
        self.tl1.image=turretImage;
        //self.tl1.contentMode=UIViewContentModeScaleAspectFill;
        self.tl1.layer.anchorPoint = CGPointMake(0.5,0.5);
        CGFloat angle = (self.lev.t1.face * 90 - 90) * (M_PI/180);
        [UIView animateWithDuration:0.0 animations:^{
            self.tl1.transform = CGAffineTransformMakeRotation(angle);
        }];
        [self.view addSubview:self.tl1];
        
        self.tl2=[[UIImageView alloc] initWithFrame:CGRectMake(self.lev.t2.x*80+60, self.lev.t2.y*80+180, 80, 80)];
        self.tl2.image=turretImage;
        //self.tl2.contentMode=UIViewContentModeScaleAspectFill;
        self.tl2.layer.anchorPoint = CGPointMake(0.5,0.5);
        CGFloat angle2 = (self.lev.t2.face * 90 - 90) * (M_PI/180);
        [UIView animateWithDuration:0.0 animations:^{
            self.tl2.transform = CGAffineTransformMakeRotation(angle2);
        }];
        [self.view addSubview:self.tl2];
        
        self.tl3=[[UIImageView alloc] initWithFrame:CGRectMake(self.lev.t3.x*80+60, self.lev.t3.y*80+180, 80, 80)];
        self.tl3.image=turretImage;
       // self.tl3.contentMode=UIViewContentModeScaleAspectFill;
        self.tl3.layer.anchorPoint = CGPointMake(0.5,0.5);
        angle = (self.lev.t3.face * 90 - 90) * (M_PI/180);
        [UIView animateWithDuration:0.0 animations:^{
            self.tl3.transform = CGAffineTransformMakeRotation(angle);
        }];
        [self.view addSubview:self.tl3];
        
        self.tl4=[[UIImageView alloc] initWithFrame:CGRectMake(self.lev.t4.x*80+60, self.lev.t4.y*80+180, 80, 80)];
        self.tl4.image=turretImage;
        //  self.tl4.contentMode=UIViewContentModeScaleAspectFill;
        self.tl4.layer.anchorPoint = CGPointMake(0.5,0.5);
        angle = (self.lev.t4.face * 90 - 90) * (M_PI/180);
        [UIView animateWithDuration:0.0 animations:^{
            self.tl4.transform = CGAffineTransformMakeRotation(angle);
        }];
        [self.view addSubview:self.tl4];
        
        self.tl5=[[UIImageView alloc] initWithFrame:CGRectMake(self.lev.t5.x*80+60, self.lev.t5.y*80+180, 80, 80)];
        self.tl5.image=turretImage;
        // self.tl5.contentMode=UIViewContentModeScaleAspectFill;
        self.tl5.layer.anchorPoint = CGPointMake(0.5,0.5);
        angle = (self.lev.t5.face * 90 - 90) * (M_PI/180);
        [UIView animateWithDuration:0.0 animations:^{
            self.tl5.transform = CGAffineTransformMakeRotation(angle);
        }];
        [self.view addSubview:self.tl5];
        
        //Goal label
        UIImage *goalImage= [UIImage imageNamed:@"goal"];
        UIImageView *goal=[[UIImageView alloc] initWithFrame:CGRectMake(620, 740, 80, 80)];
        goal.image=goalImage;
        goal.contentMode=UIViewContentModeScaleAspectFill;
        [self.view addSubview:goal];
        
        //Maes label
        self.maesLabel=[[UIImageView alloc] initWithFrame:CGRectMake(60, 180, 80, 80)];
        UIImage *maesImage = [UIImage imageNamed:@"maes"];
        self.maesLabel.image=maesImage;
        self.maesLabel.contentMode = UIViewContentModeScaleAspectFill;
        [self.view addSubview:self.maesLabel];
        
        [self.turretList insertObject:self.lev.t1 atIndex:0];
        [self.turretList insertObject:self.lev.t2 atIndex:1];
        [self.turretList insertObject:self.lev.t3 atIndex:2];
        [self.turretList insertObject:self.lev.t4 atIndex:3];
        [self.turretList insertObject:self.lev.t5 atIndex:4];
        
        //prep lasers
        self.hLaserImage=[UIImage imageNamed:@"laser"];
        self.vLaserImage=[UIImage imageNamed:@"vlaser"];
        
        
        //Gestures
        UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self	action:@selector(swipe:)];
        swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
        [self.view addGestureRecognizer:swipeLeft];
        
        UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self	action:@selector(swipe:)];
        swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
        [self.view addGestureRecognizer:swipeRight];
        
        UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self	action:@selector(swipe:)];
        swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
        [self.view addGestureRecognizer:swipeUp];
        
        UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self	action:@selector(swipe:)];
        swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
        [self.view addGestureRecognizer:swipeDown];
        
    }
    return self;
}

-(void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


-(void)swipe:(UIGestureRecognizer*)gesture
{
    UISwipeGestureRecognizer *swipe = (UISwipeGestureRecognizer*)gesture;
    if(self.canMove){
    if(swipe.direction == UISwipeGestureRecognizerDirectionDown){
        if(self.maes.y<7&&[[[self.lev.rows objectAtIndex:self.maes.y+1] objectAtIndex: self.maes.x] isEqual:@"."]){
            self.canMove=NO;
            [self moveTimer];
            self.maes.y++;
            CGRect newFrame = self.maesLabel.frame;
            newFrame.origin.y+=80;
            [UIView animateWithDuration:0.5 animations:^{
                self.maesLabel.frame = newFrame;
            }];
            [self turnTurret];
        }
    }
    else if(swipe.direction == UISwipeGestureRecognizerDirectionUp){
        if(self.maes.y>0&&[[[self.lev.rows objectAtIndex:self.maes.y-1] objectAtIndex: self.maes.x] isEqual:@"."]){
            self.canMove=NO;
            [self moveTimer];
            self.maes.y--;
            CGRect newFrame = self.maesLabel.frame;
            newFrame.origin.y-=80;
            [UIView animateWithDuration:0.5 animations:^{
                self.maesLabel.frame = newFrame;
            }];
            [self turnTurret];
        }
    }
    else if(swipe.direction == UISwipeGestureRecognizerDirectionRight){
        if(self.maes.x<7&&[[[self.lev.rows objectAtIndex:self.maes.y] objectAtIndex: self.maes.x+1] isEqual:@"."]){
            self.canMove=NO;
            [self moveTimer];
            self.maes.x++;
            CGRect newFrame = self.maesLabel.frame;
            newFrame.origin.x+=80;
            [UIView animateWithDuration:0.5 animations:^{
                self.maesLabel.frame = newFrame;
            }];
            [self turnTurret];
        }
    }
    else if(swipe.direction == UISwipeGestureRecognizerDirectionLeft){
        if(self.maes.x>0&&[[[self.lev.rows objectAtIndex:self.maes.y] objectAtIndex: self.maes.x-1] isEqual:@"."]){
            self.canMove=NO;
            [self moveTimer];
            self.maes.x--;
            CGRect newFrame = self.maesLabel.frame;
            newFrame.origin.x-=80;
            [UIView animateWithDuration:0.5 animations:^{
                self.maesLabel.frame = newFrame;
            }];
            [self turnTurret];
            
        }
    }
        if(self.maes.x==7&&self.maes.y==7){
            if([Model sharedInstance].maxLevel<9){
            [self.portalSound play];
            self.dead= [[UILabel alloc] initWithFrame:CGRectMake(0, 300, 800, 200)];
            self.dead.text=@"CLEAR!";
            self.dead.textAlignment=NSTextAlignmentCenter;
            [self.dead setFont:[UIFont fontWithName:@"Georgia" size:120]];
            self.dead.textColor=[UIColor greenColor];
            [self.view addSubview:self.dead];
            [self startTimerForDeath];
            [UIView animateWithDuration:2.0 animations:^{
                self.dead.alpha = 0;
            }];
            if([Model sharedInstance].maxLevel<[Model sharedInstance].currentLevel+1){
                [Model sharedInstance].maxLevel++;
                [[NSUserDefaults standardUserDefaults] setInteger:[Model sharedInstance].maxLevel forKey:@"maxLevelReached"];
            }
            [Model sharedInstance].currentLevel++;
            }
            
            else {  //WON GAME
                [self.portalSound play];
                self.dead= [[UILabel alloc] initWithFrame:CGRectMake(0, 300, 800, 200)];
                self.dead.text=@"CONGRATULATION!\nA WINNER IS YOU!";
                self.dead.textAlignment=NSTextAlignmentCenter;
                [self.dead setFont:[UIFont fontWithName:@"Georgia" size:60]];
                self.dead.textColor=[UIColor greenColor];
                [Model sharedInstance].currentLevel=1;
                [self.view addSubview:self.dead];
                [self startTimerForEnd];
                [UIView animateWithDuration:5.0 animations:^{
                    self.dead.alpha = 0;
                }];
            }
        }
    }
}

-(void)turnTurret{
    
    [self startTimer];
    [self.turnSound play];
    self.tl1.layer.anchorPoint = CGPointMake(0.5,0.5);
    CGFloat angle = self.lev.t1.face * 90 * (M_PI/180);
    [self.lev.t1 turn];
    [UIView animateWithDuration:0.5 animations:^{
        self.tl1.transform = CGAffineTransformMakeRotation(angle);
    }];
    
    self.tl2.layer.anchorPoint = CGPointMake(0.5,0.5);
    CGFloat angle2 = self.lev.t2.face * 90 * (M_PI/180);
    [self.lev.t2 turn];
    [UIView animateWithDuration:0.5 animations:^{
        self.tl2.transform = CGAffineTransformMakeRotation(angle2);
    }];
    
    self.tl3.layer.anchorPoint = CGPointMake(0.5,0.5);
    CGFloat angle3 = self.lev.t3.face * 90 * (M_PI/180);
    [self.lev.t3 turn];
    [UIView animateWithDuration:0.5 animations:^{
        self.tl3.transform = CGAffineTransformMakeRotation(angle3);
    }];
    
    self.tl4.layer.anchorPoint = CGPointMake(0.5,0.5);
    CGFloat angle4 = self.lev.t4.face * 90 * (M_PI/180);
    [self.lev.t4 turn];
    [UIView animateWithDuration:0.5 animations:^{
        self.tl4.transform = CGAffineTransformMakeRotation(angle4);
    }];
    
    self.tl5.layer.anchorPoint = CGPointMake(0.5,0.5);
    CGFloat angle5 = self.lev.t5.face * 90 * (M_PI/180);
    [self.lev.t5 turn];
    [UIView animateWithDuration:0.5 animations:^{
        self.tl5.transform = CGAffineTransformMakeRotation(angle5);
    }];
    
    
}

-(void)startTimer{
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(fireAll:) userInfo:nil repeats:NO];
}

-(void)moveTimer{
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(turnOnCanMove) userInfo:nil repeats:NO];
}

-(void)turnOnCanMove{
    self.canMove=YES;
}

-(void)fireAll:(NSTimer*)timer{
    
    [self.laserSound play];
    [self fireWithTurret:self.lev.t1];
    [self fireWithTurret:self.lev.t2];
    [self fireWithTurret:self.lev.t3];
    [self fireWithTurret:self.lev.t4];
    [self fireWithTurret:self.lev.t5];
    [self checkHit:self.lev.t1];
    [self checkHit:self.lev.t2];
    [self checkHit:self.lev.t3];
    [self checkHit:self.lev.t4];
    [self checkHit:self.lev.t5];
}

-(void)fireWithTurret:(Turret*)turr{
    if(turr.face==1){
        UIImageView *laser= [[UIImageView alloc] initWithFrame:CGRectMake(turr.x*80+60, (turr.y-turr.upMax)*80+180, 80, 80*turr.upMax) ];
        laser.image=self.vLaserImage;
        laser.contentMode=UIViewContentModeScaleToFill;
        [self.view addSubview:laser];
        [UIView animateWithDuration:1.0 animations:^{
            laser.alpha = 0;
        }];
    }
    else if(turr.face==2){
        UIImageView *laser= [[UIImageView alloc] initWithFrame:CGRectMake(turr.x*80+140, turr.y*80+180, 80*turr.rightMax, 80) ];
        laser.image=self.hLaserImage;
        laser.contentMode=UIViewContentModeScaleToFill;
        [self.view addSubview:laser];
        [UIView animateWithDuration:1.0 animations:^{
            laser.alpha = 0;
        }];
    }
    else if(turr.face==3){
        UIImageView *laser= [[UIImageView alloc] initWithFrame:CGRectMake(turr.x*80+60, turr.y*80+260, 80, 80*turr.downMax) ];
        laser.image=self.vLaserImage;
        laser.contentMode=UIViewContentModeScaleToFill;
        [self.view addSubview:laser];
        [UIView animateWithDuration:1.0 animations:^{
            laser.alpha = 0;
        }];
    }
    else if(turr.face==4){
        UIImageView *laser= [[UIImageView alloc] initWithFrame:CGRectMake((turr.x-turr.leftMax)*80+60, turr.y*80+180, 80*turr.leftMax, 80) ];
        laser.image=self.hLaserImage;
        laser.contentMode=UIViewContentModeScaleToFill;
        [self.view addSubview:laser];
        [UIView animateWithDuration:1.0 animations:^{
            laser.alpha = 0;
        }];
    }
}

-(void)checkHit:(Turret*)turr{
    if(turr.face==1){
        if(self.maes.x==turr.x&&self.maes.y<turr.y&&self.maes.y>=turr.y-turr.upMax){
            [self die];
        }
    }
    else if(turr.face==3){
        if(self.maes.x==turr.x&&self.maes.y>turr.y&&self.maes.y<=turr.y+turr.downMax){
            [self die];
        }
    }
    else if(turr.face==4){
        if(self.maes.y==turr.y&&self.maes.x<turr.x&&self.maes.x>=turr.x-turr.leftMax){
            [self die];
        }
    }
    else if(turr.face==2){
        if(self.maes.y==turr.y&&self.maes.x>turr.x&&self.maes.x<=turr.x+turr.rightMax){
            [self die];
        }
    }
}

-(void)die{
    self.dead= [[UILabel alloc] initWithFrame:CGRectMake(0, 300, 800, 200)];
    self.dead.text=@"DEAD";
    self.dead.textAlignment=NSTextAlignmentCenter;
    [self.dead setFont:[UIFont fontWithName:@"Georgia" size:120]];
    self.dead.textColor=[UIColor redColor];
    [self.view addSubview:self.dead];
    [self.deathSound play];
    [self startTimerForDeath];
    [UIView animateWithDuration:2.0 animations:^{
        self.dead.alpha = 0;
    }];
    
}

-(void)startTimerForDeath{
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(eraseDeadAndRestart) userInfo:nil repeats:NO];
}

-(void)startTimerForEnd{
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(backToMain) userInfo:nil repeats:NO];
}

-(void)backToMain{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)eraseDeadAndRestart{
    
    [self.navigationController popViewControllerAnimated:YES];
    LevelViewController *levelView = [[LevelViewController alloc] init];
    [self.navigationController pushViewController:levelView animated:YES];
}

@end
