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
@property (nonatomic, strong) UIImageView *maesLabel;
@property (nonatomic, strong) UIImageView *tl1;
@property (nonatomic, strong) UIImageView *tl2;
@property (nonatomic, strong) UIImageView *tl3;
@property (nonatomic, strong) UIImageView *tl4;
@property (nonatomic, strong) UIImageView *tl5;
@property (nonatomic, strong) NSMutableArray *turretList;
@property (nonatomic, strong) UIImageView *l1;
@property (nonatomic, strong) UIImageView *l2;
@property (nonatomic, strong) UIImageView *l3;
@property (nonatomic, strong) UIImageView *l4;
@property (nonatomic, strong) UIImageView *l5;
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
        UIImage *top = [UIImage imageNamed:@"top"];
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
                    UIImage *hwall =[UIImage imageNamed:@"wall"];
                    halfwall.image=hwall;
                    halfwall.contentMode= UIViewContentModeScaleAspectFill;
                    [self.view addSubview:halfwall];
                }
            }
        }
        
        //Place turrets
        self.tl1=[[UIImageView alloc] initWithFrame:CGRectMake(self.lev.t1.x*80+60, self.lev.t1.y*80+180, 80, 80)];
        UIImage *turretImage=[UIImage imageNamed:@"turret"];
        self.tl1.image=turretImage;
        self.tl1.contentMode=UIViewContentModeScaleAspectFill;
        [self.view addSubview:self.tl1];
        
        self.tl2=[[UIImageView alloc] initWithFrame:CGRectMake(self.lev.t2.x*80+60, self.lev.t2.y*80+180, 80, 80)];
        self.tl2.image=turretImage;
        self.tl2.contentMode=UIViewContentModeScaleAspectFill;
        [self.view addSubview:self.tl2];
        
        self.tl3=[[UIImageView alloc] initWithFrame:CGRectMake(self.lev.t3.x*80+60, self.lev.t3.y*80+180, 80, 80)];
        self.tl3.image=turretImage;
        self.tl3.contentMode=UIViewContentModeScaleAspectFill;
        [self.view addSubview:self.tl3];
        
        self.tl4=[[UIImageView alloc] initWithFrame:CGRectMake(self.lev.t4.x*80+60, self.lev.t4.y*80+180, 80, 80)];
        self.tl4.image=turretImage;
        self.tl4.contentMode=UIViewContentModeScaleAspectFill;
        [self.view addSubview:self.tl4];
        
        self.tl5=[[UIImageView alloc] initWithFrame:CGRectMake(self.lev.t5.x*80+60, self.lev.t5.y*80+180, 80, 80)];
        self.tl5.image=turretImage;
        self.tl5.contentMode=UIViewContentModeScaleAspectFill;
        [self.view addSubview:self.tl5];
        
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
        UIImage *laser=[UIImage imageNamed:@"laser"];
        self.l1=[[UIImageView alloc]init];
        self.l1.image=laser;
        
        
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


-(void)swipe:(UIGestureRecognizer*)gesture
{
    UISwipeGestureRecognizer *swipe = (UISwipeGestureRecognizer*)gesture;
    if(swipe.direction == UISwipeGestureRecognizerDirectionDown){
        if(self.maes.y<7&&[[[self.lev.rows objectAtIndex:self.maes.y+1] objectAtIndex: self.maes.x] isEqual:@"."]){
            self.maes.y++;
            CGRect newFrame = self.maesLabel.frame;
            newFrame.origin.y+=80;
            [UIView animateWithDuration:1.0 animations:^{
                self.maesLabel.frame = newFrame;
            }];
            [self turnTurret];
        }
    }
    else if(swipe.direction == UISwipeGestureRecognizerDirectionUp){
        if(self.maes.y>0&&[[[self.lev.rows objectAtIndex:self.maes.y-1] objectAtIndex: self.maes.x] isEqual:@"."]){
            self.maes.y--;
            CGRect newFrame = self.maesLabel.frame;
            newFrame.origin.y-=80;
            [UIView animateWithDuration:1.0 animations:^{
                self.maesLabel.frame = newFrame;
            }];
        }
    }
    else if(swipe.direction == UISwipeGestureRecognizerDirectionRight){
        if(self.maes.x<7&&[[[self.lev.rows objectAtIndex:self.maes.y] objectAtIndex: self.maes.x+1] isEqual:@"."]){
            self.maes.x++;
            CGRect newFrame = self.maesLabel.frame;
            newFrame.origin.x+=80;
            [UIView animateWithDuration:1.0 animations:^{
                self.maesLabel.frame = newFrame;
            }];
        }
    }
    else if(swipe.direction == UISwipeGestureRecognizerDirectionLeft){
        if(self.maes.x>0&&[[[self.lev.rows objectAtIndex:self.maes.y] objectAtIndex: self.maes.x-1] isEqual:@"."]){
            self.maes.x--;
            CGRect newFrame = self.maesLabel.frame;
            newFrame.origin.x-=80;
            [UIView animateWithDuration:1.0 animations:^{
                self.maesLabel.frame = newFrame;
            }];
        }
    }
}

-(void)turnTurret{
    // use "HUGE_VALF" for infinite rotation
    // [self tl1:self.movingView duration:5 rotations:1 repeatCount:0];
    
    self.tl1.layer.anchorPoint = CGPointMake(0.5,0.5);
    CGFloat angle = self.lev.t1.face * 90 * (M_PI/180);
    self.lev.t1.turn;
    self.tl1.transform = CGAffineTransformMakeRotation(angle);
}

/* rotate a view:
-(void)rotateOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeatCount:(float)repeat;
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: (M_PI * 2.0) * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}*/

@end
