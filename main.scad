use <smartphone.scad>
use <holder.scad>

thickness_phone = 8;
thickness_holder = 4;

echo("Работа Павла Юнкер");

smartphone();
translate([0, 0, -thickness_phone/2-thickness_holder/2])
holder_set();