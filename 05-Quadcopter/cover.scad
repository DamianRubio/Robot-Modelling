//cover

//variables
dBigCircle = 95;
hBigCircle = 1.75;

dSmallCircle = 65;
hSmallCircle = 3 * hBigCircle;

dHoles = 3.9;
radHoles = 41.05;
hHoles = 3 * hBigCircle;

scaleFactor = ((dSmallCircle+6)*100/65)/100;

//modules
module body(){
    union(){
        bigCircle();
        translate([0,0,hBigCircle])
            rest();
    }   
}

module bigCircle(){
    difference(){
        cylinder(h=hBigCircle, d=dBigCircle, $fn=20);
        cylinder(h=hSmallCircle, d=dSmallCircle, $fn=20);
        for(i = [1 : 360 / 4 : 360])
            make_cylinder(i, radHoles, dHoles, hHoles);
    }
}

module make_cylinder(i, diam, damn, hholes) {
    rotate([0, 0, i]) 
        translate([diam, 0, 0]) 
            cylinder(h=hholes, d=damn, center=true, $fn=20);
}

module rest(){
    difference(){
        scale(scaleFactor)
            restBase();
        restBase();
        
    }
}

module restBase(){
    difference(){
        diam=72.82;
        translate([0,0,-diam/2+20])
            sphere(d=diam, $fn=50);
        translate([-diam/2,-diam/2,-diam])
            cube(diam,diam,diam);
    }
}

body();