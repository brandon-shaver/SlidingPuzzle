//
//  GameModel.m
//  SlidingPuzzle
//
//  Created by Shaver, Brandon L on 2/27/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import "GameModel.h"
#import "TileView.h"

@implementation GameModel {
    
    
    int blankRow, blankCol;
    
    NSMutableArray *adjTiles;
    
    CGPoint adjTile;
    
    
    CGPoint blankTile;
    TileView* theBlank;
    
    NSArray *values;
    NSMutableArray *selectionPool;
    

}

-(id)init{
    

    
    
    return self;
}

-(void)run:(View *) view{
    moves = 0;
    
    NSMutableArray *viewTiles = [view getViewTiles];
    
    int tileArray[3][3] = {
        
        {8, 7, 6} ,   /*  initializers for row indexed by 0 */
        {5, 4, 3} ,   /*  initializers for row indexed by 1 */
        {2, 1, 0}   /*  initializers for row indexed by 2 */
        
    };
    
    int n = 0, m = 0;
    
            for(TileView* tile in viewTiles){
                
                if((int)tileArray[n][m] == 1){
                    
                    [tile addImage: @"Yellow1.png"];
                    [view addSubview:tile];
                    [tile addId:1];
                    
                }else if ((int)tileArray[n][m] == 2){
                    
                    [tile addImage: @"Yellow2.png"];
                    [view addSubview:tile];
                    [tile addId:2];
                    
                }else if ((int)tileArray[n][m] == 3){
                    
                    [tile addImage: @"Yellow3.png"];
                    [view addSubview:tile];
                    [tile addId:3];
                    
                }else if ((int)tileArray[n][m] == 4){
                    
                    [tile addImage: @"Yellow4.png"];
                    [view addSubview:tile];
                    [tile addId:4];
                    
                }else if ((int)tileArray[n][m] == 5){
                    
                    [tile addImage: @"Yellow5.png"];
                    [view addSubview:tile];
                    [tile addId:5];
                    
                }else if ((int)tileArray[n][m] == 6){
                    
                    [tile addImage: @"Yellow6.png"];
                    [view addSubview:tile];
                    [tile addId:6];
                    
                }else if ((int)tileArray[n][m] == 7){
                    
                    [tile addImage: @"Yellow7.png"];
                    [view addSubview:tile];
                    [tile addId:7];
                    
                }else if ((int)tileArray[n][m] == 8){
                    
                    [tile addImage: @"Yellow8.png"];
                    [view addSubview:tile];
                    [tile addId:8];
                    
                }else if ((int)tileArray[n][m] == 0){
                    //[view addSubview:tile];
                    //theBlank = tileArray[n][m];
                }
                if(m < 2){
                    m++;
                }else{
                    m = 0;
                    n++;
                }
                
            }
    
    //1.) find current blank tile
    for(int n=0; n<3; n++){
        for(int m=0; m<3; m++){
            if( tileArray[n][m] == 0){
                blankTile.x = n;
                blankTile.y = m;
            }
        }
    }
    
    [self calcAdjTile];
    
    
    


    
    
    
}

-(void) calcAdjTile{
 
    adjTiles = [[NSMutableArray alloc] init];
 
    //remove all previous adj tiles
    while ([adjTiles count] > 0){
        
        [adjTiles removeAllObjects];
    }
    
    //find new adj tiles
    
   
    
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

-(void) moveTile: (TileView*) tile{
    

    [self calcAdjTile];
    
    for (NSValue *point in adjTiles){
        
       int adjRow = (int)[point CGPointValue].x;
       int adjCol = (int)[point CGPointValue].y;
        
        if (([tile getRow] == adjRow) && ([tile getCol] == adjCol)){ //touched tile = adjTile
            
            if(blankTile.x > [tile getRow]){
                [tile moveDown];
                [tile setRow:[tile getRow]+1];
                //[tile]
                blankTile.x = blankTile.x - 1;
                return;
                
            }else if(blankTile.x < [tile getRow]){
                [tile moveUp];
                [tile setRow:[tile getRow]-1];
                blankTile.x = blankTile.x + 1;
                return;
                
            }else if(blankTile.y > [tile getCol]){
                [tile moveRight];
                [tile setCol:[tile getCol]+ 1];
                blankTile.y = blankTile.y - 1;
                return;
                
            }else if(blankTile.y < [tile getCol]){
                [tile moveLeft];
                [tile setCol:[tile getCol]- 1];
                blankTile.y = blankTile.y + 1;
                return;
            }
            
          

            
            [self calcAdjTile];
            
            return;
        }
    }
    
}

-(int)checkWin:(NSMutableArray*) tiles{
    
    int currentCorrect = 0;
    
    for (TileView* tile in tiles){
        
        if ([tile getId] == 1){
            if ([tile getRow] == 0 && [tile getCol] == 0)
                currentCorrect++;
        }
        
        if ([tile getId] == 2){
            if ([tile getRow] == 0 && [tile getCol] == 1)
                currentCorrect++;
        }
        
        if ([tile getId] == 3){
            if ([tile getRow] == 0 && [tile getCol] == 2)
                currentCorrect++;
        }
        
        if ([tile getId] == 4){
            if ([tile getRow] == 1 && [tile getCol] == 0)
                currentCorrect++;
        }
        
        if ([tile getId] == 5){
            if ([tile getRow] == 1 && [tile getCol] == 1)
                currentCorrect++;
        }
        
        if ([tile getId] == 6){
            if ([tile getRow] == 1 && [tile getCol] == 2)
                currentCorrect++;
        }
        
        if ([tile getId] == 7){
            if ([tile getRow] == 2 && [tile getCol] == 0)
                currentCorrect++;
        }
        
        if ([tile getId] == 8){
            if ([tile getRow] == 2 && [tile getCol] == 1)
                currentCorrect++;
        }
        
        if ([tile getId] == 0){
            if ([tile getRow] == 2 && [tile getCol] == 2)
                currentCorrect++;
        }
    }
    
    return currentCorrect;
}

-(int)getMoves{
    
    return moves;
}
@end
