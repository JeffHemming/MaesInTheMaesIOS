//
//  Level.m
//  Maes in the Maze
//
//  Created by student on 4/8/15.
//  Copyright (c) 2015 Hemming. All rights reserved.
//

#import "Level.h"
#import "Turret.h"

@implementation Level
-(id)initWithCurrent:(NSInteger)cL{
    self=[super init];
    if(self){
        //Set Description
        switch (cL){
            case 1:self.desc=@"Level 1\nMaes has entered the Maze in search of his brother and sisters...";
                break;
            case 2:self.desc=@"Level 2\nThat's one floor down, but things will probably get harder...";
                break;
            case 3:self.desc=@"Level 3\nMaes can hear his brother Finn calling to him.  Finn is on this floor!  Now to find him...";
                break;
            case 4:self.desc=@"Level 4\nWith Finn safe, Maes has to find his sisters...";
                break;
            case 5:self.desc=@"Level 5\nMaes wonders just how deep this Maze goes...";
                break;
            case 6:self.desc=@"Level 6\nThat voice, it's Nadia!  Maes races to find his big sister...";
                break;
            case 7:self.desc=@"Level 7\nWith two siblings saved, Maes continues in high spirits...";
                break;
            case 8:self.desc=@"Level 8\nMaes is exhausted, but he knows that his baby sister can't be too much further now...";
                break;
            case 9:self.desc=@"Level 9\nMaes can hear Gwendolyn crying somewhere on this floor.  If he can just find her, they can go home...";
                break;
                
        }
        //Set maze map
        //Note, to access it's [[self.rows objectAtIndex: 1] objectAtIndex: 1]; etc.
        self.rows =[[NSMutableArray alloc] initWithCapacity:8];
        switch (cL){
            case 1:
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@"w",@"w",@".",@".",@"t",nil] atIndex: 0];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@"t",@".",@".",@".",@".",@"t",@".",nil] atIndex: 1];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 2];
                [self.rows insertObject: [NSArray arrayWithObjects: @"w",@".",@".",@"w",@".",@"w",@".",@"w",nil] atIndex: 3];
                [self.rows insertObject: [NSArray arrayWithObjects: @"w",@".",@".",@".",@"t",@".",@".",@"w",nil] atIndex: 4];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 5];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@"t",@".",@".",@".",@".",@"t",@".",nil] atIndex: 6];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@"w",@"w",@".",@".",@".",nil] atIndex: 7];
                break;
            case 2:
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@"w",@".",@".",@".",@".",@"t",nil] atIndex: 0];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@"t",@".",@"w",@".",@".",nil] atIndex: 1];
                [self.rows insertObject: [NSArray arrayWithObjects: @"w",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 2];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 3];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@"w",@".",@".",@"t",@".",nil] atIndex: 4];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 5];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@"t",@".",@".",@".",@".",@"w",nil] atIndex: 6];
                [self.rows insertObject: [NSArray arrayWithObjects: @"t",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 7];
                break;
            case 3:
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@"w",@"w",@"w",@"w",@"w",@"w",@"w",nil] atIndex: 0];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@"w",@"w",@"w",@"w",@"w",@"w",@"w",nil] atIndex: 1];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@"w",@"t",@"w",@"t",@"w",@"t",@"w",nil] atIndex: 2];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 3];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 4];
                [self.rows insertObject: [NSArray arrayWithObjects: @"w",@"w",@"w",@"t",@"w",@"t",@"w",@".",nil] atIndex: 5];
                [self.rows insertObject: [NSArray arrayWithObjects: @"w",@"w",@"w",@"w",@"w",@"w",@"w",@".",nil] atIndex: 6];
                [self.rows insertObject: [NSArray arrayWithObjects: @"w",@"w",@"w",@"w",@"w",@"w",@"w",@".",nil] atIndex: 7];
                break;
            case 4:
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@"w",@".",@".",@".",@".",@".",@".",nil] atIndex: 0];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@"t",@".",@".",@".",@".",@".",@".",nil] atIndex: 1];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@"t",@".",@".",@".",@".",@".",nil] atIndex: 2];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 3];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@"t",@".",@".",@".",nil] atIndex: 4];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@"t",@".",@".",nil] atIndex: 5];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@"t",@".",nil] atIndex: 6];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@"w",@".",nil] atIndex: 7];
                break;
            case 5:
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@"w",@".",@".",@"t",nil] atIndex: 0];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 1];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@"w",@".",@"w",@".",nil] atIndex: 2];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@"t",@".",@".",@".",@"w",@".",nil] atIndex: 3];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@"w",@".",nil] atIndex: 4];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@"w",@".",@".",@".",@"t",@"w",@".",nil] atIndex: 5];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@"w",@".",nil] atIndex: 6];
                [self.rows insertObject: [NSArray arrayWithObjects: @"t",@".",@".",@"t",@".",@".",@".",@".",nil] atIndex: 7];
                break;
            case 6:
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@"w",@"w",@"w",@"w",@"w",@"w",nil] atIndex: 0];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@"w",@"w",@"w",@"w",@"w",nil] atIndex: 1];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@"w",@"w",@"w",@"w",nil] atIndex: 2];
                [self.rows insertObject: [NSArray arrayWithObjects: @"w",@".",@".",@".",@".",@"w",@"w",@"w",nil] atIndex: 3];
                [self.rows insertObject: [NSArray arrayWithObjects: @"w",@"w",@".",@".",@".",@".",@"w",@"w",nil] atIndex: 4];
                [self.rows insertObject: [NSArray arrayWithObjects: @"t",@".",@".",@".",@".",@".",@".",@"w",nil] atIndex: 5];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 6];
                [self.rows insertObject: [NSArray arrayWithObjects: @"w",@"w",@"t",@"t",@"t",@"t",@"w",@".",nil] atIndex: 7];
                break;
            case 7:
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@"w",@".",@".",@"t",@".",@"t",nil] atIndex: 0];
                [self.rows insertObject: [NSArray arrayWithObjects: @"w",@".",@"w",@".",@"w",@".",@".",@".",nil] atIndex: 1];
                [self.rows insertObject: [NSArray arrayWithObjects: @"w",@".",@".",@"t",@".",@".",@"w",@".",nil] atIndex: 2];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@"w",@".",@".",nil] atIndex: 3];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@"w",@"w",@".",@".",@".",@"w",@".",nil] atIndex: 4];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@"w",@".",@".",@".",nil] atIndex: 5];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@"w",@".",@".",@".",@"w",@".",nil] atIndex: 6];
                [self.rows insertObject: [NSArray arrayWithObjects: @"t",@".",@".",@".",@".",@"t",@"w",@".",nil] atIndex: 7];
                break;
            case 8:
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@"w",@"t",@".",@".",@".",@".",nil] atIndex: 0];
                [self.rows insertObject: [NSArray arrayWithObjects: @"w",@".",@".",@".",@".",@"w",@".",@".",nil] atIndex: 1];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@"w",@".",@".",@".",@".",@".",nil] atIndex: 2];
                [self.rows insertObject: [NSArray arrayWithObjects: @"t",@".",@".",@"w",@".",@".",@"w",@".",nil] atIndex: 3];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@"t",@".",@".",@".",@".",nil] atIndex: 4];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@"t",nil] atIndex: 5];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@"w",@".",@".",@".",@"w",@".",@"w",nil] atIndex: 6];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@"t",@".",@".",@".",nil] atIndex: 7];
                break;
            case 9:
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 0];
                [self.rows insertObject: [NSArray arrayWithObjects: @"w",@"w",@"w",@"w",@".",@"w",@"w",@".",nil] atIndex: 1];
                [self.rows insertObject: [NSArray arrayWithObjects: @"w",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 2];
                [self.rows insertObject: [NSArray arrayWithObjects: @"w",@".",@"w",@".",@".",@".",@"w",@"t",nil] atIndex: 3];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@"t",@".",@".",@".",nil] atIndex: 4];
                [self.rows insertObject: [NSArray arrayWithObjects: @"w",@".",@".",@".",@".",@".",@".",@"w",nil] atIndex: 5];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@"t",@"w",@".",@"w",@"w",@".",nil] atIndex: 6];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 7];
                break;
            default:
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 0];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 1];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 2];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 3];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 4];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 5];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 6];
                [self.rows insertObject: [NSArray arrayWithObjects: @".",@".",@".",@".",@".",@".",@".",@".",nil] atIndex: 7];
                break;
        }
        //Set turret list
        switch (cL){
            case 1:
                self.t1=[[Turret alloc] initWithX:1 andY:1 andFace:1];
                self.t2=[[Turret alloc] initWithX:6 andY:1 andFace:1];
                self.t3=[[Turret alloc] initWithX:4 andY:4 andFace:3];
                self.t4=[[Turret alloc] initWithX:1 andY:6 andFace:4];
                self.t5=[[Turret alloc] initWithX:6 andY:6 andFace:1];
                break;
            case 2:
                self.t1=[[Turret alloc] initWithX:2 andY:6 andFace:1];
                self.t2=[[Turret alloc] initWithX:3 andY:1 andFace:3];
                self.t3=[[Turret alloc] initWithX:6 andY:4 andFace:4];
                self.t4=[[Turret alloc] initWithX:7 andY:0 andFace:2];
                self.t5=[[Turret alloc] initWithX:0 andY:7 andFace:2];
                break;
            case 3:
                self.t1=[[Turret alloc] initWithX:2 andY:2 andFace:1];
                self.t2=[[Turret alloc] initWithX:4 andY:2 andFace:3];
                self.t3=[[Turret alloc] initWithX:6 andY:2 andFace:4];
                self.t4=[[Turret alloc] initWithX:3 andY:5 andFace:2];
                self.t5=[[Turret alloc] initWithX:5 andY:5 andFace:2];
                break;
            case 4:
                self.t1=[[Turret alloc] initWithX:1 andY:1 andFace:1];
                self.t2=[[Turret alloc] initWithX:2 andY:2 andFace:3];
                self.t3=[[Turret alloc] initWithX:4 andY:4 andFace:4];
                self.t4=[[Turret alloc] initWithX:5 andY:5 andFace:2];
                self.t5=[[Turret alloc] initWithX:6 andY:6 andFace:2];
                break;
            case 5:
                self.t1=[[Turret alloc] initWithX:5 andY:5 andFace:2];
                self.t2=[[Turret alloc] initWithX:2 andY:3 andFace:3];
                self.t3=[[Turret alloc] initWithX:7 andY:0 andFace:4];
                self.t4=[[Turret alloc] initWithX:0 andY:7 andFace:2];
                self.t5=[[Turret alloc] initWithX:3 andY:7 andFace:2];
                break;
            case 6:
                self.t1=[[Turret alloc] initWithX:0 andY:5 andFace:1];
                self.t2=[[Turret alloc] initWithX:2 andY:7 andFace:3];
                self.t3=[[Turret alloc] initWithX:3 andY:7 andFace:4];
                self.t4=[[Turret alloc] initWithX:4 andY:7 andFace:2];
                self.t5=[[Turret alloc] initWithX:5 andY:7 andFace:2];
                break;
            case 7:
                self.t1=[[Turret alloc] initWithX:5 andY:0 andFace:1];
                self.t2=[[Turret alloc] initWithX:3 andY:2 andFace:3];
                self.t3=[[Turret alloc] initWithX:5 andY:7 andFace:4];
                self.t4=[[Turret alloc] initWithX:7 andY:0 andFace:1];
                self.t5=[[Turret alloc] initWithX:0 andY:7 andFace:2];
                break;
            case 8:
                self.t1=[[Turret alloc] initWithX:0 andY:3 andFace:1];
                self.t2=[[Turret alloc] initWithX:3 andY:0 andFace:3];
                self.t3=[[Turret alloc] initWithX:3 andY:4 andFace:4];
                self.t4=[[Turret alloc] initWithX:4 andY:7 andFace:2];
                self.t5=[[Turret alloc] initWithX:7 andY:5 andFace:2];
                break;
            case 9:
                self.t1=[[Turret alloc] initWithX:7 andY:3 andFace:3];
                self.t2=[[Turret alloc] initWithX:2 andY:6 andFace:3];
                self.t3=[[Turret alloc] initWithX:2 andY:6 andFace:4];
                self.t4=[[Turret alloc] initWithX:4 andY:4 andFace:2];
                self.t5=[[Turret alloc] initWithX:4 andY:4 andFace:1];
                break;
            default:
                self.t1=[[Turret alloc] initWithX:0 andY:0 andFace:1];
                self.t2=[[Turret alloc] initWithX:0 andY:0 andFace:3];
                self.t3=[[Turret alloc] initWithX:0 andY:0 andFace:4];
                self.t4=[[Turret alloc] initWithX:0 andY:0 andFace:2];
                self.t5=[[Turret alloc] initWithX:0 andY:0 andFace:2];
                break;
                
        }
        //Set Turret Maxes
        [self setTurretMaxes:self.t1];
        [self setTurretMaxes:self.t2];
        [self setTurretMaxes:self.t3];
        [self setTurretMaxes:self.t4];
        [self setTurretMaxes:self.t5];
        
    }
    return self;
}

-(void)setTurretMaxes:(Turret*)t{
    for(NSInteger i=t.getX-1;i>=0&&[[[self.rows objectAtIndex:t.getY] objectAtIndex: i] isEqual:@"."]; i--){
        t.leftMax++;
    }
    for(NSInteger i=t.getX+1;i<8&&[[[self.rows objectAtIndex:t.getY] objectAtIndex: i] isEqual:@"."]; i++){
        t.rightMax++;
    }
    for(NSInteger i=t.getY-1;i>=0&&[[[self.rows objectAtIndex:i] objectAtIndex:t.getX] isEqual:@"."]; i--){
        t.upMax++;
    }
    for(NSInteger i=t.getY+1;i<8&&[[[self.rows objectAtIndex:i ] objectAtIndex:t.getX]  isEqual:@"."]; i++){
        t.downMax++;
    }
}
@end

