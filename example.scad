use <src/generator.scad>;

// Section: Parameters

$fn = 100;
section = false;

pipe_d = 21;
thickness = 4;
screw_d = 5;

heights = [20];
rotationsX = [0];
rotationsY = [0];
spins = [0];
margins = [5];
holes = [1]; // 0:Full opened,1:Ring,2:No hole

// End of section: Parameters

generator(
    section,
    pipe_d,
    thickness,
    screw_d,
    heights,
    rotationsX,
    rotationsY,
    spins,
    margins,
    holes
);
