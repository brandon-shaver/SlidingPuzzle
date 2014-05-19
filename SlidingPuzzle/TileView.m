//
//  TileView.m
//  SlidingPuzzle
//
//  Created by Shaver, Brandon L on 2/21/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import "TileView.h"
#import "GameModel.h"

@implementation TileView{
    
    UIImageView *image;
    CGPoint start, end, center;
    int numberTile;
    
    int moves;
    
    
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        moves = 0;
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
           withRow:(int) row
           withCol:(int) col{

    
    if (self = [super initWithFrame:frame]) {
        // Initialization code
        
        tileRow = row;
        tileCol = col;
        
    
    }
    return self;
}

-(void)addImage:(NSString *) imageName{
    
    image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    image.frame = self.bounds;
    image.opaque = YES;
    [self addSubview: image];
}

-(void) addId: (int) ident{
    numberTile = ident;
}

-(int) getId{
    return numberTile;
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    
    UITouch* touch = [touches anyObject];
    
    start = [touch locationInView:self.superview];
    center = [touch locationInView:self];
    
    center.x += self.frame.size.width/2-center.x;
    center.y += self.frame.size.height/2-center.y;
    
    
    
   // [self.superview bringSubviewToFront:self];
}

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    

}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
    
    UITouch* touch = [touches anyObject];
    
    end = [touch locationInView:self.superview];
    
   // if([game checkAdjancency:(int)
    
    
    //if tile is adj tile
        //move towards blank tile
    
    
    //[self moveDown:center];
  
    //[game moveTile:(self)];
    
    game = [View getGame];
    [game moveTile:self];

    
}

-(BOOL)isAdjacentTile{
    
    if(1==1){
        return YES;
    }else{
        return NO;
    }
    
}

-(void) moveLeft{
    CGPoint newCenter;
    newCenter.x = self.center.x - 100.0f;
    newCenter.y = self.center.y;
    self.center = newCenter;
}

-(void) moveRight{

    CGPoint newCenter;
    newCenter.x = self.center.x + 100.0f;
    newCenter.y = self.center.y;
    self.center = newCenter;
}

-(void) moveDown{
    
    CGPoint newCenter;
    newCenter.x = self.center.x;
    newCenter.y = self.center.y + 100.0f;
    self.center = newCenter;
}

-(void) moveUp{
    CGPoint newCenter;
    newCenter.x = self.center.x;
    newCenter.y = self.center.y - 100.0f;
    self.center = newCenter;
}

-(CGPoint) getCenter{
    return self.center;
}

-(int) getRow{
    return tileRow;
}

-(void) setRow:(int)row{
    tileRow = row;
}

-(int) getCol{
    return tileCol;
}

-(void) setCol:(int)col{
    tileCol = col;
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
