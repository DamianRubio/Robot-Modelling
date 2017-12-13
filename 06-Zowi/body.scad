//Body

//variables
xBody = 75;
yBody = xBody;
zBody = 60;

rSpheres = 5;

grosorBody = 2;
scaleFactor = (100-(2*100)/75)/100;

//LeftSideHoles
dLeftSideHoles = 17;
diffLeftSideHoles = 10;
xLeftSideHolesPosition = xBody/2-(dLeftSideHoles*2+diffLeftSideHoles)/2+dLeftSideHoles/2;

//RightSideHoles
dRightSideHoles = 3.5;
diffRightSideHoles = 16.5;
xRightSideHolesPosition = xBody/2-(dRightSideHoles*2+diffRightSideHoles)/2+dRightSideHoles/2;
zRightSideHolesPosition = zBody/2-(dRightSideHoles*2+diffRightSideHoles)/2+dRightSideHoles/2;


//Small Frontand Back Holes
dSmallHoles = dRightSideHoles;
ySmallHoles = 13.5 + dSmallHoles/2;
zSmallHoles = 1.75 + dSmallHoles/2;

//BackSide hole
dBackSideHole = 8;
yBackSideHole = 8 + dBackSideHole/2;
zBackSideHole = 17.5 + dBackSideHole/2;

//FrontSide hole
dFrontSideHole = 12;
yFrontSideHole = 8 + dFrontSideHole/2;
zFrontSideHole = 9.5 + dFrontSideHole/2;

//Front Square
yFrontSquare = 8;
zFrontSquare = 11;
dFrontSquareCorner = 1.5;
yPostionFrontSquare = 5.5;
zPostionFrontSquare = 38;


//modules

module body1(){
    difference(){
        bodyBase();
        translate([xLeftSideHolesPosition,0,0])
            leftSideHoles();
        translate([xRightSideHolesPosition,0,zRightSideHolesPosition])
            rightSideHoles();
        smallHoles();
        backSideHole();
        frontSideHole();
        frontSquareHole();
    }        
}

module bodyBase(){
    difference(){
        bodyBaseSolid();
        translate([grosorBody/2, grosorBody/2,0])
            scale([scaleFactor,scaleFactor,scaleFactor])
                bodyBaseSolid();
    }
}

module bodyBaseSolid(){
    hull(){
        translate([rSpheres,rSpheres,zBody-rSpheres])
            sphere(r=rSpheres, $fn=20);
        translate([xBody-rSpheres,rSpheres,zBody-rSpheres])
            sphere(r=rSpheres, $fn=20);
        translate([rSpheres,yBody-rSpheres,zBody-rSpheres])
            sphere(r=rSpheres, $fn=20);
        translate([xBody-rSpheres,yBody-rSpheres,zBody-rSpheres])
            sphere(r=rSpheres, $fn=20);
        translate([rSpheres,rSpheres,0])
            cylinder(r=rSpheres, h=5, $fn=20);
        translate([xBody-rSpheres,rSpheres,0])
            cylinder(r=rSpheres, h=5, $fn=20);
        translate([rSpheres,yBody-rSpheres,0])
            cylinder(r=rSpheres, h=5, $fn=20);
        translate([xBody-rSpheres,yBody-rSpheres,0])
            cylinder(r=rSpheres, h=5, $fn=20);
    }
}

module leftSideHoles(){
    translate([0, yBody,zBody/2])
        rotate([90,0,0])
            cylinder(h=grosorBody*5, d=dLeftSideHoles, center=true, $fn=20);
    translate([dLeftSideHoles+diffLeftSideHoles, yBody,zBody/2])
        rotate([90,0,0])
            cylinder(h=grosorBody*5, d=dLeftSideHoles, center=true, $fn=20);
}

module rightSideHoles(){
    //agujero1
    translate([0, 0,0])
        rotate([90,0,0])
            cylinder(h=grosorBody*5, d=dRightSideHoles, center=true, $fn=20);
    //agujero2
    translate([diffRightSideHoles+dRightSideHoles/2, 0,0])
        rotate([90,0,0])
            cylinder(h=grosorBody*5, d=dRightSideHoles, center=true, $fn=20);
    //agujero3
    translate([0, 0, diffRightSideHoles+dRightSideHoles/2])
        rotate([90,0,0])
            cylinder(h=grosorBody*5, d=dRightSideHoles, center=true, $fn=20);
    //agujero4
    translate([diffRightSideHoles+dRightSideHoles/2, 0,diffRightSideHoles+dRightSideHoles/2])
        rotate([90,0,0])
            cylinder(h=grosorBody*5, d=dRightSideHoles, center=true, $fn=20);
}

module smallHoles(){
    //agujero1
    translate([0, ySmallHoles, zSmallHoles])
        rotate([0,90,0])
            cylinder(h=grosorBody*5, d=dSmallHoles, center=true, $fn=20);
    //agujero2
    translate([xBody, ySmallHoles, zSmallHoles])
        rotate([0,90,0])
            cylinder(h=grosorBody*5, d=dSmallHoles, center=true, $fn=20);
}

module backSideHole(){
    //agujero1
    translate([0, yBackSideHole, zBackSideHole])
        rotate([0,90,0])
            cylinder(h=grosorBody*5, d=dBackSideHole, center=true, $fn=20);
}

module frontSideHole(){
    //agujero1
    translate([xBody, yFrontSideHole, zFrontSideHole])
        rotate([0,90,0])
            cylinder(h=grosorBody*5, d=dFrontSideHole, center=true, $fn=20);
}

module frontSquareHole(){
    hull(){
        //agujero1
        translate([xBody, yPostionFrontSquare+dFrontSquareCorner/2,zPostionFrontSquare-dFrontSquareCorner/2])
            rotate([0,90,0])
                cylinder(h=grosorBody*5, d=dFrontSquareCorner, center=true, $fn=20);
        //agujero2
        translate([xBody, yPostionFrontSquare+yFrontSquare-dFrontSquareCorner/2,zPostionFrontSquare-dFrontSquareCorner/2])
            rotate([0,90,0])
                cylinder(h=grosorBody*5, d=dFrontSquareCorner, center=true, $fn=20);
        //agujero3
        translate([xBody, yPostionFrontSquare+dFrontSquareCorner/2, zPostionFrontSquare-zFrontSquare+dFrontSquareCorner/2])
            rotate([0,90,0])
                cylinder(h=grosorBody*5, d=dFrontSquareCorner, center=true, $fn=20);
        //agujero4
        translate([xBody, yPostionFrontSquare+yFrontSquare-dFrontSquareCorner/2, zPostionFrontSquare-zFrontSquare+dFrontSquareCorner/2])
            rotate([0,90,0])
                cylinder(h=grosorBody*5, d=dFrontSquareCorner, center=true, $fn=20);
    }
}

body1();