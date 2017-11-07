//20W

//variables
dExterior = 40;
hExterior = 10;

dMedio = 35;
hMedio = 2.5;

dCentro = 10;
hCentro = 2.5;

//holes
dHoles = 5;
hHoles = hExterior*2;
number_of_holes = 8;

//liston
xListon = 5;
yListon = 1;
zListon = hExterior;

//modules
module body(){
    union(){
        difference(){
            wheelBase();
            holes();
            center();
        }
        translate([-xListon/2,dHoles/3,0])
            cube([xListon,yListon,zListon]);
    }
}

module wheelBase(){
    union(){
        difference(){
            cylinder(h=hExterior,d=dExterior,$fn=20);
            cylinder(h=hMedio,d=dMedio,$fn=20);
            translate([0,0,hExterior-hMedio])
                cylinder(h=hMedio,d=dMedio,$fn=20);
        }
        cylinder(h=hCentro,d=dCentro,$fn=20);
        translate([0,0,hExterior-hCentro])
            cylinder(h=hCentro,d=dCentro,$fn=20);
    }
}

module holes(){
    for(i = [1 : 360 / number_of_holes : 360]) {
        make_cylinder(i);
}

module make_cylinder(i) {
    rotate([0, 0, i]) 
        translate([10, 0, 0]) 
            cylinder(h=hHoles, d=dHoles, center=true, $fn=20);
    }
}

module center(){
    cylinder(h=hHoles, d=dHoles, center=true, $fn=20);
}

body();
