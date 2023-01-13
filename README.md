# Ultimate Joint Generator
The Ultimate Joint Generator is an open source project that provides a way to generate STL files to 3D-print parametric connectors to build greenhouses, pipe connectors, or whatever structure you need.

|![90 degree connector](./img/preview_1.PNG)|![extended T connector](./img/preview_2.PNG)|
|---|---|


## :sparkles: Features
| ![](./img/multitube.PNG)  | ![](./img/angles_and_margins.PNG)  | ![](./img/hole_types.PNG)  | ![](./img/madness.PNG)  |
|---|---|---|---|
|  Multi-arm  |  Safe pipe connectors  | Three hole types  |  Madness allowed  |
|  You can create connectors with as many arms as you want  |  You can create margins to avoid pipes colisions inside the connector   |  You can choose between 3 types of holes: full opened, ringed or closed  |  Create the monster connector that you need in a simple way  |


## :muscle: Getting started

The Ultimate Joint Generator is meant to be used by anyone and it's not neccessary to code, *BUT* you have to touch some values that are in the code. Don't worry, it's easy and very strightforward. Let's start!

### :arrow_down: Download stuff
Fist of all you have to download several things:

1. This repository [by downloading it](https://github.com/RaulBejarano/Ultimate-Joint-Generator/archive/refs/heads/main.zip) or by cloning it (we assume that if you use this method you know how to do it). Then unzip the files.
2. [OpenSCAD](https://openscad.org/downloads.html): the sofware we need to render and create our STL files.


### :hammer: Creating our first connector

Let's start by opening the file `example.scad` with OpenSCAD.

You will see some code but we only are interested in the parameters inside the section `Parameters`. Let's change some of them:

- `section = true;`this parameter allow us to "cut" to the middle our design for debugging purposes. Remember to set it to `false` before creating the final model.
- `pipe_d = 20;` this is the diameter of every pipe that will connect to our connector
- `thickness = 4;` this sets the size of the walls of the connector.
- `screw_d = 5;` if you want to use screws you should set this value to their diameter, if not set it to 0.
  
And now the difficult part, the vector that defines our connector. Actually you only need to know that theese parameters defines how is goint to be each arm, and that a column represents all parameters for just one arm.

- `heights = [20];` This vector sets the height (lenght) of each arm.
- `rotationsX = [0];` This vector sets the rotation in degrees in X plane of each arm.
- `rotationsY = [0];` This vector sets the rotation in degrees in Y plane of each arm.
- `spins = [0];` This vector sets how many degrees rotates an arm over itself.
- `margins = [5];` This vector sets the margins in each arm (see parameters cheatset)
- `holes = [1];` This vector sets wich kind of hole will be used in each arm. It can take the values: 0 for full opened, 1 for ringed and 2 for no hole.

If you use theese values and render with OpenSCAD you will get something similar to the image in parameter cheatsheet.

Probably you want to have more than an arm, try changing your parameters to this:

```
heights = [20, 20];
rotationsX = [0, 0];
rotationsY = [0, 90];
spins = [0, 90];
margins = [5, 5];
holes = [1, 1];
```
That's it! Just by adding a new column you will get a new arm.

Now it's your turn. Play with the parameters and try adding more arms, different rotations, spins, etc. Let's make something awesome!



### :gear: Parameters cheatsheet

![Parameters](./img/parameters.PNG)

| Parameter   | Description  | Default value  |
|---|---|---|
| section  | Debugging parameter that allows to see inside the connector  | false  |
| pipe_d  | Inner diameter of the connector arm  | 21  |
| thickness  | Defines the wall thickness  | 4  |
| screw_d  | Screw diameter of every connector arm  | 5  |
| heights  | Vector of arm heights  |   |
| rotationsX  | Vector of arm rotations in x-axis  |   |
| rotationsY  | Vector of arm rotations in y-axis  |   |
| spins  | Vector of arm spins  |   |
| margins  | Vector of arm margins  |   |
| holes  | Vector of arm hole types. Values: 0: Full opened,1: Ring,2: No hole  |   |



## Contributing

Feel free to contribute to this project as much as you want.

:children_crossing: If you are new contributing we recommend you to start by playing with the core design file [`generator.scad`](./src/generator.scad).

:memo: When you see something you want to add, modify or refactor first of all you should **create a new issue** providing as much information as you can. We will appreciate if you can write as an user story (e.g. `AS [a user persona], I WANT [to perform this action] SO THAT [I can accomplish this goal]`.) 

:twisted_rightwards_arrows: Then you should create a fork of the project, clone it to your local, create a new local branch and you will be ready to start making changes. You'll need a recent version of [OpenSCAD.](https://openscad.org/)

:rocket: When you finish making changes go to [pull requests](https://github.com/RaulBejarano/Ultimate-Joint-Generator/pulls) and create a new one selecting your fork as source. More info on [GitHub Docs: creating a pull request from a fork](https://docs.github.com/es/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork). Please add as much information as you can explaining what have you done, strategies you followed, which issue resolves, etc.

:speech_balloon: Your PR will be commented, reviewed and, we hope, :tada:**approved and merged into main branch**:tada:.

If you want to contribute but you feel lost with all this process please fell free to contact to any of the mantainers, they will help you a lot.
