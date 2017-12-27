include <buttons.scad>;
include <body.scad>;

// debug = true;

scale([7,7,10]) {

union() {
    body();
    translate([10,0,0])
        body(wall=true);
}

button(-2,8,15, "src", bsize=0.4);
button(0,9,1, "pwr");

// guide presets
button(0,3,4, "guide", bhalign="left", bvalign="center", bdirection="ttb", tall = true);
button(0,-9.5,18, "netflix", wide = true);

button(0,6,19, "i");

// channel control
rr = 2.5;
button(rr, 5,2, "ch+");
button(rr,4.5,5, "ch-");

// volume keys
rl = -2.5;
button(rl,2.5,3, "v+");
button(rl,1.25,6, "m");
button(rl,0,7, "v-");

// arrow keys
button(0,-3,8, "");
button(0,-4.5,13, "ok", bsize=0.7);
button(-1.5,-4.5,12, "");
button(1.5,-4.5,14, "");
button(0,-6,16, "");

// nav: back, exit
button(-2.5,-7,15, "x");
button( 2.5,-7,17, "b");

// selectors?
t = [.5, 0];
button(t[0]+2,t[1]+.5,15, "tv", bsize=0.4);
button(t[0]+1,t[1]+-.5,15, "pir", bsize=0.4);
//button(t[0]+3,t[1]+-.5,15, "pir", bsize=0.4);
button(t[0]+2,t[1]+-1.5,15, "cab", bsize=0.4);

}
