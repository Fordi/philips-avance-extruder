svgFile="./clover.svg"; // 11mm x 11mm svg file
module pasta_shape() {
    import(svgFile, center=true);
}
res=360;
tol=0.01;

difference() {
    union() {
        cylinder(h=11.5, r1=28.4, r2=28.2, $fn=res);
        translate([0, 0, 11.5])
            cylinder(h=4.5, r=22, $fn=res);
    }
    translate([0, 0, -tol]) {
        cylinder(h=7.3 + tol, r=25, $fn=res);
        cylinder(h=11.6, r=3.6, $fn=res);
    }
    
    translate([0, 0, -tol]) union() {
        for (i = [0:30:180]) difference() {
            cylinder(h=5.7+tol*2, r1=27.1, r2=26.1, $fn=res);
            rotate([0, 0, i]) 
                union() {
                    translate([2.415, -27.1+tol, -tol])
                        cube([27.1-2.415, (27.1+tol)*2, 5.8+tol*2]);
                    translate([-27.1, -27.1+tol, -tol])
                        cube([27.1-2.415, (27.1+tol)*2, 5.8+tol*2]);
                }
        }
    }
    difference() {
        cylinder(h=5.7+tol*2, r1=27.1, r2=26.1, $fn=res);
        union() {
            translate([2.705, -27.2+tol, -tol])
                cube([27.2-2.705, (27.2+tol)*2, 5.8+tol*2]);
            translate([-27.1, -27.1+tol, -tol])
                cube([27.2-2.705, (27.2+tol)*2, 5.8+tol*2]);
        }
    }
    
    union() for(i=[0:60:360]) {
        rotate(i) translate([12.5, 0, 0]) difference() {
            
            union() {
                translate([0, 0, 3+tol*2+7.3+5.7-tol])
                    rotate([180, 0, 180])
                    linear_extrude(height=3+tol*2, scale=1)
                        pasta_shape();
                translate([0, 0, 5.7+tol*2+7.3-tol])
                    rotate([180, 0, 180])
                    linear_extrude(height=5.7+tol*2, scale=2)
                        hull() pasta_shape();
            }
            
            union() {
                translate([0, -11, 2+7.3+5.7-2+tol*2])
                    rotate([180, 0, 180])
                    linear_extrude(height=2, scale=4)
                        square([0.5, 18.44], center=true);
                translate([-11, 0, 2+7.3+5.7-2+tol*2])
                    rotate([180, 0, 180])
                    linear_extrude(height=2, scale=4)
                        square([18.44, 0.5], center=true);
                translate([0, -11, 7.3+5.7-4+tol*3])
                    linear_extrude(height=2, scale=4)
                        square([0.5, 18.44], center=true);
                translate([-11, 0, 7.3+5.7-4+tol*3])
                    linear_extrude(height=2, scale=4)
                        square([18.44, 0.5], center=true);
            }
        }
    }

}