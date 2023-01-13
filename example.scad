use <src/generator.scad>;

// Section: Parameters

$fn = 100;
section = false;

pipe_d = 21;
thickness = 4;
screw_d = 5;

arm1 = [
    ["height", 20],
    ["rotationX", 0],
    ["rotationY", 0],
    ["spin", 0],
    ["margin", 5],
    ["hole", 2]  // 0:Full opened,1:Ring,2:No hole
];

arm2 = [
    ["height", 20],
    ["rotationX", 90],
    ["rotationY", 0],
    ["spin", 0],
    ["margin", 5],
    ["hole", 2] // 0:Full opened,1:Ring,2:No hole
];

arms = [ arm1, arm2 ];

// End of section: Parameters

generator(
    section,
    pipe_d,
    thickness,
    screw_d,
    arms
);
