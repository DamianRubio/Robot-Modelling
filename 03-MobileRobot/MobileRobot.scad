//MobileRobot
//Archivo que junta todas las piezas
use <1X2AB.scad>
use <4X5JP.scad>
use <20W.scad>
use <DCGEARED.scad>

module mobileRobot(){
//    body1();
    union(){
        body2();
        rotate([0,90,0])
            body4();
        translate([40,0,0])
            rotate([0,90,0])
                body4();
        translate([0,60,0])
            rotate([0,90,0])
                body4();
        translate([40,60,0])
            rotate([0,90,0])
                body4();
        //ruedas
        translate([-10,20,-10])
            rotate([0,90,0])
                body3();
        translate([80,20,-10])
            rotate([0,90,0])
                body3();
         translate([-10,80,-10])
            rotate([0,90,0])
                body3();
        translate([80,80,-10])
            rotate([0,90,0])
                body3();
        
        //Soporte
        translate([20,0,3])
            body1();
    }
}

mobileRobot();