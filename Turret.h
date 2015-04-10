//
//  Turret.h
//  Maes in the Maze
//
//  Created by student on 4/8/15.
//  Copyright (c) 2015 Hemming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Turret : NSObject{
}

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;
@property (nonatomic, assign) NSInteger face;
@property (nonatomic, assign) NSInteger upMax;
@property (nonatomic, assign) NSInteger downMax;
@property (nonatomic, assign) NSInteger leftMax;
@property (nonatomic, assign) NSInteger rightMax;

-(void) turn;
-(id)initWithX:(NSInteger)ix andY:(NSInteger)iy andFace:(NSInteger)iface;
-(NSInteger)getX;
-(NSInteger)getY;
//-(NSInteger)getFace;
@end
