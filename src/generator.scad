module generator(
    pipe_d = 20,
    thickness = 4,
    screw_d = 5,
    arms
){
    outer_d = pipe_d + 2 * thickness;

    difference(){
        union(){    
            sphere(d = outer_d);
            for (i=[0:len(arms)-1]) {
                height = getValue(arms[i], ["height"]);
                rotationX = getValue(arms[i], ["rotationX"]);
                rotationY = getValue(arms[i], ["rotationY"]);
                spin = getValue(arms[i], ["spin"]);
                margin = getValue(arms[i], ["margin"]);
                hole = getValue(arms[i], ["hole"]);

                h = height + pipe_d/2 + margin;
                rotate([rotationX, rotationY, 0]){
                    rotate([0,0,spin]){
                        difference(){
                            cylinder(h = h, d = outer_d);
                            translate([-outer_d/2,0, (pipe_d + height)/2 + margin]){
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

            if (is_hole(arms)) {
                sphere(d = pipe_d);
            }
            for (i=[0:len(arms)-1]) {
                height = getValue(arms[i], ["height"]);
                rotationX = getValue(arms[i], ["rotationX"]);
                rotationY = getValue(arms[i], ["rotationY"]);
                spin = getValue(arms[i], ["spin"]);
                margin = getValue(arms[i], ["margin"]);
                hole = getValue(arms[i], ["hole"]);

                rotate([rotationX, rotationY, 0]){
                    translate([0,0,pipe_d/2 + margin]){
                        cylinder(h = height, d = pipe_d);
                    }
                    // Holes
                    h = pipe_d/2 + margin + height;
                    if (hole == 0){
                        cylinder(h = h, d = pipe_d);
                    } else if (hole == 1) {
                        cylinder(h = h, d = pipe_d - 2*thickness);
                    }                
                }
            }
        }
    }

    function getValue (data, key) = data[search(key, data, num_returns_per_match=1)[0]][1];
    function is_hole(arms, i=0, r=false) = i<len(arms)-1 ? getValue(arms[i], ["hole"]) < 2 || is_hole(arms, i+1, r) : getValue(arms[i], ["hole"]) < 2;

}
