//LegPart-v3

//variables
xBack = 3;
yBack = 34;
zBack = 10;

bigBackHoleD = 4;
smallHolesD = 1;
bigSideHoleD = 5;

sideCylinderH = 4.5;
sideCylinderCenterA = 11.5;
sideCylinderCenterB = 17.5;
holeH = 12;

xSide = 24;
ySide = 3;
zSide = 10;


//modules
module back(){
    difference(){
        cube([xBack, yBack, zBack]);
        translate([xBack,yBack/2,zBack/2])
            rotate([0,90,0])
                cylinder(h=holeH, d=bigBackHoleD, center=true, $fn=20);
        translate([xBack,yBack/4,zBack/2])
            rotate([0,90,0])
                cylinder(h=holeH, d=smallHolesD, center=true, $fn=20);
        translate([xBack,3*(yBack/4),zBack/2])
            rotate([0,90,0])
                cylinder(h=holeH, d=smallHolesD, center=true, $fn=20);
        }
}

module side(){
    union(){
        cube([xSide, ySide, zSide]);
        translate([xSide,ySide,zSide/2])
            rotate([90,0,0])
                cylinder(h=ySide, d=zSide, $f=20);
    }    
}

module rightSide(){
    difference(){
        side();
        translate([sideCylinderCenterA,0,zSide/2])
            rotate([90,0,0])
                cylinder(h=holeH, d=smallHolesD, center=true, $fn=20);
        translate([sideCylinderCenterB,0,zSide/2])
            rotate([90,0,0])
                cylinder(h=holeH, d=smallHolesD, center=true, $fn=20);
        translate([xSide,0,zSide/2])
            rotate([90,0,0])
                cylinder(h=holeH, d=bigSideHoleD, center=true, $fn=20);
    }
}

module leftSide(){
    union(){
        side();
        translate([xSide,ySide+sideCylinderH,zSide/2])
            rotate([90,0,0])
                cylinder(h=sideCylinderH, d=bigSideHoleD, $fn=20);
    }    
}


module legPartV3(){
    union(){
        back();
        translate([0,-ySide,0])
            leftSide();
        translate([0,yBack,0])
            rightSide();
    }
}

legPartV3();