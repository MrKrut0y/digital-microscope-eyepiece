echo("Работа Павла Юнкер");
len_phone = 145;
width_phone = 60;
thickness_phone = 6;

corner_round = 9;

module camera() {
    cube([width_phone, len_phone, thickness_phone], center=true);

    color("blue")
    translate([width_phone/2-50, len_phone/2-10, 0])
    cylinder(d=9, h = thickness_phone - 1);

    color("blue")
    translate([width_phone/2-50, len_phone/2-25, 0])
    cylinder(d=9, h = thickness_phone - 1);

    color("blue")
    translate([width_phone/2-40, len_phone/2-18, 0])
    cylinder(d=6, h = thickness_phone - 1);
}

module smartphone() {
    hull() {
        color("red")
        translate([width_phone/2, len_phone/2, 0])
        cylinder(h=thickness_phone, d=corner_round, $fn=32, center=true);

        mirror([1,0,0])
        color("red")
        translate([width_phone/2, len_phone/2, 0])
        cylinder(h=thickness_phone, d=corner_round, $fn=32, center=true);

        mirror([0,1,0])
        color("red")
        translate([width_phone/2, len_phone/2, 0])
        cylinder(h=thickness_phone, d=corner_round, $fn=32, center=true);

        mirror([1,0,0])
        mirror([0,1,0])
        color("red")
        translate([width_phone/2, len_phone/2, 0])
        cylinder(h=thickness_phone, d=corner_round, $fn=32, center=true);
    }
}

h = 3;

smartphone();
camera();
color("red")
translate([-28, 37, 2])
cube([25, 35, 2]);
