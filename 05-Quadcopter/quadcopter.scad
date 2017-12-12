//Quadcopter
//Archivo que junta todas las piezas del quadcopter

use <cover.scad>
use <new_board_mount.scad>
use <separators.scad>

module quadcopter(){
    union(){
        translate([45,0,0])
            body1();
        translate([10,175,0])
            body2();
        translate([150,0,0])
            body3();
    }    
}

quadcopter();