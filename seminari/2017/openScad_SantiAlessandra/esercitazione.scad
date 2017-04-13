$fn=40;

////------------------------------
//sphere(d=10);
//cube([10,10,10], center=true);
//cylinder(h=10, r1=5, r2=5, center=true);

////------------------------------color
//color([1,0,0,1]) sphere(d=10);
//color([0,0,1,1]) cube([10,10,10], center=true);
//color([0,1,0,1]) cylinder(h=10, r1=5, r2=5, center=true);

////------------------------------color+trasp.
//color([1,0,0,0.3]) sphere(d=10);
//color([0,0,1,0.3]) cube([10,10,10], center=true);
//color([0,1,0,0.3]) cylinder(h=10, r1=5, r2=5, center=true);

////------------------------------translate        
//translate([0,0,0]){
//   translate([0,0,0]) color([1,0,0,0.3]) sphere(d=10);
//   translate([0,0,0]) color([0,0,1,0.3]) cube([10,10,10], center=true);
//   translate([0,0,0]) color([0,1,0,0.3]) cylinder(h=10, r1=5, r2=5, center=true);
//}

////------------------------------rotate
//rotate([0,0,0]) color([1,0,0,0.3]) sphere(d=10);
//rotate([0,0,0]) color([0,0,1,0.3]) cube([10,10,10], center=true);
//rotate([0,0,0]) color([0,1,0,0.3]) cylinder(h=10, r1=5, r2=5, center=true);

////------------------------------rotate+translate
//rotate([0,0,0]){
//    translate([0,0,0]){
//        rotate([0,0,0]) translate([0,0,0]) color([1,0,0,0.3]) sphere(d=10);
//        rotate([0,0,0]) translate([0,0,0]) color([0,0,1,0.3]) cube([10,10,10], center=true);
//        rotate([0,0,0]) translate([0,0,0]) color([0,1,0,0.3]) cylinder(h=10, r1=5, r2=5, center=true);
//    }
//}

////------------------------------union  sphere + cube
//union(){
//    color([1,0,0,1]) sphere(d=12); // sphere
//    color([0,0,1,1]) cube([10,10,10], center=true); // cube
//}

////------------------------------difference  sphere - cube
//difference(){
//    color([1,0,0,1]) sphere(d=12); // sphere
//    color([0,0,1,1]) cube([10,10,10], center=true); // cube
//}

////------------------------------difference  cube - sphere
//difference(){
//    color([0,0,1,0.5]) cube([10,10,10], center=true);  // cube
//    color([1,0,0,1]) sphere(d=12); // sphere
//    }

////------------------------------difference  sphere - cube / cube - sphere
//difference(){
//    color([1,0,0,1]) sphere(d=12); // sphere
//    color([0,0,1,1]) cube([10,10,10], center=true); // cube
//}
//
//translate([20,0,0]) {
//    difference(){
//        color([0,0,1,0.5]) cube([10,10,10], center=true);  // cube
//        color([1,0,0,1]) sphere(d=12); // sphere
//    }
//}

////------------------------------intersection  sphere - cube
//intersection(){
//    color([1,0,0,1]) sphere(d=12); // sphere
//    color([0,0,1,1]) cube([10,10,10], center=true); // cube
//}

////------------------------------text
//text(font="Impact","Gulp");

////------------------------------linear_extrude
//linear_extrude(height=10) text(font="Impact","Gulp");

////------------------------------for-translate
//for(i=[0:3]){
//    translate([0,i*2,0]) cube([10,1,1]);
//}

////------------------------------for-rotate-translate
//for(i=[90,180,270,360]){
//    rotate([0,0,i]) translate([10,10,0]) cylinder([1,2,1]);
//}

////------------------------------for-difference
//difference(){
//    cube([24,24,3], center=true);
//    for(i=[90,180,270,360]){
//        rotate([0,0,i]) translate([10,10,-5]) cylinder(10,r=1,r=1);
//    }
//}