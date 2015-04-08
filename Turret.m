//
//  Turret.m
//  Maes in the Maze
//
//  Created by student on 4/8/15.
//  Copyright (c) 2015 Hemming. All rights reserved.
//

#import "Turret.h"

@implementation Turret {
}

-(void)turn{
    if(self.face==4)self.face=1;
    else(self.face++);
}


@end
