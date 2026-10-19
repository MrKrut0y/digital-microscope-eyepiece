len_phone = 145;
d_screw_m4 = 4.5;
width_phone = 56;
thikness_holder = 4;
thikness_phone = 8;
append = 15;
corner_round = 8;
w_grip = 30;

holder_set();
//vertical_block(len_phone);

module grip() {
    difference() {
        grip_base();
        
        color("red")
        translate([0, w_grip/2, thikness_phone])
        cube([w_grip+1, w_grip, 2*thikness_phone], center=true);
        
        translate([0, -w_grip/4, 0])
        cylinder(d=d_screw_m4, 3*thikness_phone, center=true, $fn=32);
    }
}


module grip_base() {
    hull() {
        translate([w_grip/2-corner_round/2, -w_grip/2, 0])
        cylinder(d=corner_round, 2*thikness_phone, center=true);
        
        translate([-w_grip/2+corner_round/2, -w_grip/2, 0])
        cylinder(d=corner_round, 2*thikness_phone, center=true);
        
        translate([w_grip/2-corner_round/2, w_grip/2, 0])
        cylinder(d=corner_round, 2*thikness_phone, center=true);
        
        translate([-w_grip/2+corner_round/2, w_grip/2, 0])
        cylinder(d=corner_round, 2*thikness_phone, center=true);
    }
}


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
    
    translate([0, -len_phone/2, thikness_phone+thikness_holder/2])
    rotate([0, 180, 0])
    grip();
    
    translate([0, len_phone/2, thikness_phone+thikness_holder/2])
    rotate([0, 180, 180])
    grip();
    
    translate([width_phone/2, 10, thikness_phone+thikness_holder/2])
    rotate([0, 180, 90])
    grip();
    
    translate([-width_phone/2, 10, thikness_phone+thikness_holder/2])
    rotate([0, 180, -90])
    grip();
}
