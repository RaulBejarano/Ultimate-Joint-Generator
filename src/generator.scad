module generator(arms){

    max_outer_d = getMaxOuterD(arms);
    difference(){
        union(){
            sphere(d = max_outer_d);
            for (i=[0:len(arms)-1]) {
                height = getValue(arms[i], ["height"]);
                rotationX = getValue(arms[i], ["rotationX"]);
                rotationY = getValue(arms[i], ["rotationY"]);
                spin = getValue(arms[i], ["spin"]);
                margin = getValue(arms[i], ["margin"]);
                hole = getValue(arms[i], ["hole"]);
                screw_d = getValue(arms[i], ["screw_diameter"]);
                pipe_d = getValue(arms[i], ["pipe_diameter"]);
                thickness = getValue(arms[i], ["wall_thickness"]);

                h = height + pipe_d/2 + margin;
                rotate([rotationX, rotationY, 0]){
                    rotate([0,0,spin]){
                        difference(){
                            outer_d = pipe_d + 2 * thickness;
                            cylinder(h = h, d = outer_d);
                            translate([-max_outer_d/2,0, (pipe_d + height)/2 + margin]){
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
            max_inner_d = getMaxInnerD(arms);
            if (is_hole(arms)) {
                sphere(d = max_inner_d);
            }
            for (i=[0:len(arms)-1]) {
                height = getValue(arms[i], ["height"]);
                rotationX = getValue(arms[i], ["rotationX"]);
                rotationY = getValue(arms[i], ["rotationY"]);
                spin = getValue(arms[i], ["spin"]);
                margin = getValue(arms[i], ["margin"]);
                hole = getValue(arms[i], ["hole"]);
                pipe_d = getValue(arms[i], ["pipe_diameter"]);
                thickness = getValue(arms[i], ["wall_thickness"]);

                rotate([rotationX, rotationY, 0]){
                    translate([0,0,max_inner_d/2 + margin]){
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
    function getMaxOuterD (arms, i=0, r=0) = ( i < len(arms)-1 ?
        r < getValue(arms[i], ["pipe_diameter"]) +  2 * getValue(arms[i], ["wall_thickness"])?
            getMaxOuterD(arms, i+1, getValue(arms[i], ["pipe_diameter"]) +  2 * getValue(arms[i], ["wall_thickness"]))
            : getMaxOuterD(arms, i+1, r)
        : r < getValue(arms[i], ["pipe_diameter"]) +  2 * getValue(arms[i], ["wall_thickness"])?
            getValue(arms[i], ["pipe_diameter"]) +  2 * getValue(arms[i], ["wall_thickness"])
            : r
    );
    function getMaxInnerD ( arms, i=0, r=0) = ( i < len(arms)-1 ?
        r < getValue(arms[i], ["pipe_diameter"]) ?
            getMaxInnerD(arms, i+1, getValue(arms[i], ["pipe_diameter"]))
            : getMaxInnerD(arms, i+1, r)
        : r < getValue(arms[i], ["pipe_diameter"]) ?
            getValue(arms[i], ["pipe_diameter"])
            : r
    );
}
