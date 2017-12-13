//Zowi
//Archivo que junta todas las piezas para simular el montaje de la figura
use <body.scad>
use <chassis.scad>
use <footL.scad>
use <footR.scad>
use <leg.scad>

module zowi(){
  union(){
      translate([0,74,0])
        footL();
      translate([0,58,0])
        footR();
      translate([5,50,4])
        rotate([0,0,270])
            leg();
      translate([5,104,4])
        rotate([0,0,270])
            leg();
      translate([80,27,65])
        rotate([0,0,90])
            chassis();
      translate([5,104,70])
        rotate([0,0,270])
            body1();
  }  
}

zowi();