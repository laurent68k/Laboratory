//
//  CPPObjCWrapper.m
//  test
//
//  Created by Laurent on 21/10/2017.
//  Copyright © 2017 Laurent68k. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OCPoint3D.h"

#import "CPPClass.hpp"

/// Private part for this class: "private C++ specific to hide"
@interface OCPoint3D () {

    CPPPoint3D       *point3D;
}

@end

/// Class implementation
@implementation OCPoint3D

@synthesize        name;

-(id) init {
    
    self = [super init];
    
    if( self != nil ) {
        
        self->name = [NSString string];
        self->point3D = new CPPPoint3D(0,0,0);
    }
    
    return self;
}

-(id) initWithName:(NSString *)name {
   
    self = [super init];
    
    if( self != nil ) {
        
        self->name = name;
        self->point3D = new CPPPoint3D(0,0,0);
    }
    
    return self;
}

-(id) initWithNamePosition:(NSString *)name x:(int)x y:(int)y z:(int)z {
    
    self = [super init];
    
    if( self != nil ) {
        
        self->name = name;
        self->point3D = new CPPPoint3D(x,y,z);
    }
    
    return self;
}


-(void) dealloc {

    NSLog(@"dealloc called");
    
    delete self->point3D;
}

-(void) print:(NSString *)text {
    
    //CPPPoint2D toto(0,0);
    
    self->point3D->print(std::string(text.cString));
}

@end

