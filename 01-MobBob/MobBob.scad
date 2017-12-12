//MobBob 
//Archivo que junta todas las piezas
use <BattRack.scad>
use <FootLeft.scad>
use <FootRight.scad>
use <Hip.scad>
use <LegPart-v3.scad>
use <PhoneHolder.scad>
use <ServoBrace.scad>

module MobBob(){  
    translate([0,0,0])
        footRight();
    translate([0,75,0])
        footLeft();
    translate([15,45,34])
        rotate([90,90,0])
            legPartV3();
    translate([15,95,34])
        rotate([90,90,0])
            legPartV3();
    translate([15,25,34])
        hip();
    translate([15,25,40])
        rotate([90,90,90])
            servoBrace();
    translate([15,34,58])
        battRack();
    translate([35,25,34])
        phoneHolder();    
}

MobBob();