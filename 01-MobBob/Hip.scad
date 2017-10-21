//Hip

//variables
xRectangle = 40;
yRectangle = 80;
zRectangle = 4.75;

angleRadius = 3;

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
        rectangle();
        bigRoundedHoles();
        rectangularHoles();
        smallRoundedHoles();
    }
}

module rectangle(){
    hull(){
        //atras
        translate([zRectangle/2,angleRadius,0])
            rotate([270,90,0])
                cylinder(h=yRectangle-2*angleRadius, d=zRectangle, $fn=20);
    
        //alante
        translate([xRectangle-zRectangle/2,angleRadius,0])
            rotate([270,90,0])
                cylinder(h=yRectangle-2*angleRadius, d=zRectangle, $fn=20);
    
        //izqda
        translate([angleRadius,zRectangle/2,0])
            rotate([0,90,0])
                cylinder(h=xRectangle-2*angleRadius, d=zRectangle, $fn=20);
        
        //dcha
        translate([angleRadius,yRectangle-zRectangle/2,0])
            rotate([0,90,0])
                cylinder(h=xRectangle-2*angleRadius, d=zRectangle, $fn=20);
        
        //esquinas
        translate([angleRadius, angleRadius, 0])
            cylinder(h=zRectangle/2,d=angleRadius*2, $fn=20);
        translate([xRectangle-angleRadius, angleRadius, 0])
            cylinder(h=zRectangle/2,d=angleRadius*2, $fn=20);
        translate([angleRadius, yRectangle-angleRadius, 0])
            cylinder(h=zRectangle/2,d=angleRadius*2, $fn=20);
        translate([xRectangle-angleRadius, yRectangle-angleRadius, 0])
            cylinder(h=zRectangle/2,d=angleRadius*2, $fn=20);
    }
}

module bigRoundedHoles(){
    translate([xRectangle/2, yRectangle/2, 0])
        cylinder(h=holesHeight, d=bigHolesD,center=true);
    
    translate([xRectangle/2, 8-bigHolesD/2, 0])
        cylinder(h=holesHeight, d=bigHolesD,center=true);
    
    translate([xRectangle/2, yRectangle-8+bigHolesD/2, 0])
        cylinder(h=holesHeight, d=bigHolesD,center=true);
}

module rectangularHoles(){
    translate([xRectDiffPos,yRectDiffPos,-zRectangle/2])
        cube([xRectDiff, yRectDiff, zRectDiff]);
    
    translate([xRectDiffPos,yRectangle-yRectDiffPos-yRectDiff,-zRectangle/2])
        cube([xRectDiff, yRectDiff, zRectDiff]);
}

module smallRoundedHoles(){
    translate([xRectDiffPos-smallHolesMargin-smallHolesD/2,yRectDiffPos + yRectDiff/2,0])
        cylinder(h=holesHeight, d=smallHolesD,center=true);
    
    translate([xRectDiffPos+xRectDiff+smallHolesMargin+smallHolesD/2,yRectDiffPos + yRectDiff/2,0])
        cylinder(h=holesHeight, d=smallHolesD,center=true);
    
    translate([xRectDiffPos-smallHolesMargin-smallHolesD/2,yRectangle-yRectDiffPos-yRectDiff/2,0])
        cylinder(h=holesHeight, d=smallHolesD,center=true);
    
    translate([xRectDiffPos+xRectDiff+smallHolesMargin+smallHolesD/2,yRectangle-yRectDiffPos-yRectDiff/2,0])
        cylinder(h=holesHeight, d=smallHolesD,center=true);
}

module hip(){
    mainRectangle();
}

hip();