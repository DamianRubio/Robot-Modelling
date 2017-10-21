//BattRack

//variables
xLeg = 11;
yLeg = 13.5;
zLeg = 4;

xSide = 38;
ySide = 3;
zSide = 20;

xBack = 3;
yBack = 30;
zBack = 20;


//module
module Leg(){
    cube([xLeg, yLeg,     zLeg]);    
}

module Side(){
    cube([xSide, ySide,     zSide]);
}


module Back(){
     cube([xBack, yBack,     zBack]);
}

module BattRack(){
    union(){
        Leg();
        translate([-xSide+xLeg,yLeg,0])
            Side();  
        translate([-xSide+xLeg-xBack,yLeg,0])
            Back();
        translate([-xSide+xLeg,yLeg+yBack-ySide,0])
            Side();
        translate([0,yLeg+yBack,0])
            Leg();
    }  
}

BattRack();