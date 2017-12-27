
module button(
    x = 0, y = 0,
    index = 0,
    label = "",
    bsize = 0.5,
    bhalign = "center",
    bvalign = "center",
    bdirection = "ltr",
    wide = false,       // netflix
    tall = false        // guide
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
        [[-.5,-.5], [-.5,.5], [.5, .5], [.5,-.5] ],      // 19 alt exit
        [
            [0,-3], [-.5,-2.5], [-.5,2.5], [0,3],        // 20 alt netflix
            [.5,2.5], [.5,-2.5]
        ],
    ];

    // shadow center position (inner lip)
    ctr = [
        [0,0,0], [0,0,0], [0,-.15,0], [0,-.15,0], [0,0,0],
        [0,.15,0], [0,0,0], [0,.15,0], [0,-.15,0], [0,0,0],
        [0,0,0], [0,0,0], [.15,0,0], [0,0,0], [-.15,0,0],
        [0,0,0], [0,.15,0], [0,0,0], [0,0,0], [0,0,0],
        [0,0,0]
    ];

    // shadow center scale (inner lip)
    ctrs = [
        [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.4,1.1,1],
        [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1],
        [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1],
        [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.1,1.4,1], [1.2,1.2,1],
        [1.2,1.2,1]
    ];

    // text center position, for engraving
    txtctr = [
        [0,0,0], [0,0,0], [0,1,0], [0,1,0], [0,-.25,0],
        [0,-1,0], [0,0,0], [0,-1,0], [0,.75,0], [0,0,0],
        [0,0,0], [0,0,0], [-.75,0,0], [0,0,0], [.75,0,0],
        [0,0,0], [0,-.75,0], [0,0,0], [0,0,0], [0,0,0],
        [0,0,0]
    ];

    $fn = 15;

    // font adjustment
    bsize = bsize * 1.33;

    // scale: power button face is 10mm,
    // that makes input 5mm x 5mm
    dinoscale = 10 / 2.12;

    sx = ctrs[index][0];
    sy = ctrs[index][1];

    cx = ctr[index][0];
    cy = ctr[index][1];

    translate([x, y, 0]) {
        //color("silver")
            difference() {
                color("silver")
                linear_extrude(height=5) {
                    scale([dinoscale,dinoscale,10])
                        polygon(points = ply[index]);
                }
                scale([dinoscale,dinoscale,10]) {
                    translate([txtctr[index][0],txtctr[index][1],0.46]) {
                        scale([1,1,0.10])
                        color("black")
                        linear_extrude(height=5)
                        text(
                            text = label,
                            size = bsize,
                            font = "Arial Rounded MT Bold",
                            halign=bhalign,
                            valign=bvalign,
                            direction=bdirection
                        );
                    }
                }
            };

        color("gray")
            translate([cx,cy,-3])
                scale([sx,sy,1])
                    linear_extrude(height=3)
                        scale([dinoscale,dinoscale,10])
                            polygon(points = ply[index]);

        //    if( tall == false && wide == false ) {
        //        button_housing( txtctr[index][0], txtctr[index][1], -0.15-.5 );
        //    } else {
        //        if( tall == true ) {
        //            button_housing( txtctr[index][0], txtctr[index][1] - 1.0, -0.15-.5 );
        //            button_housing( txtctr[index][0], txtctr[index][1] + 1.5, -0.15-.5 );
        //        } else {
        //            button_housing( txtctr[index][0]-1.5, txtctr[index][1], -0.15-.5 );
        //            button_housing( txtctr[index][0]+1.5, txtctr[index][1], -0.15-.5 );
        //        }
        //    }


        //if( wide == false && tall == false ) {
        /*} else {
                if( tall == true ) {

                } else {
                    color("orange") {
                        translate([txtctr[index][0]-1.5,txtctr[index][1],-0.15-.5]) {
                            difference() {
                                cylinder(r=0.5,h=1, center=true);
                                cylinder(r=0.3,h=2, center=true);
                            }
                        }

                        translate([txtctr[index][0]+1.5,txtctr[index][1],-0.15-.5]) {
                            difference() {
                                cylinder(r=0.5,h=1, center=true);
                                cylinder(r=0.3,h=2, center=true);
                            }
                        }
                }
                }
            }
        }*/
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
