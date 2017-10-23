//footL
//librería disponible en https://www.thingiverse.com/thing:1731893
include <screw_holes.scad>

//variables
xBase = 72;
yBase = 58;
zBase = 4;

xSecondPlatform = 42;
ySecondPlatform = 58;
zSecondPlatform = 1;

xSecondPlatformPosition = 10;

xTopSide = 38;
yTopSide = 8;
zTopSide = 19;

xTopBack = 4;
yTopBack = 58;
zTopBack = 19;

backScrewD = 3.5;
backScrewHeadDeep = 2;
backScrewHeadD = 5.5;
backScrewYPostion = 17.75 + backScrewD/2;

sideScrewD = 3.5;
sideScrewHeadDeep = 5;
sideScrewHeadD = 6;
sideScrewLength = 16 + sideScrewHeadDeep;
sideScreewZ= 3;

cornerRadius = 9;

xSideRHole = 4;
ySideRHole = 7;
zSideRHole = 19;
xSideRHolePosition = 26.5;
ySideRHolePosition = 1;

xSideSHole = 3;
ySideSHole = 7;
zSideSHole = 6;
xSideSHolePosition = 19.5;
ySideSHolePosition = 1;
zSideSHolePosition = 2;
zUpperSHolePosition = 4;

xLastHole = 6;
yLastHole = 8;
zLastHole = 14;
xLastHolePosition = 1;
zLastHolePosition = 5;

//modules
module footL(){
    difference(){
        base();
    
        #translate([0,30,zBase+zSecondPlatform+zTopBack]) 
            rotate([0,-20,0]) 
                cube([90,90,10], center = true);
    
        mirror(){
                                        #translate([-xTopBack-xTopSide-xSecondPlatformPosition-10,30,zBase+zSecondPlatform+zTopBack]) 
        rotate([0,-20,0]) 
            cube([90,90,10], center = true);
    }
    }
}

module base(){
    difference(){
        basic();
        screws();
        rectangularHoles();
        squaredHoles();
        lastHole();
    }
}

module basic(){
    union(){
        firstBase();
        secondBase();
        topSide();
        topBack();
    }
}

module firstBase(){
    translate([cornerRadius,cornerRadius,0])
        hull(){
            translate([0,0,zBase/2])
                cylinder(h=zBase, d=cornerRadius*2, center=true, $fn=20);
            translate([xBase-2*cornerRadius,0,zBase/2])
                cylinder(h=zBase, d=cornerRadius*2, center=true, $fn=20);
            translate([0,yBase-2*cornerRadius,zBase/2])
                cylinder(h=zBase, d=cornerRadius*2, center=true, $fn=20);
            translate([xBase-2*cornerRadius,yBase-2*cornerRadius,zBase/2])
                cylinder(h=zBase, d=cornerRadius*2, center=true, $fn=20);
        }
}

module secondBase(){
    translate([xSecondPlatformPosition,0,zBase])
        cube([xSecondPlatform, ySecondPlatform, zSecondPlatform]);
}

module topSide(){
    translate([xSecondPlatformPosition+xSecondPlatform-xTopSide,0,zBase+zSecondPlatform])
        cube([xTopSide, yTopSide, zTopSide]);
    translate([xSecondPlatformPosition+xSecondPlatform-xTopSide,yBase-yTopSide,zBase+zSecondPlatform])
        cube([xTopSide, yTopSide, zTopSide]);
}

module topBack(){
    translate([xSecondPlatformPosition,0,zBase+zSecondPlatform])
        cube([xTopBack, yTopBack, zTopBack]);
}

module screws(){
    backScrew();
    sideScrews();
}

module backScrew(){
    translate([xSecondPlatformPosition+xTopBack,backScrewYPostion,zBase+zSecondPlatform+zTopBack/2])
        rotate([0,270,0])
            screw_hole([backScrewHeadD, backScrewHeadDeep, 180], backScrewD, 30);
}


module sideScrews(){
    //izq arriba
    translate([xSecondPlatformPosition+xTopSide+xTopBack,1.5+sideScrewHeadD/2,zBase+sideScreewZ+sideScrewHeadD/2+10])
        rotate([0,270,0])
            screw_hole([sideScrewHeadD, sideScrewHeadDeep, 180], sideScrewD, sideScrewLength);
    
    //izq abajo
    translate([xSecondPlatformPosition+xTopSide+xTopBack,1.5+sideScrewHeadD/2,zBase+sideScreewZ+sideScrewHeadD/2])
        rotate([0,270,0])
            screw_hole([sideScrewHeadD, sideScrewHeadDeep, 180], sideScrewD, sideScrewLength);
    
    //dcha arriba
    translate([xSecondPlatformPosition+xTopSide+xTopBack,yBase-1.5-sideScrewHeadD/2,zBase+sideScreewZ+sideScrewHeadD/2+10])
        rotate([0,270,0])
            screw_hole([sideScrewHeadD, sideScrewHeadDeep, 180], sideScrewD, sideScrewLength);
    
    //dcha abajo
    translate([xSecondPlatformPosition+xTopSide+xTopBack,yBase-1.5-sideScrewHeadD/2,zBase+sideScreewZ+sideScrewHeadD/2])
        rotate([0,270,0])
            screw_hole([sideScrewHeadD, sideScrewHeadDeep, 180], sideScrewD, sideScrewLength);
}

module rectangularHoles(){
    translate([xSecondPlatformPosition+xTopBack+xSideRHolePosition,ySideRHolePosition,zBase+zSecondPlatform])
        cube([xSideRHole, ySideRHole, zSideRHole]);
    translate([xSecondPlatformPosition+xTopBack+xSideRHolePosition,yBase-ySideRHolePosition-ySideRHole,zBase+zSecondPlatform])
        cube([xSideRHole, ySideRHole, zSideRHole]);
}

module squaredHoles(){
    //izq arriba
    translate([xSecondPlatformPosition+xTopBack+xSideSHolePosition,ySideSHolePosition,zBase+zSecondPlatform+zSideSHole+zUpperSHolePosition+zSideSHolePosition])
        cube([xSideSHole, ySideSHole, zSideSHole]);
    
    //izq abajo
    translate([xSecondPlatformPosition+xTopBack+xSideSHolePosition,ySideSHolePosition,zSideSHolePosition+zBase+zSecondPlatform])
        cube([xSideSHole, ySideSHole, zSideSHole]);
    
    //dcha arriba
    translate([xSecondPlatformPosition+xTopBack+xSideSHolePosition,yBase-ySideSHolePosition-ySideSHole,zBase+zSecondPlatform+zSideSHole+zUpperSHolePosition+zSideSHolePosition])
        cube([xSideSHole, ySideSHole, zSideSHole]);
    
    //dcha abajo
    translate([xSecondPlatformPosition+xTopBack+xSideSHolePosition,yBase-ySideSHolePosition-ySideSHole,zSideSHolePosition+zBase+zSecondPlatform])
        cube([xSideSHole, ySideSHole, zSideSHole]);
}

module lastHole(){
    translate([xSecondPlatformPosition+xTopBack+xLastHolePosition,0,zBase+zSecondPlatform+zLastHolePosition])
        cube([xLastHole, yLastHole, zLastHole]);
}

//invocation
footL();