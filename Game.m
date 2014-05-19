//
//  Game.m
//  SlidingPuzzle
//
//  Created by Shaver, Brandon L on 2/24/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"


@implementation Game{
    

    //int blankRow, blankCol;
    
    NSMutableArray *adjTiles;
    CGPoint adjTile;
    

    
    CGPoint blankTile;
    
    NSArray *values;
    NSMutableArray *selectionPool;
    

    
}

- (id)init
{
    
    
    NSInteger _tileArray[3][3] = {   0,      0,      0,
                                    0,      0,      0,
                                    0,      0,      0   };
    
    if (_tileArray[2][1] == 2){
        
    }

    return self;
}

-(int) main{
    
    
    [self calcAdjTile];
    
    return 0;
    
}


-(void) calcAdjTile{
    
    adjTiles = [[NSMutableArray alloc] init];
    
    //remove all previous adj tiles
    while ([adjTiles count] > 0){
    
        [adjTiles removeAllObjects];
    }
    
    //find new adj tiles
    
    //1.) find current blank tile
    for(int n=0; n<3; n++){
        for(int m=0; m<3; m++){
            /**if( tileArray[n][m] == 0){
                blankTile.x = n;
                blankTile.y = m;
           **/ }
        }
    }
    
    //2.) find adjacent tiles based on blank tile
    
    if ((int)blankTile.x < 2 ){
        
        CGPoint newPoint;
        newPoint.x = blankTile.x + 1;
        newPoint.y = blankTile.y;
        
        [adjTiles addObject: [NSValue valueWithCGPoint:newPoint]];
    }
    
    if ((int)blankTile.x > 0 ){
        
        CGPoint newPoint;
        newPoint.x = blankTile.x - 1;
        newPoint.y = blankTile.y;
        
        [adjTiles addObject: [NSValue valueWithCGPoint:newPoint]];
    }
    
    if ((int)blankTile.y < 2 ){
        
        CGPoint newPoint;
        newPoint.x = blankTile.x;
        newPoint.y = blankTile.y + 1;
        
        [adjTiles addObject: [NSValue valueWithCGPoint:newPoint]];
    }
    
    if ((int)blankTile.y > 0 ){
        
        CGPoint newPoint;
        newPoint.x = blankTile.x;
        newPoint.y = blankTile.y - 1;
        
        [adjTiles addObject: [NSValue valueWithCGPoint:newPoint]];
    }
    

    
}

-(void) buildValuePool{

    
}

@end

/**
 -(NSMutableArray*)shuffleBoard:(NSMutableArray*)board {
 
 randomPool = [[NSMutableArray alloc] initWithObjects:
 [NSNumber numberWithInt:(0)],
 [NSNumber numberWithInt:(1)],
 [NSNumber numberWithInt:(2)],
 [NSNumber numberWithInt:(3)],
 [NSNumber numberWithInt:(4)],
 [NSNumber numberWithInt:(5)],
 [NSNumber numberWithInt:(6)],
 [NSNumber numberWithInt:(7)],
 [NSNumber numberWithInt:(8)], nil];
 
 board = [[NSMutableArray alloc] init];
 
 
 for(int i=9; i > 0; i--){
 
 int random =  (int)0 + arc4random() % (i-0+1);
 NSNumber *number = [randomPool objectAtIndex:random];
 [board addObject:number];
 [randomPool delete:number];
 
 }
 
 
 return board;
 }
 **/
