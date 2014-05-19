//
//  View.m
//  SlidingPuzzle
//
//  Created by Shaver, Brandon L on 2/21/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//


#import <Foundation/Foundation.h>

#import "View.h"
#import "TileView.h"


@implementation View{
    
    UIButton *status;
    
    
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        tiles = [[NSMutableArray alloc] initWithObjects:
                 [[TileView alloc] initWithFrame:(CGRectMake(10, 100, 100, 100))
                                         withRow: (0) withCol: (0)],        //top left
                 
                 [[TileView alloc] initWithFrame:(CGRectMake(110, 100, 100, 100))
                                         withRow:(0) withCol:(1)],          //top center
                 
                 [[TileView alloc] initWithFrame:(CGRectMake(210, 100, 100, 100))
                                         withRow:(0) withCol:(2)],          //top right
                 
                 [[TileView alloc] initWithFrame:(CGRectMake(10, 200, 100, 100))
                                         withRow:(1) withCol:(0)],          //center left
                 
                 [[TileView alloc] initWithFrame:(CGRectMake(110, 200, 100, 100))
                                         withRow:(1) withCol:(1)],            //center center
                 
                 [[TileView alloc] initWithFrame:(CGRectMake(210, 200, 100, 100))
                                         withRow:(1) withCol:(2)],             //center right
                 
                 [[TileView alloc] initWithFrame:(CGRectMake(10, 300, 100, 100))
                                         withRow:(2) withCol:(0)],               //bottom left
                  
                 [[TileView alloc] initWithFrame:(CGRectMake(110, 300, 100, 100))
                                         withRow:(2) withCol:(1)],               //bottom center
                 
                 nil];
        
        status = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        status.frame = CGRectMake(100, 400, 100, 100);
        [status setTitle:@"Status" forState:UIControlStateNormal];
        [status addTarget:self action:@selector(getStatus:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: status];
        
     


        
        game = [[GameModel alloc] init];
        [game run:(self)];
        
        


    }
    return self;
}

-(NSMutableArray *) getViewTiles{
    
    return tiles;
}


-(void)getStatus: (id) sender{
    
    int magicNumber = [game checkWin:tiles];
    
    NSString *messageString = [NSString stringWithFormat:@"You have %d number of tiles in the correct position", magicNumber];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Correct Tiles"
        message: messageString
                 delegate:self
        cancelButtonTitle:@"Cancel"
        otherButtonTitles:nil];
    [alert show];
    

    
}


+(GameModel*)getGame{
    
    return game;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
