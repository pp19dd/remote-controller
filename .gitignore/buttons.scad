module button(
    x = 0, y = 0,
    index = 0,
    label = "",
    bsize = 0.5,
    bhalign = "center",
    bvalign = "center",
    bdirection = "ltr"
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
        [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.4,1.1,1],
        [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1],
        [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1],
        [1.2,1.2,1], [1.2,1.2,1], [1.2,1.2,1], [1.1,1.4,1], [1.2,1.2,1]
    ];
    
    // text center position, for engraving
    txtctr = [
        [0,0,0], [0,0,0], [0,1,0], [0,1,0], [0,0,0], 
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
        color("silver")
            difference() {
                linear_extrude(height=0.25) {
                    polygon(points = ply[index]);
                }
                translate([txtctr[index][0],txtctr[index][1],0.15]) {
                    scale([1,1,0.3])
                    text(
                        text = label,
                        size = bsize,
                        font = "Verdana",
                        halign=bhalign,
                        valign=bvalign,
                        direction=bdirection
                    );
                }
            };
        color("gray")
            translate([cx,cy,-.25])
                scale([sx,sy,1])
                    linear_extrude(height=0.25)
                        polygon(points = ply[index]);
        color("red")
            translate([txtctr[index][0],txtctr[index][1],-0.15-.5]) {
                difference() {
                    cylinder(r=0.5,h=1, center=true);
                    cylinder(r=0.3,h=2, center=true);
                }
            }
    }
    
    // debug: marks center of button
    if( debug == true ) {
        color("black")
            translate([x, y, 0])
                cylinder(h=0.26, r=0.05);
    }
}
