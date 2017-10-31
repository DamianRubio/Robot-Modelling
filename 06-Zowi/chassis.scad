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

//Parte Izqda
xTotalIzqda = 74;
yTotalIzqda = 9;
zTotalIzqda = 7;

yIzqdaPosition = 10;

//Circulos parte izqda
circleLeftD = 3.5;
circleLeftH = 12;

//Cuadrados de la parte izqda
xSquareLeft = 3;
ySquareLeft = 6;
zSquareLeft = 6;

xPositionSquareLeft = 4;

//Cuadrados para restar
xCuadrado = 14;
yCuadrado = 11;
zCuadrado = 12;

xPositionCuadrado = 25;
yPositionCuadrado = 2;
xCuadradoSeparation = 2;

//chimenea
xExteriorChimenea = 55;
yExteriorChimenea = 32;
zChimenea = 37;

rCornerChimenea = 2;
grosorChimenea = 2;

//invocations
module chassis(){
   difference(){
       chassisAlfa();
       translate([xPositionCuadrado,yPositionCuadrado,0])
        cube([xCuadrado,yCuadrado,zCuadrado]);
       translate([xPositionCuadrado+xCuadradoSeparation+xCuadrado,yPositionCuadrado,0])
        cube([xCuadrado,yCuadrado,zCuadrado]);
   }
}

module chassisAlfa(){
    union(){
        baseWithScrewHoles();
        translate([xBackHolePosition,yIzqdaPosition,zBase])
            leftSideBaseHoled();
        translate([0,yBase/2-xExteriorChimenea/2,0])
            chimenea();
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

module leftSideBase(){
    union(){
        translate([0,rCorner,0])
            cube([xTotalIzqda,yTotalIzqda-rCorner,zTotalIzqda]);
            cube([xTotalIzqda,yTotalIzqda,zTotalIzqda-rCorner]);
        translate([0,rCorner,zTotalIzqda-rCorner])
            rotate([0,90,0])
                cylinder(h=xTotalIzqda,r=rCorner,$fn=20);
    }
}

module leftSideBaseHoled(){
    difference(){
        leftSideBase();
        //Agujero atrás
        translate([circleLeftH/2,yTotalIzqda/2,zTotalIzqda/2])
            rotate([0,90,0])
                cylinder(h=circleLeftH,d=circleLeftD,center=true,$fn=20);
        //Agujero alante
        translate([circleLeftH/2+xTotalIzqda-circleLeftH,yTotalIzqda/2,zTotalIzqda/2])
            rotate([0,90,0])
                cylinder(h=circleLeftH,d=circleLeftD,center=true,$fn=20);
        
        //Cuadrado atrás
        translate([xPositionSquareLeft,yTotalIzqda/2-ySquareLeft/2,zTotalIzqda-zSquareLeft])
            cube([xSquareLeft,ySquareLeft,zSquareLeft]);
        
        //Cuadrado alante
        translate([xTotalIzqda-xPositionSquareLeft,yTotalIzqda/2-ySquareLeft/2,zTotalIzqda-zSquareLeft])
            cube([xSquareLeft,ySquareLeft,zSquareLeft]);        
    }
}

module chimenea(){
    translate([0,xExteriorChimenea,0])
    rotate([0,0,270])
    difference(){
        hull(){
            translate([rCornerChimenea,rCornerChimenea,0])
                cylinder(h=zChimenea,r=rCornerChimenea,$fn=20);
            translate([xExteriorChimenea-rCornerChimenea,rCornerChimenea,0])
                cylinder(h=zChimenea,r=rCornerChimenea,$fn=20);
            translate([rCornerChimenea,yExteriorChimenea-rCornerChimenea,0])
                cylinder(h=zChimenea,r=rCornerChimenea,$fn=20);
            translate([xExteriorChimenea-rCornerChimenea,yExteriorChimenea-rCornerChimenea,0])
                cylinder(h=zChimenea,r=rCornerChimenea,$fn=20);
        }
        
        translate([grosorChimenea, grosorChimenea, 0])
        hull(){
            translate([rCornerChimenea,rCornerChimenea,0])
                cylinder(h=zChimenea,r=rCornerChimenea,$fn=20);
            translate([xExteriorChimenea-rCornerChimenea-2*grosorChimenea,rCornerChimenea,0])
                cylinder(h=zChimenea,r=rCornerChimenea,$fn=20);
            translate([rCornerChimenea,yExteriorChimenea-rCornerChimenea-2*grosorChimenea,0])
                cylinder(h=zChimenea,r=rCornerChimenea,$fn=20);
            translate([xExteriorChimenea-rCornerChimenea-2*grosorChimenea,yExteriorChimenea-rCornerChimenea-2*grosorChimenea,0])
                cylinder(h=zChimenea,r=rCornerChimenea,$fn=20);
        }
    }
}

chassis();
