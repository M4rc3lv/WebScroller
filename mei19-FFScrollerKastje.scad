$fn=100;
R=29.4; // Diameter push button

Kast=true;
Deksel=true;

if(Kast) translate([0,0,-50]) {
 union() {
  difference() {
   hull() {
    translate([0,0,0]) cylinder(d=90,h=19);
    translate([0,-50,0]) cylinder(d=90,h=19);
   }
   hull() {
    translate([0,0,2.2]) cylinder(d=87,h=19);
    translate([0,-50,2.2]) cylinder(d=87,h=19);
   }
   
   // Gat USB
   translate([-48,-14.5,3.2]) cube([10,9/**/,5/**/]);
  }
  // Schroeven
  difference() {
   translate([-35,-70,0]) cylinder(d=9,h=19);
   translate([-35,-70,12]) cylinder(d=3.5,h=19);
  }
  difference() {
   translate([35,-70,0]) cylinder(d=9,h=19);
   translate([35,-70,0]) cylinder(d=3.5,h=19);
  }
  difference() {
   translate([0,41,0]) cylinder(d=9,h=19);
   translate([0,41,12]) cylinder(d=3.5,h=19);
  }
 }
}

if(Deksel) {
 // Halve bol met gat voor knop
 difference() {
  sphere(r=40);
  translate([0,0,-1])sphere(r=38);
  translate([-100,-100,-70]) cube([200,200,70]);
  cylinder(d=R,h=80);
  
  translate([-14.6,0,30]) cylinder(d=2,h=10);
  translate([14.6,0,30]) cylinder(d=2,h=10);
  translate([0,14.6,30]) cylinder(d=2,h=10);
  translate([0,-14.6,30]) cylinder(d=2,h=10);
  
  translate([0,41,1.2]) cylinder(d=5.2,h=10);
 }
 
 // Ondergrond (deksel)
 difference() {
  hull() {
   translate([0,0,0]) cylinder(d=90,h=2.2);
   translate([0,-50,0]) cylinder(d=90,h=2.2);
  }
  translate([0,0,-1]) cylinder(d=80,h=80);
  
  // Gat rotary-encoder
  translate([0,-65,-1]) cylinder(d=8,h=20);
  
  // Schroefgaten
  translate([-35,-70,-1]) cylinder(d=3.2,h=10);
  translate([-35,-70,1.2]) cylinder(d=5.2,h=10);
  translate([35,-70,-1]) cylinder(d=3.2,h=10);
  translate([35,-70,1.2]) cylinder(d=5.2,h=10);
  
  translate([0,41,-1]) cylinder(d=3.2,h=10);
  translate([0,41,1.2]) cylinder(d=5.2,h=10);
 }
}