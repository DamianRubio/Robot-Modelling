//Body

//variables
xBody = 75;
yBody = xBody;
zBody = 60;

rSpheres = 5;

grosorBody = 2;
scaleFactor = (100-(2*100)/75)/100;

//LeftSideHoles
dLeftSideHoles = 17;
diffLeftSideHoles = 10;
xLeftSideHolesPosition = xBody/2-(dLeftSideHoles*2+diffLeftSideHoles)/2+dLeftSideHoles/2;

//RightSideHoles
dRightSideHoles = 3.5;
diffRightSideHoles = 16.5;
xRightSideHolesPosition = xBody/2-(dRightSideHoles*2+diffRightSideHoles)/2+dRightSideHoles/2;
zRightSideHolesPosition = zBody/2-(dRightSideHoles*2+diffRightSideHoles)/2+dRightSideHoles/2;

//modules

module body(){
    difference(){
        bodyBase();
        translate([xLeftSideHolesPosition,0,0])
            leftSideHoles();
        translate([xRightSideHolesPosition,0,zRightSideHolesPosition])
            rightSideHoles();
    }    
}

module bodyBase(){
    difference(){
        bodyBaseSolid();
        translate([grosorBody/2, grosorBody/2,0])
            scale([scaleFactor,scaleFactor,scaleFactor])
                bodyBaseSolid();
    }
}

module bodyBaseSolid(){
    hull(){
        translate([rSpheres,rSpheres,zBody-rSpheres])
            sphere(r=rSpheres, $fn=20);
        translate([xBody-rSpheres,rSpheres,zBody-rSpheres])
            sphere(r=rSpheres, $fn=20);
        translate([rSpheres,yBody-rSpheres,zBody-rSpheres])
            sphere(r=rSpheres, $fn=20);
        translate([xBody-rSpheres,yBody-rSpheres,zBody-rSpheres])
            sphere(r=rSpheres, $fn=20);
        translate([rSpheres,rSpheres,0])
            cylinder(r=rSpheres, h=5, $fn=20);
        translate([xBody-rSpheres,rSpheres,0])
            cylinder(r=rSpheres, h=5, $fn=20);
        translate([rSpheres,yBody-rSpheres,0])
            cylinder(r=rSpheres, h=5, $fn=20);
        translate([xBody-rSpheres,yBody-rSpheres,0])
            cylinder(r=rSpheres, h=5, $fn=20);
    }
}

module leftSideHoles(){
    translate([0, yBody,zBody/2])
        rotate([90,0,0])
            cylinder(h=grosorBody*5, d=dLeftSideHoles, center=true, $fn=20);
    translate([dLeftSideHoles+diffLeftSideHoles, yBody,zBody/2])
        rotate([90,0,0])
            cylinder(h=grosorBody*5, d=dLeftSideHoles, center=true, $fn=20);
}

module rightSideHoles(){
    //agujero1
    translate([0, 0,0])
        rotate([90,0,0])
            cylinder(h=grosorBody*5, d=dRightSideHoles, center=true, $fn=20);
    //agujero2
    translate([diffRightSideHoles+dRightSideHoles/2, 0,0])
        rotate([90,0,0])
            cylinder(h=grosorBody*5, d=dRightSideHoles, center=true, $fn=20);
    //agujero3
    translate([0, 0, diffRightSideHoles+dRightSideHoles/2])
        rotate([90,0,0])
            cylinder(h=grosorBody*5, d=dRightSideHoles, center=true, $fn=20);
    //agujero4
    translate([diffRightSideHoles+dRightSideHoles/2, 0,diffRightSideHoles+dRightSideHoles/2])
        rotate([90,0,0])
            cylinder(h=grosorBody*5, d=dRightSideHoles, center=true, $fn=20);
}

body();