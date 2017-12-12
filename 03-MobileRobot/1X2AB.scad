//1X2AB

//variables
//base
xBase = 40;
yBase = 20;
zBase = 3;

dBaseHoles = 5;
hBaseHoles = zBase*3;

xBaseHolePosition = 7.5 + dBaseHoles/2;
differenceBaseHoles = 15;

//lateral
xLateral = 40;
yLateral = 2.8;
zLateral = 17;
xLateralSuperior = 20;
xMargin = (xLateral-xLateralSuperior)/2;


//modules
module body1(){
    union(){
        base();
        translate([0,yLateral,zBase])
            lateral();
    }
}

module base(){
    difference(){
        cube([xBase,yBase,zBase]);
        baseHoles();
    }
}

module baseHoles(){
    translate([xBaseHolePosition,yBase/2,0])
        cylinder(h=hBaseHoles, d=dBaseHoles, center=true, $fn=20);
    translate([xBaseHolePosition+differenceBaseHoles+dBaseHoles,yBase/2,0])
        cylinder(h=hBaseHoles, d=dBaseHoles, center=true, $fn=20);
}

module lateral(){
    difference(){
        rotate([90,0,0])
        linear_extrude(height=yLateral){
            polygon(points=[[0,0],[xLateral,0],[xMargin+xLateralSuperior,zLateral],[xMargin,zLateral]]);
        }
        translate([xLateral/2,0,zLateral/2])
            rotate([90,0,0])
                cylinder(h=hBaseHoles,d=dBaseHoles,center=true,$fn=20);    
    }
}

body1();
