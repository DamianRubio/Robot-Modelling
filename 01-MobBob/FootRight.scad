//FootRight

//variables
xRectangle = 65;
yRectangle = 55;
zRectangle = 7.5;

xBigRectangle = 10;
yBigRectangle = 5;
zBigRectangle = 11;

xSmallRectangle = 5;
ySmallRectangle = 5;
zSmallRectangleLong = 11.35;
zSmallRectangleShort = 11;

angleRadius = 3;

nFaces=20;

//modules
module bigRectangle(){
    cube([xBigRectangle, yBigRectangle, zBigRectangle]);
}

module smallRectangle(){
    cube([xSmallRectangle, ySmallRectangle, zSmallRectangleLong]);
}

module base(){
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
        translate([angleRadius, angleRadius, -zRectangle/2])
            cylinder(h=zRectangle/2,d=angleRadius*2, $fn=20);
        translate([xRectangle-angleRadius, angleRadius, -zRectangle/2])
            cylinder(h=zRectangle/2,d=angleRadius*2, $fn=20);
        translate([angleRadius, yRectangle-angleRadius, -zRectangle/2])
            cylinder(h=zRectangle/2,d=angleRadius*2, $fn=20);
        translate([xRectangle-angleRadius, yRectangle-angleRadius, -zRectangle/2])
            cylinder(h=zRectangle/2,d=angleRadius*2, $fn=20);
    }
}

module footRight(){
    union(){
        base();
        
        translate([xRectangle/2-xSmallRectangle*1.5,yRectangle/2-yBigRectangle/2,zRectangle/2])
        bigRectangle();
        
        translate([xRectangle/2-xSmallRectangle/2,yRectangle-ySmallRectangle-angleRadius/1.5,zRectangle/2-(zSmallRectangleLong-zSmallRectangleShort)])
        smallRectangle();
    }
}

footRight();
