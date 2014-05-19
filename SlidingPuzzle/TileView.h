//
//  TileView.h
//  SlidingPuzzle
//
//  Created by Shaver, Brandon L on 2/21/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View.h"

@class GameModel;

@interface TileView : UIView{
    
    GameModel *game;
    
    @public int tileRow;
    @public int tileCol;
}

-(id)initWithFrame:(CGRect)frame
           withRow:(int) row
           withCol:(int) col;

//movement of tiles
-(void) moveLeft;
-(void) moveRight;
-(void) moveDown;
-(void) moveUp;

-(void) addImage:(NSString*)imageName;
-(void) addId: (int) ident;
-(int) getId;
-(CGPoint) getCenter;


-(void) setRow:(int)row;
-(void) setCol:(int)col;
-(int) getRow;
-(int) getCol;


@end
