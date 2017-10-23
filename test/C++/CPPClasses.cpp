//
//  CPPClass.cpp
//  test
//
//  Created by Laurent on 21/10/2017.
//  Copyright © 2017 Laurent68k. All rights reserved.
//

#include "CPPClasses.hpp"

//  ----------------------------------------------------------------------------------------------------------------------------

CPPPoint2D::CPPPoint2D() {
    
    this->x = 0;
    this->y = 0;
    
    fprintf(stdout, "Consructor CPPPoint2D()\n");
}

CPPPoint2D::CPPPoint2D(int x, int y) {
    
    this->x = x;
    this->y = y;
    
    fprintf(stdout, "Consructor CPPPoint2D(int x, int y)\n");
}

CPPPoint2D::~CPPPoint2D() {

    fprintf(stdout, "Destructor ~CPPPoint2D\n");
}

void CPPPoint2D::print(std::string myText) {
    
    fprintf(stdout, "Point 2D %s position: %d %d", myText.c_str(), this->x, this->y);
}

//  ----------------------------------------------------------------------------------------------------------------------------

CPPPoint3D::CPPPoint3D() : CPPPoint2D() {
    
    this->z = 0;
    fprintf(stdout, "Consructor CPPPoint3D()\n");
}

CPPPoint3D::CPPPoint3D(int x, int y, int z) : CPPPoint2D(x, y) {
    
    this->z = z;
    fprintf(stdout, "Consructor CPPPoint3D(int x, int y, int z)\n");
}

CPPPoint3D::~CPPPoint3D() {
    
    fprintf(stdout, "Destructor ~CPPPoint3D\n");
}
    
void CPPPoint3D::print( std::string myText) {
    
    fprintf(stdout, "Point 3D %s position: %d %d %d\n", myText.c_str(), this->x, this->y, this->z);
}

