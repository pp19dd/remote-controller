// todo: measure microswitch buttons with caliper
//       apparently they are all over the place in that assortment box i got
// measured scale of entire enclosure: 56.5 x 141.2 mm
//       with hole depth 3.0 mm
//       and  hole diameter 3.5 mm, hexagonal (need to increase $fn)
//       distance between device selectors: 3.5 mm
//       button height above surface: 1.9 mm
use <arduino.scad>;
$fn = 10;

module faceplate(width=50, height=160, c=15, wall=3) {
    w = width / 2;
    h = height / 2;
    points = [
         [-w+c, h], [-w,h-c], [-w,-h+c], [-w+c,-h],
         [w-c, -h], [w, -h+c], [w, h-c], [w-c, h]
    ];

    difference() {
        draw_lip(points, 3.25, 3, sphere=true);
        translate([0,0,-3.25/2]) cube([width+10, height+10, 3.25], center=true);
    }
}

module button(id, x = 0, y = 0, height=5, lip = 0.01, holes=[]) {

    eg = 5.65/2;        // exit-back
    vx = 4; vy = 12;    // volume-ish. vx was 5
    ug = 5;             // arrows
    gx = 10; gy = 1.75;  // guide-ish

    geometry = [
        [[-10,0], [0,-10], [10,0], [0,10]],                 //  0 - pwr
        [[-5.65,0], [0,-5.65], [5.65,0], [0,5.65]],         //  1 - input
        [[vx,vy], [-vx,vx], [-vx,-vx], [vx,-vx]],           //  2 - vol up
        [[-vx,vx],  [-vx,-vx], [vx,-vx], [vx,vx]],          //  3 - mute
        [[-vx,-vy], [vx,-vx], [vx,vx], [-vx,vx]],           //  4 - vol dn
        [[-vx,vy],  [vx,vx],  [vx,-vx], [-vx,-vx]],         //  5 - ch up
        [[-vx,-vx], [vx,-vy], [vx,vx], [-vx,vx]],           //  6 - ch dn

        [[-vx,vx],  [-vx,-vx],[vx,-vx], [vx,vx]],           //  5 - ok
        [[ 0,ug], [-ug, 0], [-ug,-ug], [ug,-ug], [ug,0]],   //  8 - up arrow
        [[-ug,ug], [-ug, 0],  [0,-ug], [ug, 0], [ug,ug]],   //  9 - down arrow
        [[-ug,0], [ 0,-ug],  [ug,-ug], [ug, ug], [0,ug]],   // 10 - left arrow
        [[-ug,ug], [-ug,-ug],  [0,-ug], [ug, 0], [0,ug]],   // 11 - right arrow

        [[-eg,0], [0,-eg], [eg,0], [0,eg]],                 // 12 - exit
        [[-eg,0], [0,-eg], [eg,0], [0,eg]],                 // 13 - back
        [
            [-gx, gy], [-gx-gy,0], [-gx,-gy],               // 14 - netflix
            [ gx,-gy], [ gx+gy,0], [ gx, gy]
        ],
        [
            [-gy,gx], [gy,gx], [gy,-gx],                    // 15 - guide
            [0, -gx-gy], [-gy,-gx], [-gy,gx]
        ],
        [[-gy,gy],[gy,gy],[gy,-gy],[-gy,-gy]],              // 16 - info

    ];

    translate([x,y,0]) {
        difference() {
            draw_lip(geometry[id], lip, height);
            button_mounts();
        }
    }
}

module button_mounts() {

    // 6x6x6 microswitch cyl button has
    // radius: 3.5 mm, 3.4
    // depth: 2mm, 1.9 mm of insertion travel
    // square body: 6 x 6 mm, square 4mm deep, 3 mm without dots,

    // at this setting, hole is 3.000 mm deep
    // and hole diameter is 3.5 mm
    translate([0,0,-0.5])
        color("black")
            cylinder(d=3.5,h=3.5);
}

module draw_lip(points, lip, height, sphere = false) {
    hull() {
        for( i = [0:len(points)-1] ) {
            translate([points[i][0], points[i][1], 0])
            if( sphere == false ) {
                cylinder(r=lip, h=height);
            } else {
                sphere(r=lip);
            }
        }
    }
}

module buttons(lip = 0, height = 5) {
    button( 0,   0,  65, lip=lip, height=height);       //  0 - pwr
    button( 1, -15,  54.25, lip=lip, height=height);    //  1 - input

    button( 2, -16,  30, lip=lip, height=height);       //  2 - vol up
    button( 3, -16,  17, lip=lip, height=height);       //  3 - mute
    button( 4, -16,   4, lip=lip, height=height);       //  4 - vol dn

    button( 5,  16,  40+3, lip=lip, height=height);       //  5 - ch up
    button( 6,  16,  27+3, lip=lip, height=height);       //  6 - ch dn

    translate([0,20,0]) {
        button( 7,   0, -40, lip=lip, height=height);       //  7 - ok
        button( 8,   0, -25, lip=lip, height=height);       //  8 - up
        button( 9,   0, -55, lip=lip, height=height);       //  9 - down
        button(10, -15, -40, lip=lip, height=height);       // 10 - left
        button(11,  15, -40, lip=lip, height=height);       // 11 - right
        button(12, -14, -54, lip=lip, height=height);       // 12 - exit
        button(13,  14, -54, lip=lip, height=height);       // 13 - back
    }
    button(14,   0, -50+1, lip=lip, height=height);       // 14 - netflix
    button(15,   0,  20+5, lip=lip, height=height);       // 15 - guide
    button(16,   0,  38+5, lip=lip, height=height);       // 16 - info

    //rotate([0,0,45])
    translate([-1,11,0]) {
        button(16, 12, -5, lip=lip-.5, height=height);
        button(16, 20, -5, lip=lip-.5, height=height);
        button(16, 20, -13, lip=lip-.5, height=height);
    //button(12, 8, -15+3.5, lip=lip, height=height);
    //button(12, 15, -20+1.5, lip=lip, height=height);
    }
}

// with these settings, gap between button walls is 0.5 mm on one side
// assuming that's 1.00 mm on both sides
difference() {
    translate([0,12,0]) color("gray") faceplate(width=50,height=135);
    color("black") translate([0,0,-1]) buttons(lip=1, height=6);
}

// translate([10,-10,15])
//     rotate([0,0,45])
//         arduino();
union() {
    translate([0,0,0]) buttons(lip=1);
    translate([0,0,-3]) buttons(lip=2.5, height=3);
}
