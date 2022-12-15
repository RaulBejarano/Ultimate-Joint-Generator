$fn = 100;

section = false;

pipe_d = 21;
thickness = 4;
screw_d = 5;

heights = [20, 20, 20, 20];
rotationsX = [0, 0, 0, 90];
rotationsY = [0, 90, -90, 0];
spins = [0, 90, 90, 45];
margins = [5, 5, 5, 5];
holes = [1, 1, 1, 1]; // 0:Full opened,1:Ring,2:No hole

outer_d = pipe_d + 2 * thickness;


difference(){
    union(){    
        sphere(d = outer_d);
        for(i = [0 : 1 : len(heights)-1]){
            h = heights[i] + pipe_d/2 + margins[i];
            rotate([rotationsX[i], rotationsY[i], 0]){
                rotate([0,0,spins[i]]){
                    difference(){
                        cylinder(h = h, d = outer_d);
                        translate([-outer_d/2,0, (pipe_d + heights[i])/2 + margins[i]]){
                            rotate([0,90,0]){
                                cylinder(h = outer_d, d = screw_d);
                            }
                        }
                    }
                }
            }
        }
    }   

    union(){
        if (is_hole(holes)) {
            sphere(d = pipe_d);
        }
        for(i = [0 : 1 : len(heights)-1]){
            rotate([rotationsX[i], rotationsY[i], 0]){
                translate([0,0,pipe_d/2 + margins[i]]){
                    cylinder(h = heights[i], d = pipe_d);
                }
                // Holes
                h = pipe_d/2 + margins[i] + heights[i];
                if (holes[i] == 0){
                    cylinder(h = h, d = pipe_d);
                } else if (holes[i] == 1) {
                    cylinder(h = h, d = pipe_d - 2*thickness);
                }                
            }
        }
        
    }
    
    if(section) translate([0,-100,-50]) cube([100, 100, 100]);
    
}

function is_hole(v, i=0, r=false) = i<len(v)-1 ? v[i] < 2 || is_hole(v, i+1, r) : v[i] < 2;


