//
//  CPPObjCWrapper.h
//  test
//
//  Created by Laurent on 21/10/2017.
//  Copyright © 2017 Laurent68k. All rights reserved.
//

#ifndef CPPObjCWrapper_h
#define CPPObjCWrapper_h

#import <Foundation/Foundation.h>

@interface OCPoint3D : NSObject {
    
}

@property(nonatomic) NSString*     name;


-(id)               init;
-(id)               initWithName:(NSString *)name;
-(id)               initWithNamePosition:(NSString *)name x:(int)x y:(int)y z:(int)z;

-(void)             print:(NSString *)text;

@end

#endif /* CPPObjCWrapper_h */
