len_phone = 145;
d_screw_m4 = 4.5;
width_phone = 56;



difference() {
    t_cross();
    screw_hole();
}

module t_cross() {
    hull() {
        translate([0, -len_phone/2, 0])
        cylinder(d=9, h=4, center=true, $fn=32);

        translate([0, len_phone/2, 0])
        cylinder(d=9, h=4, center=true, $fn=32);
    }
    
    hull() {
        translate([width_phone/2, 0, 0])
        cylinder(d=9, h=4, center=true, $fn=32);

        translate([-width_phone/2, 0, 0])
        cylinder(d=9, h=4, center=true, $fn=32);
    }
}

module screw_hole() {
    color("red")
    hull() {
        translate([0, len_phone/2, 0])
        cylinder(d=d_screw_m4, h=6, center=true, $fn=32);
        
        translate([0, -len_phone/2, 0])
        cylinder(d=d_screw_m4, h=6, center=true, $fn=32);
    }
    
    color("red")
    hull() {
        translate([width_phone/2, 0, 0])
        cylinder(d=d_screw_m4, h=6, center=true, $fn=32);

        translate([-width_phone/2, 0, 0])
        cylinder(d=d_screw_m4, h=6, center=true, $fn=32);
    }
}

