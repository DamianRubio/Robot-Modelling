//footR
use <footL.scad>

module footR(){
    mirror([0,1,0]){
        footL();
    }
}

footR();
