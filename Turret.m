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
-(id)initWithX:(NSInteger)ix andY:(NSInteger)iy andFace:(NSInteger)iface{
    self=[super init];
    if(self){
        self.x=ix;
        self.y=iy;
        self.face=iface;
    }
    return self;
}

@end
