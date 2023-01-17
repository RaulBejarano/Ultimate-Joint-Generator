use <src/generator.scad>;

// Section: Parameters

$fn = 100;

arm1 = [
    ["pipe_diameter", 20],
    ["wall_thickness", 4],
    ["height", 20],
    ["rotationX", 0],
    ["rotationY", 0],
    ["spin", 0],
    ["margin", 5],
    ["hole", 2],  // 0:Full opened,1:Ring,2:No hole
    ["screw_diameter", 5],
    ["color", "#ffffff"] // (Optional) hex format (e.g. #ffffff) or color name (e.g. white)
];


// Adding a new arm I: set parameters. Uncomment the code below by deleting /* and */
/*
arm2 = [
    ["pipe_diameter", 20],
    ["wall_thickness", 4],
    ["height", 20],
    ["rotationX", 90],
    ["rotationY", 0],
    ["spin", 0],
    ["margin", 5],
    ["hole", 2],  // 0:Full opened,1:Ring,2:No hole
    ["screw_diameter", 5]
];
*/

// Adding a new arm II: add the new arm to the arms vector. The line below should be replaced by arms = [ arm1, arm2 ];
arms = [ arm1 ];

// End of section: Parameters

generator(arms);
