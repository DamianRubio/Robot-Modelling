//new_board_mount

//variables
//Circles
dBigCircles = 95;
hBigCircles = 2.24;
fn = 40;

dHoles = 4; 
hHoles = 50;
inHolesRad = 14;
extHolesRad = 41;

dMedHoles = 3;
medHolesRad = 31.5;

//Other structures
xHoriz = 178.51;
yHoriz = 9.8;
zHoriz = 1.5;

xVert = 178.51;
yVert = 1.5;
zVert = 7;

dLowCone = 9.6;
dHighCone = 1.15;
hCone= sqrt(pow(32.63,2)-pow((9.6/2),2));

dBigHole = yHoriz-2*yVert;
hBigHole = 3*(zHoriz+zHoriz+zVert);

auxHolesRad = 11;
dAuxHoles = 3;

//modules
module body(){
    translate([dBigCircles/2-10,-dBigCircles/2-10,0])
        bigHoledCircle();
    translate([dBigCircles+dBigCircles/2,-dBigCircles/2-10,0])
        bigCircle();
    longStructures();
}

module bigCircle(){
    difference(){
        cylinder(h=hBigCircles, d=dBigCircles, $fn=fn);
        for(i = [1 : 360 / 4 : 360])
            make_cylinder(i, inHolesRad, dHoles);
        for(i = [1 : 360 / 4 : 360])
            make_cylinder(i, extHolesRad, dHoles);
    }    
}

module make_cylinder(i, diam, damn) {
    rotate([0, 0, i]) 
        translate([diam, 0, 0]) 
            cylinder(h=hHoles, d=damn, center=true, $fn=20);
}

module bigHoledCircle(){
    difference(){
        bigCircle();
        for(i = [1 : 360 / 8 : 360])
            make_cylinder(i, medHolesRad, dMedHoles);
    }
}

module longStructures(){
    union(){
        longStructure();
        translate([xHoriz,40,0])
            rotate([0,0,180])
                longStructure();
        translate([0,60,0])
            longStructure();
        translate([xHoriz,100,0])
            rotate([0,0,180])
                longStructure();
    }
}

module longStructure(){
    difference(){
        longStructureBase();
        translate([25.16/2,yHoriz/2,0])
            cylinder(h=hBigHole, d=dBigHole, center=true, $fn=20);
        for(i = [1 : 360 / 4 : 360])
            translate([25.16/2,yHoriz/2,0])
                make_cylinder(i, auxHolesRad, dAuxHoles);
    }
}
module longStructureBase(){
    union(){
        cube([xHoriz, yHoriz, zHoriz]);
        translate([0,0,zHoriz])
            cube([xVert, yVert, zVert]);
        translate([0,0,zHoriz+zVert])
            cube([xHoriz, yHoriz, zHoriz]);
        translate([0,yHoriz-yVert,zHoriz])
            cube([xVert, yVert, zVert]);
        linear_extrude(height = 2*zHoriz+zVert)
            polygon(points=[[0,0],[0,9.8],[-2.7,4.9]]);
        translate([31.7-2.7+dLowCone/2,yHoriz/2,2*zHoriz+zVert])
            cylinder(h=hCone, r1=dLowCone/2, r2=dHighCone/2, $fn=20);
        linear_extrude(height = 1.5)
            polygon(points=[[0,0],[25.16,0],[20.085,-10],[5.075,-10]]);
        translate([0,yHoriz,1.5])
            rotate([0,180,180])
                linear_extrude(height = 1.5)
                    polygon(points=[[0,0],[25.16,0],[20.085,-10],[5.075,-10]]);
    }
}

body();