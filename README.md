# MagicaVoxel

Imports MagicaVoxel .vox files, written in Swift. 

MagicaVoxel is a free voxel art editor: https://ephtracy.github.io

The format information can be found here: https://github.com/ephtracy/voxel-model

Currently supports XYZI, SIZE and RGBA chunks. Any other chunk types are ignored. This means only a single model in a file is supported and only basic color information, no materials.

This code is based on the 150 format version of MagicaVoxel.
