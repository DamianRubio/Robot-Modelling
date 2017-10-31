//Chassis

//librería disponible en https://www.thingiverse.com/thing:1731893
include <screw_holes.scad>

//variables
xBase = 80;
yBase = 80;
zBase = 5;

rCorner = 3;

xHole = 21;
yHole = 41;
zHole = zBase+2;

xFrontHolePosition = xBase-xHole-3;
yFrontHolePosition = 28.84;

xBackHolePosition = 3;
yBackHolePosition = yFrontHolePosition;

//Agujeros con tornillos izqda
xLeftSquareScrewHoles = 9.5;
yLeftSquareScrewHoles = 7;
zLeftSquareScrewHoles = 4;

xLeftSquareSeparations = 2;
yLeftSquareSeparations = yLeftSquareScrewHoles;
zLeftSquareSeparations = 2;

//Tornillos para agujeros
screwHeadD = 6;
screwHeadDeep = 3;
backScrewD = 3.5;

//Parte dcha
xTotalDcha = 74;
yTotalDcha = 7;
zTotalDcha = 4;

//invocations
module chassis(){
    union(){
        baseWithScrewHoles();
    }
}

module holedBase(){
    difference(){
        hull(){
            translate([rCorner,rCorner,0])
                cylinder(h=zBase,r=rCorner,$fn=20);
            translate([rCorner,yBase-rCorner,0])
                cylinder(h=zBase,r=rCorner,$fn=20);
            translate([xBase-rCorner,rCorner,0])
                cylinder(h=zBase,r=rCorner,$fn=20);
            translate([xBase-rCorner,yBase-rCorner,0])
                cylinder(h=zBase,r=rCorner,$fn=20);
        }
        translate([xFrontHolePosition,yFrontHolePosition,0])
            cube([xHole, yHole, zHole]);
        translate([xBackHolePosition,yBackHolePosition,0])
            cube([xHole, yHole, zHole]);    
    }    
}

module leftSideWithoutScrewHoles(){
    cube([xLeftSquareScrewHoles,yLeftSquareScrewHoles,zLeftSquareScrewHoles]);
    translate([xLeftSquareScrewHoles,0,0])
        cube([xLeftSquareSeparations,yLeftSquareSeparations,zLeftSquareSeparations]);
    translate([xLeftSquareScrewHoles+xLeftSquareSeparations,0,0])
        cube([xLeftSquareScrewHoles,yLeftSquareScrewHoles,zLeftSquareScrewHoles]);
    
}

//Base con los suplementos de la izqda para tornillos
module baseWithoutScrewHoles(){
    union(){ 
        holedBase();
        translate([xFrontHolePosition,yFrontHolePosition-yLeftSquareScrewHoles,zBase])
            leftSideWithoutScrewHoles();
        translate([xBackHolePosition,yBackHolePosition-yLeftSquareScrewHoles,zBase])
            leftSideWithoutScrewHoles();
        translate([3,yFrontHolePosition+yHole,zBase])
            rightSideBase();
        }   
}

module screw(){
    screw_hole([screwHeadD, screwHeadDeep, 180], backScrewD, 30);
}

//Base con los suplementos de la izqda para tornillos y los agujeros
module baseWithScrewHoles(){
    difference(){
        baseWithoutScrewHoles();
        //tornillo1
        translate([3+xLeftSquareScrewHoles/2,yFrontHolePosition-yLeftSquareScrewHoles/2,0])
            screw();
        //tornillo2
        translate([3+xLeftSquareScrewHoles/2+xLeftSquareScrewHoles+xLeftSquareSeparations,yFrontHolePosition-yLeftSquareScrewHoles/2,0])
            screw();
        //tornillo3
        translate([xBase-xHole-3+xLeftSquareScrewHoles/2,yFrontHolePosition-yLeftSquareScrewHoles/2,0])
            screw();
        //tornillo4
        translate([xBase-xHole-3+xLeftSquareScrewHoles/2+xLeftSquareScrewHoles+xLeftSquareSeparations,yFrontHolePosition-yLeftSquareScrewHoles/2,0])
            screw();
        //tornillo5
        translate([3+xLeftSquareScrewHoles/2,yFrontHolePosition-yLeftSquareScrewHoles/2+yHole+yLeftSquareScrewHoles,0])
            screw();
       //tornillo6
        translate([3+xLeftSquareScrewHoles/2+xLeftSquareScrewHoles+xLeftSquareSeparations,yFrontHolePosition-yLeftSquareScrewHoles/2+yHole+yLeftSquareScrewHoles,0])
            screw(); 
       //tornillo7
         translate([xBase-xHole-3+xLeftSquareScrewHoles/2,yFrontHolePosition-yLeftSquareScrewHoles/2+yHole+yLeftSquareScrewHoles,0])
            screw();
           //tornillo8
        translate([xBase-xHole-3+xLeftSquareScrewHoles/2+xLeftSquareScrewHoles+xLeftSquareSeparations,yFrontHolePosition-yLeftSquareScrewHoles/2+yHole+yLeftSquareScrewHoles,0])
            screw();   
    }  
}

module rightSideBase(){
    difference(){
        hull(){
            cube([xTotalDcha,yTotalDcha-rCorner,zTotalDcha]);
            translate([xTotalDcha-rCorner,yTotalDcha-rCorner,0])
                cylinder(h=zTotalDcha,r=rCorner,$fn=20);
            translate([rCorner,yTotalDcha-rCorner,0])
                cylinder(h=zTotalDcha,r=rCorner,$fn=20);
        }
        translate([xLeftSquareScrewHoles,0,zTotalDcha-zLeftSquareSeparations])
        cube([xLeftSquareSeparations,yLeftSquareSeparations,zLeftSquareSeparations]);
        translate([xTotalDcha-xLeftSquareScrewHoles-xLeftSquareSeparations,0,zTotalDcha-zLeftSquareSeparations])
        cube([xLeftSquareSeparations,yLeftSquareSeparations,zLeftSquareSeparations]);
    }    
}

chassis();
