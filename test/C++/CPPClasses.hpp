//
//  CPPClass.hpp
//  test
//
//  Created by Laurent on 21/10/2017.
//  Copyright © 2017 Laurent68k. All rights reserved.
//

#ifndef CPPClass_hpp
#define CPPClass_hpp

#include <stdio.h>
#include <string>


using namespace std;

//  ----------------------------------------------------------------------------------------------------------------------------

class CPPPoint2D {
    
protected:
    
    int x;
    int y;
    
protected:
    
    virtual void print(std::string myText);
    
public:
    
    CPPPoint2D();
    CPPPoint2D(int x, int y);
    virtual ~CPPPoint2D();
};

//  ----------------------------------------------------------------------------------------------------------------------------

class CPPPoint3D : private CPPPoint2D {
    
private:
    
    int z;
    
public:
    
    CPPPoint3D();
    CPPPoint3D(int x, int y, int z);
    virtual ~CPPPoint3D();
    
    
    virtual void print( std::string myText);
};


#endif /* CPPClass_hpp */
