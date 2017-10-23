//Biped_Platform_v2

//variables
xyPlatform = 62;
zPlatform = 3;
cornerRadius = 6;

xRectangularHole = 23;
yRectangularHole = 13;
zRectangularHole = zPlatform+1;

screwHeadD = 6.35;
xScrewDistance = 3.75;
yScrewDistance = 12.95;
screwRoundedHeadD = 3.16;

//upperBox
xTopUpperBox = 8.5;
yTopUpperBox = 16;
zTopUpperBox = 3;

xLeftSideUpperBox = 8.5;
yLeftSideUpperBox = 0.5;
zLeftSideUpperBox = 3;

xRightSideUpperBox = 8.5;
yRightSideUpperBox = 3;
zRightSideUpperBox = 3;

xBackUpperBox = 3;
yBackUpperBox = 12.5;
zBackUpperBox = 3;



//modules
module bipedPlatform(){
    difference(){
        union(){
            holedPlatform();
            translate([xyPlatform/2-xRectangularHole/2-xLeftSideUpperBox,0,zPlatform])
                    upperBoxes();
        }
        translate([xyPlatform/2-xRectangularHole/2-screwHeadD/2,yLeftSideUpperBox+yBackUpperBox/2,0])
        bigHoles();      
    }       
}

module bigHole(){
    altura=zPlatform+zLeftSideUpperBox+zTopUpperBox+2;
    translate([0,0,altura/2-1])
        cylinder(h=altura, d=screwRoundedHeadD, center=true, $fn=20);
}

module bigHoles(){
    union(){
        bigHole();
        translate([28.5,0,0])
        mirror()
            bigHole();
        translate([0,xyPlatform-(4.5+yLeftSideUpperBox)*2-screwRoundedHeadD,0])
        mirror()
            bigHole();
        translate([28.5,xyPlatform-(4.5+yLeftSideUpperBox)*2-screwRoundedHeadD,0])
        mirror()
            bigHole();
    }    
}

module platform(){
    translate([cornerRadius,cornerRadius,0])
        hull(){        
            cylinder(h=zPlatform,d=cornerRadius*2, $fn=20);
            translate([xyPlatform-cornerRadius*2,0,0])
                cylinder(h=zPlatform,d=cornerRadius*2, $fn=20);
            translate([0,xyPlatform-cornerRadius*2,0])    
                cylinder(h=zPlatform,d=cornerRadius*2, $fn=20);
            translate([xyPlatform-cornerRadius*2,xyPlatform-cornerRadius*2,0])    
                cylinder(h=zPlatform,d=cornerRadius*2, $fn=20);
        }
}

module holedPlatform(){
    difference(){
        platform();
        //rectangulos
        translate([xyPlatform/2-xRectangularHole/2, 0, 0])
            cube([xRectangularHole,yRectangularHole,zRectangularHole]);
        translate([xyPlatform/2-xRectangularHole/2, xyPlatform-yRectangularHole, 0])
            cube([xRectangularHole,yRectangularHole,zRectangularHole]);
        
        //tornillos dcha
        translate([xScrewDistance+screwHeadD/2, xyPlatform-yScrewDistance-screwHeadD/2, zPlatform])
            cylinder(h=(zPlatform+1)/2,d=screwHeadD, center=true, $fn=6);
        translate([xScrewDistance+screwHeadD/2, xyPlatform-yScrewDistance-screwHeadD/2, 0])
            cylinder(h=zPlatform+1,d=screwRoundedHeadD, center=true, $fn=20);
        
        //tornillos izdq
        translate([xScrewDistance+screwHeadD/2, yScrewDistance+screwHeadD/2, zPlatform])
            cylinder(h=(zPlatform+1)/2,d=screwHeadD, center=true, $fn=6);
        translate([xScrewDistance+screwHeadD/2, yScrewDistance+screwHeadD/2, 0])
            cylinder(h=zPlatform+1,d=screwRoundedHeadD, center=true, $fn=20);
        }        
    }
    
module upperBox(){
    difference(){
        union(){
            translate([0,0,zLeftSideUpperBox])
                cube([xTopUpperBox, yTopUpperBox, zTopUpperBox]);
            cube([xLeftSideUpperBox, yLeftSideUpperBox, zLeftSideUpperBox]);
            translate([0,yTopUpperBox-yRightSideUpperBox,0])
                cube([xRightSideUpperBox, yRightSideUpperBox, zRightSideUpperBox]);
            translate([0,yLeftSideUpperBox,0])
                cube([xBackUpperBox, yBackUpperBox, zBackUpperBox]);   
        }
        translate([2.6+screwHeadD/2, yLeftSideUpperBox+yBackUpperBox/2, (zTopUpperBox+1)/2+zLeftSideUpperBox])
            cylinder(h=(zPlatform+1)/2,d=screwHeadD, center=true, $fn=6);    
    }    
}

module upperSideBoxes(){
    union(){
        upperBox();
        translate([xLeftSideUpperBox*2+xRectangularHole,0,0])
            mirror([1,0,0]){
                upperBox();
            }
    }
}

module upperBoxes(){
    union(){
        upperSideBoxes();
        translate([0,xyPlatform,0])
            rotate([0,0,180])
                mirror([1,0,0]){
                    upperSideBoxes();
                }
        }
}
    
//invocation
bipedPlatform();