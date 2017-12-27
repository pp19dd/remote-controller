module body(wall = false) {

    // in mm :)
    width = 50;
    height = 150;
    depth = 20;
    chamfer = 10;
    wall_thickness = 3;

    place_body_below = -50;

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

    union() {
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

    }
}
