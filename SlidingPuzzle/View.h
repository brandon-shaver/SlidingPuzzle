//
//  View.h
//  SlidingPuzzle
//
//  Created by Shaver, Brandon L on 2/21/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameModel.h"

@class GameModel;

   static GameModel *game;

@interface View : UIView{
    
    NSMutableArray *tiles;
    
    UILabel *score;
    

    
    


}

-(NSMutableArray *) getViewTiles;
+(GameModel*) getGame;

@end
