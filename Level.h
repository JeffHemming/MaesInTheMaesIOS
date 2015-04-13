//
//  Level.h
//  Maes in the Maze
//
//  Created by student on 4/8/15.
//  Copyright (c) 2015 Hemming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Turret.h"

@interface Level : NSObject{}
@property (nonatomic, strong) NSString *desc;
//@property (nonatomic, strong) NSMutableArray *turretList;
@property (nonatomic, strong) Turret *t1;
@property (nonatomic, strong) Turret *t2;
@property (nonatomic, strong) Turret *t3;
@property (nonatomic, strong) Turret *t4;
@property (nonatomic, strong) Turret *t5;
@property (nonatomic, strong) NSMutableArray *rows;
@property (nonatomic, strong) NSMutableArray *columns;

-(id)initWithCurrent:(NSInteger)cL;
@end

