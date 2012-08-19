//
//  Demo.m
//  ColorRush
//
//  Created by Steve Paul on 8/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Demo.h"
//#import "ColorPadLayer.h"

@implementation Demo

+ (id)scene {
    CCScene *scene = [CCScene node];
    Demo *layer = [Demo node];
    [scene addChild:layer];
    return scene;
}

- (id)init {
    if (self = [super init]) {
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        
        CCSpriteFrameCache *frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [frameCache addSpriteFramesWithFile:@"Demo.plist"];
        
        CCSprite *body = [CCSprite spriteWithSpriteFrameName:@"1.png"];
        [self addChild:body z:1 tag:kBody];
        body.position=CGPointMake(screenSize.width/2, screenSize.height/2);
        [body setBlendFunc:(ccBlendFunc){GL_ONE,GL_ONE}];
        
        CCSprite *ear = [CCSprite spriteWithSpriteFrameName:@"2.png"];
        [self addChild:ear z:2 tag:kEar];
        ear.position=CGPointMake(screenSize.width/2, screenSize.height/2);
        
        CCSprite *eye = [CCSprite spriteWithSpriteFrameName:@"5.png"];
        [self addChild:eye z:3 tag:kEye];
        eye.position = CGPointMake(screenSize.width/2, screenSize.height/2);
        
//        ColorPadLayer *layerColor = [ColorPadLayer node];
//        [self addChild:layerColor];
        
        self.isTouchEnabled = YES; 
    }
    return self;
}

+ (CGPoint)locationFromTouch:(UITouch *)touch {
    CGPoint location = [touch locationInView:[touch view]];
    return [[CCDirector sharedDirector] convertToGL:location];
}

- (void)registerWithTouchDispatcher {
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:-1 swallowsTouches:YES];
}

- (int)touchTags:(CGPoint)pos {
    int result;
    CCNode *node_1 = [self getChildByTag:kBody];
    CCNode *node_2 = [self getChildByTag:kEar];
    CCNode *node_3 = [self getChildByTag:kEye];
    
    if (CGRectContainsPoint([node_1 boundingBox], pos)&&(!CGRectContainsPoint([node_3 boundingBox], pos))) {
        result=1;
        
    } else if(CGRectContainsPoint([node_2 boundingBox], pos)&&(!CGRectContainsPoint([node_3 boundingBox], pos))){
        result=2;
        
    } else if(CGRectContainsPoint([node_3 boundingBox], pos)){
        result=3;
    }
    return  result;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint location = [Demo locationFromTouch:touch];
    int touchTag = [self touchTags:location];
    if (touchTag == kBody) {
        CCNode *node = [self getChildByTag:kBody];
        NSAssert([node isKindOfClass:[CCSprite class]], @"not a sprite");
        CCSprite *sprite = (CCSprite*)node;
        sprite.color = ccGREEN;
    }
    if (touchTag==kEar) {
        CCNode *node=[self getChildByTag:kEar];
        NSAssert([node isKindOfClass:[CCSprite class]], @"not a sprite");
        CCSprite *sprite = (CCSprite*)node;
        sprite.color = ccBLUE;
    }
    if (touchTag==kEye) {
        CCNode *node=[self getChildByTag:kEye];
        NSAssert([node isKindOfClass:[CCSprite class]], @"not a sprite");
        CCSprite *sprite = (CCSprite*)node;
        sprite.color = ccc3(23, 87, 88);
    }
    return YES;
}

@end
