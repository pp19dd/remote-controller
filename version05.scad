// turns out I really liked version 1
// but need to redo batteries and internal layout

include <buttons05.scad>;
include <body05.scad>;

debug = false;

module buttons(b_cutouts = false) {
    button(-2,7.7,15, "src", bsize=0.4, cutouts=b_cutouts);
    button(0,9,1, "pwr", cutouts=b_cutouts);

    // guide presets
    button(0,3,4, "guide", bhalign="left", bvalign="center", bdirection="ttb", tall = true, cutouts=b_cutouts);
    button(0,-9.5,18, "netflix", wide = true, cutouts=b_cutouts);

    button(0,6,19, "i", cutouts=b_cutouts);

    // channel control
    rr = 2.5;
    button(rr, 5,2, "ch+", cutouts=b_cutouts);
    button(rr,4.5,5, "ch-", cutouts=b_cutouts);

    // volume keys
    rl = -2.5;
    button(rl,2.5,3, "v+", cutouts=b_cutouts);
    button(rl,1.25,6, "m", cutouts=b_cutouts);
    button(rl,0,7, "v-", cutouts=b_cutouts);

    // arrow keys
    button(0,-3,8, "", cutouts=b_cutouts);
    button(0,-4.5,13, "ok", bsize=0.7, cutouts=b_cutouts);
    button(-1.5,-4.5,12, "", cutouts=b_cutouts);
    button(1.5,-4.5,14, "", cutouts=b_cutouts);
    button(0,-6,16, "", cutouts=b_cutouts);

    // nav: back, exit
    button(-2.5,-7,15, "x", cutouts=b_cutouts);
    button( 2.5,-7,17, "b", cutouts=b_cutouts);

    // selectors?
    t = [.5, 0];
    button(t[0]+2,t[1]+.5,15, "tv", bsize=0.4, cutouts=b_cutouts);
    button(t[0]+1,t[1]+-.5,15, "pir", bsize=0.4, cutouts=b_cutouts);
    //button(t[0]+3,t[1]+-.5,15, "pir", bsize=0.4);
    button(t[0]+2,t[1]+-1.5,15, "cab", bsize=0.4, cutouts=b_cutouts);
}

scale([7,7,10]) {

    // difference() {
    //     body();
    //     buttons(b_cutouts = true);
    // }

    buttons(b_cutouts = false);

}
