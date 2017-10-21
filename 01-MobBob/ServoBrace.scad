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
holeH = 100;

//modules
module FrontSide(){
    difference(){
        cube([xFrontSide, yFrontSide, zFrontSide]);
        translate([xFrontSide,(yFrontSide-yBackSide)/2,zFrontSide/2])
            rotate([0,90,0])
                cylinder(h=holeH, d=holeD, center=true);
    }
}

module FrontCenter(){
    difference(){
        cube([xFrontCenter, yFrontCenter, zFrontCenter]);
        translate([xFrontCenter,yFrontCenter/2,zFrontSide/2]){
            rotate([0,90,0])
                cylinder(h=holeH, d=holeD, center=true);
        }
    }
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

module ServoBrace(){
    union(){
        FrontSide();
        translate([-xBackSide,yFrontSide-yBackSide,0])
        RealBack();
        translate([0,yFrontSide+yBack-2*yBackSide,0])
            FrontCenter();
        translate([-xBackSide,yFrontSide+yFrontCenter+yBack-3*yBackSide,0])
            RealBack();
        translate([0,2*yFrontSide+yFrontCenter+2*yBack-4*yBackSide,0])
            rotate([0,0,180])
            FrontSide();
    }
}

ServoBrace();