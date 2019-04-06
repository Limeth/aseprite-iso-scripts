# Aseprite scripts for creating isometric tiles 

These scripts are intended for 32x31 isometric pixelart cubes, they aid in
the creation of tiled textures, by repeating the texture on a chosen plane.

## Installation

Put these `.lua` files in your scripts folder accessible via
`File > Scripts > Open Scripts Folder`.
It is recommended to create keyboard shortcuts to the scripts.

## Usage

* Create a layer with the name `ISO Above` above the layer with the texture you would like to tile.
* Create a layer with the name `ISO Below` below the layer with the texture you would like to tile.
* Select the layer you would like to tile and execute the script corresponding to the face to tile.

## Preview

Original image:

![Original image][demo-clear]


After executing `iso_left.lua`:

![Original image][demo-left]


After executing `iso_top.lua`:

![Original image][demo-top]


After executing `iso_right.lua`:

![Original image][demo-right]


After executing `iso_clear.lua`:

![Original image][demo-clear]

[demo-left]: https://github.com/Limeth/aseprite-iso-scripts/raw/master/demo/iso_script_left.png
[demo-top]: https://github.com/Limeth/aseprite-iso-scripts/raw/master/demo/iso_script_top.png
[demo-right]: https://github.com/Limeth/aseprite-iso-scripts/raw/master/demo/iso_script_right.png
[demo-clear]: https://github.com/Limeth/aseprite-iso-scripts/raw/master/demo/iso_script_clear.png
