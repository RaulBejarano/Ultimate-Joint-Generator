# Ultimate Joint Generator
The Ultimate Joint Generator is an open source project that provides a way to generate parametric connectors to make greenhouses, pipe connectors, or whatever structure you need to build.

|   |   |
|---|---|
|![90 degree connector](./img/preview_1.PNG)|![extended T connector](./img/preview_2.PNG)|


## Features
| ![](./img/multitube.PNG)  | ![](./img/angles_and_margins.PNG)  | ![](./img/hole_types.PNG)  | ![](./img/madness.PNG)  |
|---|---|---|---|
|  Multi-arm  |  Safe pipe connectors  | Three hole types  |  Madness allowed  |
|  You can create connectors with as many arms as you want  |  You can create margins to avoid pipes colisions inside the connector   |  You can choose between 3 types of holes: full opened, ringed or closed  |  Create the monster connector that you need in a simple way  |



## Parameters

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

:children_crossing: If you are new here we recommend you to start by playing with the main design file [`generator.scad`](./generator.scad).

:memo: When you see something you want to add, modify or refactor first of all you should **create a new issue** providing as much information as you can. We will appreciate if you can write as an user story (e.g. `AS [a user persona], I WANT [to perform this action] SO THAT [I can accomplish this goal]`.) 

:twisted_rightwards_arrows: Then you should create a fork of the project, clone it to your local, create a new local branch and you will be ready to start making changes. You'll need a recent version of [OpenSCAD.](https://openscad.org/)

:rocket: When you finish making changes go to [pull requests](https://github.com/RaulBejarano/Ultimate-Joint-Generator/pulls) and create a new one selecting your fork as source. More info on [GitHub Docs: creating a pull request from a fork](https://docs.github.com/es/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork). Please add as much information as you can explaining what have you done, strategies you followed, which issue resolves, etc.

:speech_balloon: Your PR will be commented, reviewed and, we hope, :tada:**approved and merged into main branch**:tada:.

If you want to contribute but you feel lost with all this process please fell free to contact to any of the mantainers, they will help you a lot.
