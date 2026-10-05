len_phone = 145;
d_screw_m4 = 4.5;
width_phone = 56;
thikness_holder = 6;
append = 15;

holder_set();

module horizontal_block(len_block, offset_vertical) {
    len_block = len_block + append;
    
    translate([0, offset_vertical, 0])
    cylinder(d=20, h=thikness_holder, center=true, $fn=32);
    
    difference() {
        hull() {
            translate([len_block/2, offset_vertical, 0])
            cylinder(d=9, h=thikness_holder, center=true, $fn=32);
            
            translate([-len_block/2, offset_vertical, 0])
            cylinder(d=9, h=thikness_holder, center=true, $fn=32);
        }
        color("red")
        hull() {
            translate([len_block/2, offset_vertical, 0])
            cylinder(d=d_screw_m4, h=thikness_holder+2, center=true, $fn=32);
            
            translate([-len_block/2, offset_vertical, 0])
            cylinder(d=d_screw_m4, h=thikness_holder+2, center=true, $fn=32);
        }
    }
}

vertical_block(len_phone);

module vertical_block(len_block) {
    len_block = len_block + append;
    
        difference() {
            hull() {
                //translate([0, -len_phone/2, 0])
                translate([0, -len_block/2, 0])
                cylinder(d=9, h=thikness_holder, center=true, $fn=32);
                
                //translate([0, -len_phone/2, 0])
                translate([0, len_block/2, 0])
                cylinder(d=9, h=thikness_holder, center=true, $fn=32);
            }
            color("red")
            hull() {
                //translate([0, -len_phone/2, 0])
                translate([0, -len_block/2, 0])
                cylinder(d=d_screw_m4, h=thikness_holder+2, center=true, $fn=32);
                
                //translate([0, -len_phone/2, 0])
                translate([0, len_block/2, 0])
                cylinder(d=d_screw_m4, h=thikness_holder+2, center=true, $fn=32);
        }
    }
}

module holder_set() {
    horizontal_block(len_block=width_phone, offset_vertical=10);
    vertical_block(len_block=len_phone);
}
