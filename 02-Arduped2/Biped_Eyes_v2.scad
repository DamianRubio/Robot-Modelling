//Biped_Eyes_v2

//variables
xBase = 15;
yBase = 47;
zBase = 3;

xBack = 3;
yBack = 47;
zBack = 20;

bigHolesD = 16.2;
bigHolesH = xBack+1;
bigHolesMargin = 2.3;

upperHolesD = 2.5;
upperHolesH = (xBack+1)/2;
upperHolesSeparation = 13-upperHolesD;
upperHolesZPosition = 17.25 + upperHolesD/2;

lowerHolesD = 4.3;
lowerHolesH = (xBack+1)/2;
lowerHolesSeparation = 14.75-lowerHolesD;
lowerHolesZPosition = 0.75 + lowerHolesD/2;

bottomBigHoleD = 7.39;
bottomHidenHole = 6.18;
bottomSmallHoleD = 4.4;
bottomHolesSeparation = 32.4-bottomSmallHoleD;
bottomHolesH = (zBase+1)/2;

//modules
module bipedEyes(){
    union(){
        translate([0,0,zBase])
            back();
        base();
    }
}

module back(){
    difference(){
        platform(xBack, yBack, zBack);
        translate([xBack/2,bigHolesMargin+bigHolesD/2,zBack/2])
            bigHoles(bigHolesH, bigHolesD);
        translate([xBack/2,yBack - bigHolesMargin-bigHolesD/2,zBack/2])
            bigHoles(bigHolesH, bigHolesD);
        translate([xBack,yBack/2-upperHolesSeparation/2,upperHolesZPosition])
            strechedHoles(upperHolesH, upperHolesD, upperHolesSeparation);
        translate([xBack,yBack/2-lowerHolesSeparation/2,lowerHolesZPosition])
            strechedHoles(lowerHolesH, lowerHolesD, lowerHolesSeparation);
    }
}

module bigHoles(hh, hd){
    rotate([0,90,0])
                cylinder(h=hh, d=hd, center=true);
}

module strechedHoles(uh, ud, us){    
    hull(){
        rotate([0,90,0])
            cylinder(h=uh, d=ud, center=true, $fn=20);
        translate([0,us,0])
            rotate([0,90,0])
                cylinder(h=uh, d=ud, center=true, $fn=20);
    }       
}

module base(){    
    difference(){
        platform(xBase, yBase, zBase);
        translate([xBase/2,yBase/2-bottomHolesSeparation/2,0])
            bottomHole();
    }
}

module bottomHole(){
    union(){
        hull(){
        cylinder(h=bottomHolesH, d=bottomSmallHoleD, center=true, $fn=20);
        translate([0,bottomHolesSeparation/2,0])
            cylinder(h=bottomHolesH, d=bottomHidenHole, center=true, $fn=100);        
        translate([0,bottomHolesSeparation,0])
            cylinder(h=bottomHolesH, d=bottomSmallHoleD, center=true, $fn=20);
    }
        translate([0,bottomHolesSeparation/2,0])
            cylinder(h=bottomHolesH, d=bottomBigHoleD, center=true, $fn=100);
    }
    
}


module platform(x, y, z){
    cube([x,y,z]);
}

//invocation
bipedEyes();