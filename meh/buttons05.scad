
module button(
    x = 0, y = 0,
    index = 0,
    label = "",
    bsize = 0.5,
    bhalign = "center",
    bvalign = "center",
    bdirection = "ltr",
    wide = false,       // netflix
    tall = false,        // guide
    cutouts = false
) {
    ply = [
        [[-1,0], [-1,-2], [1,0], [1,2]],                 //  0 input
        [[-1.5,0], [0,-1.5], [1.5,0], [0,1.5]],          //  1 pwr
        [[-.75,0], [-.75,2.5], [.75,1.5], [.75,0] ],     //  2 ch up
        [[-.75,0], [-.75,1.5], [.75,2.5], [.75,0] ],     //  3 vol up
        [
            [-.5,0], [-.5,-2], [0,-2.5], [.5,-2],        //  4 guide
            [.5,2], [0,2.0], [-.5,2]
        ],
        [[-.75,0], [-.75,-1.5], [.75,-2.5], [.75,0] ],   //  5 ch dn
        [
            [-.75,0],[-.75,-.75],                        //  6 mute
            [.75,-.75],[.75,.75],
            [-.75,.75]
        ],
        [[-.75,0], [-.75,-2.5], [.75, -1.5], [.75,0]],   //  7 vol down
        [[-1, 0], [-1,1], [0,2], [1,1], [1,0]],          //  8 arrow up
        [], // sel 1 (cyl?)
        [], // sel 2 (cyl?)
        [], // sel 3 (cyl?)
        [[0,0], [0,1], [-1,1], [-2,0], [-1,-1], [0,-1]], // 12 arrow left
        [[-1,1],[-1,-1],[1,-1],[1,1]  ],                 // 13 ok
        [[0,0], [0,1], [1,1], [2,0], [1,-1], [0,-1]],    // 14 arrow right
        [[-.75,0],[0,-.75], [.75,0], [0,.75]  ],         // 15 exit
        [[-1,0],[-1,-1],[0,-2],[1,-1],[1,0] ],           // 16 arrow down
        [[-.75,0],[0,-.75], [.75,0], [0,.75]  ],         // 17 back
        [
            [-2.5,0], [-2,-.5], [2,-.5], [2.5,0],        // 18 netflix
            [2,.5], [-2,.5]
        ],
        [[-.5,-.5], [-.5,.5], [.5, .5], [.5,-.5] ],// alt exit
    ];

    // shadow center position (inner lip)
    ctr = [
        [0,0,0], [0,0,0], [0,-.15,0], [0,-.15,0], [0,0,0],
        [0,.15,0], [0,0,0], [0,.15,0], [0,-.15,0], [0,0,0],
        [0,0,0], [0,0,0], [.15,0,0], [0,0,0], [-.15,0,0],
        [0,0,0], [0,.15,0], [0,0,0], [0,0,0], [0,0,0]
    ];

    // shadow center scale (inner lip)
    ctrs = [
        [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.3,1.1,1],
        [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1],
        [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1],
        [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.1,1.4,1], [1.2,1.2,1]
    ];

    // text center position, for engraving
    txtctr = [
        [0,0,0], [0,0,0], [0,1,0], [0,1,0], [0,-.25,0],
        [0,-1,0], [0,0,0], [0,-1,0], [0,.75,0], [0,0,0],
        [0,0,0], [0,0,0], [-.75,0,0], [0,0,0], [.75,0,0],
        [0,0,0], [0,-.75,0], [0,0,0], [0,0,0], [0,0,0]
    ];

    $fn = 15;

    sx = ctrs[index][0];
    sy = ctrs[index][1];

    cx = ctr[index][0];
    cy = ctr[index][1];

    translate([x, y, 0]) {

        if( cutouts == false ) {

            difference() {
                union() {
                    // top button
                    color("silver")
                        linear_extrude(height=0.5)
                            polygon(points = ply[index]);


                    // bottom part of the button
                    color("gray")
                        translate([cx,cy,-.25])
                            scale([sx,sy,1])
                                linear_extrude(height=0.25)
                                    polygon(points = ply[index]);
                }

                // supports
                if( tall == false && wide == false ) {
                    translate([txtctr[index][0], txtctr[index][1], -0.7])
                        color("silver")
                            cylinder(r=0.4);

                } else {
                    if( tall == true ) {

                        translate([txtctr[index][0], txtctr[index][1]-1, -0.7])
                            color("silver")
                                cylinder(r=0.4);

                        translate([txtctr[index][0], txtctr[index][1]+1.5, -0.7])
                            color("silver")
                                cylinder(r=0.4);

                    } else {

                        translate([txtctr[index][0] - 1.25, txtctr[index][1], -0.7])
                            color("silver")
                                cylinder(r=0.4);

                        translate([txtctr[index][0] + 1.25, txtctr[index][1], -0.7])
                            color("silver")
                                cylinder(r=0.4);

                    }
                }
            }
            /*
            // supports
            if( tall == false && wide == false ) {
                button_housing( txtctr[index][0], txtctr[index][1], -0.15-.5 );
            } else {
                if( tall == true ) {
                    button_housing( txtctr[index][0], txtctr[index][1] - 1.0, -0.15-.5 );
                    button_housing( txtctr[index][0], txtctr[index][1] + 1.5, -0.15-.5 );
                } else {
                    button_housing( txtctr[index][0]-1.5, txtctr[index][1], -0.15-.5 );
                    button_housing( txtctr[index][0]+1.5, txtctr[index][1], -0.15-.5 );
                }
            }
            */

        } else {

            // bottom part of the button
            color("gray")
                translate([cx,cy,-.5])
                    scale([sx,sy,5])
                        linear_extrude(height=0.25)
                            polygon(points = ply[index]);

        }

    }

    // debug: marks center of button
    if( debug == true ) {
        color("black")
            translate([x, y, 0])
                cylinder(h=0.26, r=0.05);
    }
}

module button_housing(x = 0, y = 0, z = 0) {
    color("red")
        translate([x,y,z]) {
            difference() {
                cylinder(r=0.5,h=1, center=true);
                cylinder(r=0.3,h=2, center=true);
            }
        }

}
