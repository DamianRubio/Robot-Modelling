//PhoneHolder

//variables

//modules
xRectangle = 2;
yRectangle = 70;
zRectangle = 109.9;

xFrontSide = 14;
yFrontSide = 2;
zFrontSide= 40;

xFrontCenter = 2;
yFrontCenter = yRectangle;
zFrontCenter= 9.9;

yBackBoxTranslation = 9;
zBackBoxTranslation = 56.9;

xBackBox = 2.37;
yBackBox = 52;
zBackBox = 29.4;

xSideBackBox = 16-xBackBox;
ySideBackBox = 4;
zSideBackBox = zBackBox;

xBottomBackBox = 16-xBackBox;
yBottomBackBox = 44.2;
zBottomBackBox = zBackBox - 26;


module mainRectangle(){
       cube([xRectangle, yRectangle, zRectangle]);
}

module frontSide(){
       cube([xFrontSide, yFrontSide, zFrontSide]);
}

module frontCenter(){
       cube([xFrontCenter, yFrontCenter, zFrontCenter]);
}

module frontBox(){
    union(){
        translate([0,-yFrontSide,0])
            frontSide();
        translate([0,yRectangle,0])
            frontSide();
        translate ([xFrontSide-xRectangle,0,0])
            frontCenter();
        translate([xRectangle,0,0])
            cube([xFrontSide-xFrontCenter-xRectangle,yRectangle,yFrontSide]);
    }    
}

module backBox(){
    union(){
        translate([-xBackBox,yBackBoxTranslation,zBackBoxTranslation-zBackBox])
            cube([xBackBox, yBackBox, zBackBox]);
        translate([-xBackBox-xSideBackBox,yBackBoxTranslation,zBackBoxTranslation-zBackBox])
            cube([xSideBackBox, ySideBackBox, zSideBackBox]);
         translate([-xBackBox-xSideBackBox,yBackBoxTranslation+yBackBox-ySideBackBox,zBackBoxTranslation-zBackBox])
            cube([xSideBackBox, ySideBackBox, zSideBackBox]);
        difference(){
        translate([-xBackBox-xSideBackBox,yBackBoxTranslation+yBackBox-ySideBackBox-yBottomBackBox,zBackBoxTranslation-zBackBox])
            cube([xBottomBackBox, yBottomBackBox, zBottomBackBox]);
        #translate([-10,30,26])
            rotate([0,8,0])
                cube([180,90,1], center = true);
    }
    }
}

module backBoxFinal(){
    difference(){
        backBox();
        #translate([-10,30,60])
            rotate([0,-20,0])
                cube([180,90,10], center = true);
        #translate([-5,30,23])
            rotate([0,8,0])
                cube([180,90,10], center = true);
        #translate([-22,30,25])
            rotate([0,-75,0])
                cube([180,90,10], center = true);
    }
}
module phoneHolder(){
    union(){
        mainRectangle();    
        frontBox();
        backBoxFinal();
    }   
}

phoneHolder();
