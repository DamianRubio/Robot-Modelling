//Arduped2
//Archivo que junta todas las piezas
use <Biped_Brackets.scad>
use <Biped_Eyes_v2.scad>
use <Biped_Feet_v2.scad>
use <Biped_Platform_v2.scad>

module arduped(){
    union(){
        translate([40,20,0])
            bipedFeet();
        translate([80,13,40])
            rotate([0,180,0])
                bipedPlatform();
        translate([80,65,60])
            rotate([0,0,180])
                bipedEyes();
        translate([0,-50,0])
            bipedBrackets();
    }
}

arduped();