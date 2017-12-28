// version 03: tighter button fit, free up bottom
// convert all measurements to mm without scaling
// note: body too small for 4 x AAA batteries
include <buttons02.scad>;
include <body02.scad>;

debug = false;

// union() {
body(); // 50mm x 150mm.  or 25 x 75 halves
//     translate([10,0,0])
//         body(wall=true);
// }
button(-10,55,15, "S", bsize=0.4);
button(0,60,1, "pwr");

// guide presets
button(4,30,4, "gde", bhalign="left", bvalign="center", bdirection="ttb", tall = true);
button(-4,30,20, "ntflx", bhalign="left", bvalign="center", bdirection="ttb", tall = true);
button(4,45,19, "i");
//button(0,-60,18, "netflix", wide = true);

// channel control
rr = 15;
button(rr, 45,2, "C+");
button(rr ,40,5, "C-");

// volume keys
rl = -15;
button(rl,35,3, "V+");
button(rl,30-3,6, "M");
button(rl,25-6,7, "V-");

// arrow keys`
cx = 0; cy = 35;
button(0+cx,-40+cy,13, "ok", bsize=0.7);
button(0+cx,-30+cy-2,8, "");                // up
button(0+cx,-50+cy+2,16, "");               // down`
button(-10+cx+2,-40+cy,12, "");             // left
button(10+cx-2,-40+cy,14, "");              // right
button(-12+cx,-52+cy,15, "x");            // exit
button( 12+cx,-52+cy,17, "b");            // back

// selectors?
ox = 3; oy = 5;
button(10+ox,15+oy,15, "T", bsize=0.4);
button(15+ox,10+oy,15, "C", bsize=0.4);
button(10+ox,5+oy,15, "P", bsize=0.4);
