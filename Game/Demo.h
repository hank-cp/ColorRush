//
//  Demo.h
//  ColorRush
//
//  Created by Steve Paul on 8/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum{
    kBody=1,
    kEar,
    kEye,
    kFace,
    kStomach,
    
}GameSceneTags;

@interface Demo : CCLayer {
    CCSpriteBatchNode *batch;
}

+ (id)scene;
+ (CGPoint)locationFromTouch:(UITouch*)touch;

@end
