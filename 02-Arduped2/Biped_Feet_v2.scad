//variables
thickness = 3;
height = 13;
width = 5;
offset_from_back = 16;

right_foot_x_offset = 76.5;
foot_base_offset = 12.5;

//myVariables
bigBallR = 24;
mediumBallR = 14;

xSquare = 30;
ySquare = 50;
zSquare = bigBallR - 12.5;

xSmallSquare = 4.75;
ySmallSquare = 3;
zSmallSquare = bigBallR;

toe1W = 8;
toe1L = 13;
toe1D = 13;
toe23W = 10;
toe2L = 8;
toe2D = 16;
toe3L = 9.2;
toe3D = 18;

//modules
module feetBase(){
    union(){
        sphere(r=bigBallR);
        translate([0,2.2*mediumBallR,0])
            sphere(r=mediumBallR);
    }
}

module feet(){
    difference(){
        feetBase();
        translate([-bigBallR/2,-ySquare+bigBallR/2,12.5])
            cube([xSquare, ySquare, zSquare]);   
    translate([mediumBallR,-ySquare/2,0])
        cube([bigBallR-mediumBallR, ySquare, 2*bigBallR]); 
        translate([-bigBallR/2-xSmallSquare,bigBallR/2-16-ySmallSquare,12.5])
            cube([xSmallSquare, ySmallSquare, zSmallSquare]); 
        
    }
}

module footWithToes(){
    union(){
        rotate([0,0,90])
        feet();
        translate([bigBallR-5,-bigBallR,0])
            toe1();
        translate([bigBallR+toe2L-3,-7.5,0])
            toe2();
        translate([bigBallR+toe3L-4.75,bigBallR-toe3D/2-2.75,0])
            toe3();
    }
}

module bipedFoot(){
    //Corta todo a la mitad por el eje
    difference(){
        footWithToes();
        translate([-50,-50,-100])
            cube([100,100,100]);
    }
}

module toe1(){
    rotate([0,0,-25])
        union(){
            rotate([0,270,0])
            cylinder(h=toe1L, d=toe1W, $fn=20);
            translate([toe1D/3,0,0])
            sphere(d=toe1D);
        }
}

module toe2(){
    rotate([0,0,-8])
        union(){
            rotate([0,270,0])
            cylinder(h=toe2L, d=toe23W, $fn=20);
            translate([toe2D/2.6,0,0])
            sphere(d=toe2D);
        }
}

module toe3(){
    rotate([0,0,19])
        union(){
            rotate([0,270,0])
            cylinder(h=toe3L, d=toe23W, $fn=20);
            translate([toe3D/2.4,0,0])
            sphere(d=toe3D);
        }
}

module bipedFeet(){
    bipedFoot();
    translate([0,50,0])
        mirror([0,10,0])
            bipedFoot();
    
}
//invocation
bipedFeet();
