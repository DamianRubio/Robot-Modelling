//BipedBrackets

//variables
xBack = 3;
yBack = 25.4;
zBack = 12.7;

xSide = 22.4;
ySide = 3;
zSide = 12.7;

cornerSize = xSide - 16.4;

holesD = 2;
holesH = xBack+1;

backHolesZPosition = 7.25 + holesD/2;

sideHolesXPosition1 = 2.15;
sideHolesXPosition2 = 14.65;
sideHolesZPosition = 2;

//modules
module bipedBrackets(){
    oneBipedBracket();
    mirror([0,1,0])        
        translate([10, -10, 0])
            oneBipedBracket();
}

module oneBipedBracket(){
    union(){
        back();
        translate([xBack,yBack-ySide,0])
            side();
    }
}

module back(){
    difference(){
        platform(xBack, yBack, zBack);
        translate([xBack/2,2.4+holesD/2,backHolesZPosition])
            backHole();
        translate([xBack/2,14.9+holesD/2,backHolesZPosition])
            backHole();
    }   
}

module side(){
    difference(){
        sideWall();
        translate([xSide-sideHolesXPosition1-holesD/2,ySide/2,sideHolesZPosition])
            sideHole();
        translate([xSide-sideHolesXPosition2-holesD/2,ySide/2,sideHolesZPosition])
            sideHole();
    }
    
}

module sideWall(){
    hull(){
        platform(xSide, ySide, zSide/2);
        platform(xSide/2, ySide, zSide);
        translate([xSide-cornerSize/2,ySide/2,zSide-cornerSize/2])
            rotate([90,0,0])
                cylinder(h=ySide, d=cornerSize, center=true, $fn=20);
    }
}

module sideHole(){
    rotate([90,0,0])
        cylinder(h=holesH, d=holesD, center=true, $fn=20);
}

module backHole(){
    rotate([0,90,0])
        cylinder(h=holesH, d=holesD, center=true, $fn=20);
}

module platform(x, y, z){
    cube([x,y,z]);
}

//invocation
bipedBrackets();