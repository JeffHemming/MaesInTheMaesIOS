//
//  Model.h
//  Maes in the Maze
//
//  Created by student on 3/30/15.
//  Copyright (c) 2015 Hemming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

+(Model*)sharedInstance;

@property (nonatomic, assign) NSInteger maxLevel;
@property (nonatomic, assign) NSInteger currentLevel;

@end
