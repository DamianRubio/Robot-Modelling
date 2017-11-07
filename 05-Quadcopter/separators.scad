//spacers

//variables
dExterior = 7.1;
hExterior = 13.83;
dInterior = 6.2;
hInterior = hExterior*2;

xDiff = 6.42 + dExterior;
yDiff = 2 + dExterior;

//modules
module body(){
    separator();
    translate([0,yDiff,0])
        separator();
    translate([xDiff,0,0])
        separator();
    translate([xDiff,yDiff,0])
        separator();
}

module separator(){
    translate([0,0,hExterior/2])
        difference(){
            cylinder(h=hExterior, d=dExterior, center=true, $fn=20);
            cylinder(h=hInterior, d=dInterior, center=true, $fn=20);
        }    
}

body();
