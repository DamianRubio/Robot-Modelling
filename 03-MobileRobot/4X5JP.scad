//4X5JP

//variables
xBase = 80;
yBase = 100;
zBase = 3;

dHoles = 5;
xDiff = 7.5 + dHoles/2;
yDiff = 7.5 + dHoles/2;

xDiffBet = 15 + dHoles;
yDiffBet = 15+ dHoles;

//modules
module body2(){
    difference(){
        base();
        translate([-xDiffBet+xDiff,-yDiffBet+yDiff,0])
            holes();
    }
}

module base(){
    cube([xBase,yBase,zBase]);
}


module holes(){
    for(j= [1:4]){
        for (i = [1 : 5]) {
            #translate([xDiffBet*j,yDiffBet*i,0])
                cylinder(h= zBase*3, d = dHoles, center = true, $fn=20);
        }
    }
}

body2();
