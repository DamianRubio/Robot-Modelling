//DCGEARED
//librería disponible en https://www.thingiverse.com/thing:1731893
include <screw_holes.scad>

//variables
xBase = 20;
yBase = 40;
zBase = 40;

//holes
dHoles = 5;
hHoles = xBase * 3;

xRectHole = 13;
yRectHole = 11;
zRectHole = 35;

xLatHoles = 7;
yLatHoles = 3.5;
zLatHoles = xBase*4;

yLatDiff = 1.5;

//Tornillo
screwHeadD = 5;
screwHeadDeep = 3;
backScrewD = 3;

//modules
module body4(){
    difference(){
        base();
        holes();
        rectHole();
        latHoles();
        screwHole();
        hull(){
            #translate([xBase/2-xLatHoles/4,0,0])
                rotate([45,90,0])
                    cube([100,yLatHoles,xLatHoles/4], center = true);
            #translate([xBase/2+xLatHoles/4,0,0])
                rotate([135,90,0])
                    cube([100,yLatHoles,xLatHoles/4], center = true);
        }
        translate([xBase,yBase,0])
        rotate([0,0,180])
        hull(){
            #translate([xBase/2-xLatHoles/4,0,0])
                rotate([45,90,0])
                    cube([100,yLatHoles,xLatHoles/4], center = true);
            #translate([xBase/2+xLatHoles/4,0,0])
                rotate([135,90,0])
                    cube([100,yLatHoles,xLatHoles/4], center = true);
        }
    }
}


module base(){
    cube([xBase,yBase,zBase]);
}

module holes(){
    //agujero1
    translate([0,(yBase/2)/2,(zBase/2)/2+zBase/2])
        rotate([0,90,0])
            cylinder(h=hHoles, d=dHoles,center=true,$fn=20);
    //agujero2
    translate([0,(yBase/2)/2+yBase/2,(zBase/2)/2+zBase/2])
        rotate([0,90,0])
            cylinder(h=hHoles, d=dHoles,center=true,$fn=20);
    //agujero3
    translate([0,(yBase/2)/2,(zBase/2)/2])
        rotate([0,90,0])
            cylinder(h=hHoles, d=dHoles,center=true,$fn=20);
    //agujero4
    translate([0,(yBase/2)/2+yBase/2,(zBase/2)/2])
        rotate([0,90,0])
            cylinder(h=hHoles, d=dHoles,center=true,$fn=20);
}

module rectHole(){
    translate([xBase/2-xRectHole/2,yBase/2-yRectHole/2,zBase-zRectHole])
        cube([xRectHole,yRectHole,zRectHole]);
}

module latHoles(){
    //agujero1
    translate([xBase/2-xLatHoles/2,yLatDiff,-zBase/4])
        cube([xLatHoles,yLatHoles,zLatHoles]);
    //agujero2
    translate([xBase/2-xLatHoles/2,yBase-yLatDiff-yLatHoles,-zBase/4])
        cube([xLatHoles,yLatHoles,zLatHoles]);
}

module screwHole(){
    translate([xBase/2,yBase/2,zBase-zRectHole])
        rotate([0,180,0])
            screw_hole([screwHeadD, screwHeadDeep, 180], backScrewD, 30);
}

body4();
