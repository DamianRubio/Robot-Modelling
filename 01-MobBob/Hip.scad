//Hip

//variables
xRectangle = 40;
yRectangle = 80;
zRectangle = 4.75;

xRectDiff = 23.5;
yRectDiff = 12.5;
zRectDiff = zRectangle+1;

xRectDiffPos = 8.25;
yRectDiffPos = 12.5;

bigHolesD = 3;
smallHolesD = 1.5;
smallHolesMargin = 1.25;
holesHeight = zRectangle +1;

//modules
module mainRectangle(){
    difference(){
        cube([xRectangle, yRectangle, zRectangle]);
        bigRoundedHoles();
        rectangularHoles();
        smallRoundedHoles();
    }
}

module bigRoundedHoles(){
    translate([xRectangle/2, yRectangle/2, zRectangle/2])
        cylinder(h=holesHeight, d=bigHolesD,center=true);
    
    translate([xRectangle/2, 8-bigHolesD/2, zRectangle/2])
        cylinder(h=holesHeight, d=bigHolesD,center=true);
    
    translate([xRectangle/2, yRectangle-8+bigHolesD/2, zRectangle/2])
        cylinder(h=holesHeight, d=bigHolesD,center=true);
}

module rectangularHoles(){
    translate([xRectDiffPos,yRectDiffPos,0])
        cube([xRectDiff, yRectDiff, zRectDiff]);
    
    translate([xRectDiffPos,yRectangle-yRectDiffPos-yRectDiff,0])
        cube([xRectDiff, yRectDiff, zRectDiff]);
}

module smallRoundedHoles(){
    translate([xRectDiffPos-smallHolesMargin-smallHolesD/2,yRectDiffPos + yRectDiff/2,zRectangle/2])
        cylinder(h=holesHeight, d=smallHolesD,center=true);
    
    translate([xRectDiffPos+xRectDiff+smallHolesMargin+smallHolesD/2,yRectDiffPos + yRectDiff/2,zRectangle/2])
        cylinder(h=holesHeight, d=smallHolesD,center=true);
    
    translate([xRectDiffPos-smallHolesMargin-smallHolesD/2,yRectangle-yRectDiffPos-yRectDiff/2,zRectangle/2])
        cylinder(h=holesHeight, d=smallHolesD,center=true);
    
    translate([xRectDiffPos+xRectDiff+smallHolesMargin+smallHolesD/2,yRectangle-yRectDiffPos-yRectDiff/2,zRectangle/2])
        cylinder(h=holesHeight, d=smallHolesD,center=true);
}

module hip(){
    mainRectangle();
}

hip();