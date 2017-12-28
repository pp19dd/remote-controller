// convert all measurements to mm without scaling
include <buttons02.scad>;
include <body02.scad>;

debug = false;

// union() {
body(); // 50mm x 150mm.  or 25 x 75 halves
//     translate([10,0,0])
//         body(wall=true);
// }
button(-15,50,15, "src", bsize=0.4);
button(0,60,1, "pwr");

// guide presets
button(0,30,4, "guide", bhalign="left", bvalign="center", bdirection="ttb", tall = true);
button(0,-60,18, "netflix", wide = true);

button(0,45,19, "i");

// channel control
rr = 15;
button(rr, 40,2, "ch+");
button(rr ,35,5, "ch-");


// volume keys
rl = -15;
button(rl,25,3, "v+");
button(rl,20-3,6, "m");
button(rl,15-6,7, "v-");

// arrow keys`
cx = 0; cy = 20;
button(0+cx,-40+cy,13, "ok", bsize=0.7);
button(0+cx,-30+cy,8, "");                // up
button(0+cx,-50+cy,16, "");               // down`
button(-10+cx,-40+cy,12, "");             // left
button(10+cx,-40+cy,14, "");              // right

// nav: back, exit
button(-12,-32,15, "x");
button( 12,-32,17, "b");

// selectors?
ox = 3; oy = -2;
button(10+ox,15+oy,15, "tv", bsize=0.4);
button(15+ox,10+oy,15, "cab", bsize=0.4);
button(10+ox,5+oy,15, "pir", bsize=0.4);
