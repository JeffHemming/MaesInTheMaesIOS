//
//  Model.m
//  Maes in the Maze
//
//  Created by student on 3/30/15.
//  Copyright (c) 2015 Hemming. All rights reserved.
//

#import "Model.h"

@interface Model()

@end

@implementation Model
+(Model*)sharedInstance
{
    static Model *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        
        instance.maxLevel = 1;
        instance.currentLevel = 1;
    });
    
    return instance;
}

@end
