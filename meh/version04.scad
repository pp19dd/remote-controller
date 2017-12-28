include <buttons02.scad>;

// version04.scad: redo with bigger box constraint
body(depth=20);
battery(y=-32, z=-60);
// arduino(y=-15,z=-60);

module arduino(x = 0, y = 0, z = 0) {
    translate([x, y, z])
    color("gray")
    cube([7,50,20], center=true);
}

module battery(x = 0, y = 0, z = 0) {
    translate([x, y, z])
    color("silver")
    cube([50,27,18], center=true);
}


module body(width = 60, height = 120, depth = 15, chamfer = 10, wall_thickness = 3, place_body_below = -50 ) {
    half_width = width / 2;
    half_height = height / 2;
    twice_wall_thickness = wall_thickness * 2;

    shape = [
        [-half_width + chamfer, half_height], [-half_width, half_height-chamfer],
        [-half_width, -half_height + chamfer], [-half_width + chamfer, -half_height],
        [half_width - chamfer, -half_height], [half_width, -half_height + chamfer],
        [half_width, half_height - chamfer], [half_width - chamfer, half_height]
    ];

    // cover
    linear_extrude(height=3) polygon(shape);

    // scale for wall thickness of 3
    sx = (width - twice_wall_thickness) / width;
    sy = (height - twice_wall_thickness) / height;

    // body
    translate([0,0,place_body_below-depth])
    difference() {
        linear_extrude(height=depth) polygon(shape);
        scale([sx, sy, 1.5])
            linear_extrude(height=depth) polygon(shape);
    }

    // bottom
    translate([0,0,place_body_below-depth-wall_thickness])
        linear_extrude(height=3) polygon(shape);

    // battery compartment wall
    translate([0, -15, place_body_below-depth+10])
    color("blue")
    cube([width-twice_wall_thickness,wall_thickness,depth], center=true);

    // debug guide
    translate([0, -15, 1.6])
    color("black")
    cube([width-twice_wall_thickness,wall_thickness,3], center=true);

}

button(-20,50,15, "S", bsize=0.4);
button(0,45,1, "pwr");

button(20, 40, 2, "C+");
button(20, 35, 5, "C-");

button(-20,30,3, "V+");
button(-20,25-1,6, "M");
button(-20,20-2,7, "V-");

cx = 0; cy = 45;
button(0+cx,-40+cy,13, "ok", bsize=0.7);
button(0+cx,-30+cy-2,8, "");                // up
button(0+cx,-50+cy+2,16, "");               // down`
button(-10+cx+2,-40+cy,12, "");             // left
button(10+cx-2,-40+cy,14, "");              // right
button(-12+cx,-52+cy,15, "x");            // exit
button( 12+cx,-52+cy,17, "b");            // back

// button(4,30,4, "gde", bhalign="left", bvalign="center", bdirection="ttb", tall = true);
// button(-4,30,20, "ntflx", bhalign="left", bvalign="center", bdirection="ttb", tall = true);
button(10,35,19, "i");
