//leg

//variables
xUpper = 21;
yUpper = 45;
zUpper = 6;

upperBigHoleD = 22;
upperBigHoleH = 3.3;

upperMediumHoleD = 11;
upperSmallHoleD = 2;

xLeftSide = 21;
yLeftSide = 4;
zLeftSide = 43;

xRightSide = 21;
yRightSide = 5;
zRightSide = 37.72;

leftSideHoleD = 3.5;
cornerLeftD = xLeftSide;

//modules
module leg(){
    union(){
        leftPart();
        thingsToHull();
        upperPart();
        rightPart();
    }
}

module thingsToHull(){
    hull(){
    translate([0,yUpper,zLeftSide+cornerLeftD/2])
        cube([xUpper, 0.01, zUpper]);
    translate([0,yUpper+9-yRightSide,cornerLeftD/2+zRightSide])
        cube([xRightSide, yRightSide, 0.01]);
    }
}

module upperPart(){
    difference(){
        //Parte plana superior
        translate([0,0,zLeftSide+cornerLeftD/2])
            cube([xUpper, yUpper, zUpper]);
        //circulo grande
        translate([xUpper/2, 10.8+yLeftSide+upperBigHoleD/2,zLeftSide+cornerLeftD/2+upperBigHoleH/2])
            cylinder(h=upperBigHoleH, d=upperBigHoleD, center=true, $fn=20);
        //circulo mediano
        translate([xUpper/2, 10.8+yLeftSide+upperBigHoleD/2,zLeftSide+cornerLeftD/2+zUpper/2])
            cylinder(h=zUpper, d=upperMediumHoleD, center=true, $fn=20);
        
        //circulos pequeños
        translate([3, 10.8+yLeftSide+upperBigHoleD/2-3.25,zLeftSide+cornerLeftD/2+zUpper/2])
            cylinder(h=zUpper, d=upperSmallHoleD, center=true, $fn=20);
        translate([xUpper-3, 10.8+yLeftSide+upperBigHoleD/2-3.25,zLeftSide+cornerLeftD/2+zUpper/2])
            cylinder(h=zUpper, d=upperSmallHoleD, center=true, $fn=20);
        translate([xUpper/2, 10.8+yLeftSide+upperBigHoleD/2+upperMediumHoleD/2+(upperBigHoleD-upperMediumHoleD)/4,zLeftSide+cornerLeftD/2+zUpper/2])
            cylinder(h=zUpper, d=upperSmallHoleD, center=true, $fn=20);
    }    
}

module leftPart(){
    difference(){
        leftPartWithoutHole();
        translate([cornerLeftD/2,yLeftSide/2,cornerLeftD/2])
            rotate([90,0,0])
                cylinder(h=yLeftSide+1, d=leftSideHoleD, center=true, $fn=20);
    }
}

module leftPartWithoutHole(){
    union(){
        translate([0,0, cornerLeftD/2])
            cube([xLeftSide, yLeftSide, zLeftSide]);
        translate([cornerLeftD/2,0,cornerLeftD/2])
            rotate([270,0,0])
                cylinder(h=yLeftSide, d=cornerLeftD, $fn=20);
    }    
}

module rightPart(){
    difference(){
        union(){
            translate([0,yUpper+9-yRightSide,cornerLeftD/2])
                cube([xRightSide, yRightSide, zRightSide]);
            translate([cornerLeftD/2,yUpper+9-yRightSide,cornerLeftD/2])
                rotate([270,0,0])
                    cylinder(h=yRightSide, d=cornerLeftD, $fn=20);
        }
        translate([cornerLeftD/2,yUpper+9-yRightSide,cornerLeftD/2])
                rotate([270,0,0])
                    cylinder(h=yRightSide, d=upperMediumHoleD, $fn=20);
        translate([cornerLeftD/2,yUpper+9-yRightSide+2.8,cornerLeftD/2])
                rotate([270,0,0])
                    cylinder(h=yRightSide, d=upperBigHoleD, $fn=20);
        
        //circulos pequeños
        translate([3, yUpper+9-yRightSide+yRightSide/2+2.8-3.25,cornerLeftD/2])
            rotate([270,0,0])
                cylinder(h=zUpper, d=upperSmallHoleD, center=true, $fn=20);
        translate([xRightSide-3, yUpper-yRightSide+yRightSide/2+9+2.8-3.25,cornerLeftD/2])
            rotate([270,0,0])
                cylinder(h=zUpper, d=upperSmallHoleD, center=true, $fn=20);
        translate([xUpper/2, yUpper-yRightSide+yRightSide/2+9+2.8-3.25,cornerLeftD/2-(upperBigHoleD-upperMediumHoleD)/1.5])
            rotate([270,0,0])
                cylinder(h=zUpper, d=upperSmallHoleD, center=true, $fn=20);
    }    
}

//invocation
leg();