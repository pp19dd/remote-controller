// arduino nano without header pins
// use <arduino.scad>

module arduino() {

    difference() {
        color([0,151/255,156/255,1]) arduino_circuit_board();
        color("black") arduino_holes();
    }

    color("DimGray") arduino_chips();
    arduino_usb();
    arduino_reset();
    color("white") arduino_caps();
}

module arduino_reset() {
    translate([0,2,1.58/2+1.85/2]) {
        color("silver")
            cube([6,3.75,1.85], center=true);
        translate([0,0,1.85])
            color("white") cube([2.5, 1.25,0.5], center=true);
    }
}

module arduino_caps() {
    translate([-1.5,4,0])
    for( j = [1:2]) {
        for( i = [-1:2] ) {
            translate([i*3,j*3, 0.5+1.85/2])
                cube([1,1.5,1], center=true);
        }
    }
}

module arduino_circuit_board() {
    cube([17.6, 43, 1.58], center=true);
}

module arduino_usb() {
    erase_padding = 0.5;
    color("Silver")
    translate([
        0,
        (-43/2+9.25/2)-1.85,
        3.75/2+1.58/2
    ]) {
        difference() {
            cube([7.5,9.25,3.75], center=true);
            union() {
                translate([7.5/2-.5/2,-9.25/2+1.85/2,-1])
                    cube([.5+erase_padding,1.85+erase_padding,1.75+erase_padding], center=true);
                translate([-7.5/2+.5/2,-9.25/2+1.85/2,-1])
                    cube([.5+erase_padding,1.85+erase_padding,1.75+erase_padding], center=true);
            }
        }
    }
}

module arduino_chips() {
    translate([0,-7,1])
        rotate([0,0,45])
            cube([7,7,1], center=true);

    translate([0,-8.5,-1.6])
        cube([4,10,1.6], center=true);

    translate([2,12,-1.6])
        cube([6,3.3,1.6], center=true);
}

module arduino_holes() {
    $fn = 10;
    hole_size = 0.8;
    translate([-17.2/2+1.4,-43/2+0.6,0]) {
        for(j=[0:1]) {
            for(i=[1:15]) {
                translate([j*14,2.6*i,-1])
                    cylinder(r=hole_size, h=2);
            }
        }
    }

    translate([-5,14.5,0])
        for( j = [1:2] ) {
            for( i = [1:3] ) {
                translate([i*2.5,j*2.5,-1])
                    cylinder(r=hole_size,h=2);
            }
        }
}

arduino();
