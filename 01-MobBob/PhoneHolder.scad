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
    translate([-xBackBox,yBackBoxTranslation,zBackBoxTranslation-zBackBox])
        cube([xBackBox, yBackBox, zBackBox]);
}

module phoneHolder(){
    union(){
        mainRectangle();    
        frontBox();
        backBox();
    }   
}

phoneHolder();