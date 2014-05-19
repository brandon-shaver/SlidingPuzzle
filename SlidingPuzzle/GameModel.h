//
//  GameModel.h
//  SlidingPuzzle
//
//  Created by Shaver, Brandon L on 2/27/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TileView.h"
#import "View.h"

@class View; //calm down objective c, the class exists!
@class TileView;


@interface GameModel : NSObject{
    int moves;

    
}


-(void)run:(View *) view;
-(void)moveTile:(TileView*) tile;
-(int)checkWin:(NSMutableArray*) tiles;
-(int)getMoves;

@end
