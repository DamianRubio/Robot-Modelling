//ServoBrace

//variables
xFrontSide = 2;
yFrontSide = 10;
zFrontSide = 23.5;

xFrontCenter = 2;
yFrontCenter = 30;
zFrontCenter = 23.5;

xBackSide = 16.5;
yBackSide = 2;
zBackSide = 23.5;

xBack = 2;
yBack = 16.5;
zBack = 23.5;

holeD = 3;

//modules
module FrontSide(){
    cube([xFrontSide, yFrontSide, zFrontSide]);
}

module FrontCenter(){
    cube([xFrontCenter, yFrontCenter, zFrontCenter]);
}

module BackSide(){
    cube([xBackSide, yBackSide, zBackSide]);
}

module Back(){
    cube([xBack, yBack, zBack]);
}

module RealBack(){
    BackSide();
    translate([-xBack,0,0])
        Back();
    translate([0,yBack-yBackSide,0])
        BackSide();
}

module withoutHolesServoBrace(){
    union(){
        FrontSide();
        translate([-xBackSide,yFrontSide-yBackSide,0])
        RealBack();
        translate([0,yFrontSide+yBack-2*yBackSide,0])
            FrontCenter();
        translate([-xBackSide,yFrontSide+yFrontCenter+yBack-3*yBackSide,0])
            RealBack();
        translate([0,yFrontSide+yFrontCenter+2*yBack-4*yBackSide,0])
            FrontSide();
    }
}

withoutHolesServoBrace();