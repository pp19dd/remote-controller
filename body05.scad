module body(wall = false) {

    shape = [
        [-2,11], [2,11], [4,9],
        [4,-9], [2,-11], [-2,-11], [-4,-9],
        [-4,9]
    ];

    // [-4,11], [4,11], [4,-11], [-4,-11]

    linear_extrude(height=0.2) polygon(shape);

    if( wall == true ) {
        color("silver") {
        sx = 0.94;
        sy = 0.97;
        scale([1,1,10]) {
            difference() {
                linear_extrude(height=0.2) polygon(shape);
                translate([0,0,-0.25]) {
                    scale([sx, sy, 1]) {
                        linear_extrude(height=0.6) polygon(shape);
                    }
                }
            }
        }
        }
    }

}
