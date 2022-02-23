# Small Glitter
#### (a fork of  [Glitter](http://polytonic.github.io/Glitter/)) for small SDL/OpenGL applications/demos


# Warning!
As of 11/23/21, this is currently outdated due to LxDemOWin, I will update this repo accordingly with LxDemOWin and dnload intergration (aka i can make the size alot smaller). I am also an idiot and I didn't get rid of main and GLAD, so that bloats the size *alot*
**If you like having OpenGL and SDL in 13kb, then feel free to dismiss this warning.**

## Summary
Small Glitter is a modified fork of the Glitter project. This fork has removed some dependencies, added SDL, added packer support and more, for Demoscene productions or small applications. 


The advantage of using SDL with OpenGL is that it is **crossplatform**, aswell as the other libraries (glad, glm)
This however limits people from using OS specific tricks, but *where's the fun in that?*
It also contains a *veeery* slightly modified version of gzexe (nicknamed bettergz) which just removes a bunch of whitespace and "bloat" from gzexe's output.

The code currently does not work on Windows as I have yet to create a .bat version of compress.sh. A workaround would be to run the packers manually after compilation or create the script yourself.

On build, the project will automatically enables compression in the compiler (o2/3 or IPO) and run the built binary through a modified version of gzexe (you can modify this [here!](#Modifiying-the-executable-packers))

The small SDL+OpenGL code inside this project (src 1kb), when built, totals in size to just under **14kb** (13,913 bytes built on Arch Linux)

The code creates a window with a blank colour on it, rendered with SDL and OpenGL

![preview](preview.png)

## Building

You must make sure you have the required dependencies in the Included/Required Dependencies section (any package that has no under the - -recrusive tab).
Compression script currently not working on windows (since it's in bash), i'll make a replacment soon.


```bash
# Linux
git clone --recursive https://github.com/PipeWarp/Small-Glitter
cd Small-Glitter
mkdir build
cd build
cmake ..
make

# Mac OSX
git clone --recursive https://github.com/PipeWarp/Small-Glitter
cd Small-Glitter
mkdir build
cd build
cmake -G "Xcode" ..
#(build in xcode)

# Microsoft Windows
git clone --recursive https://github.com/PipeWarp/Small-Glitter
cd Small-Glitter
mkdir build
cd build
cmake -G "Visual Studio 14" ..
cmake -G "Visual Studio 14 Win64" ..
...
#(build inside of Visual Studio)
```

This will build the main.cpp file inside of SmallGlitter/Sources


## Included/Required Dependencies:


Functionality           | Library/Dependency                        | Comes with - -recursive?
----------------------- | ------------------------------------------|--------------------------
OpenGL Function Loader  | [glad](https://github.com/Dav1dde/glad)   | Yes
Windowing and Input     | [sdl](https://github.com/libsdl-org/SDL)      | No
OpenGL Mathematics      | [glm](https://github.com/g-truc/glm)      | Yes
SStrip   | [sstrip](https://www.muppetlabs.com/~breadbox/software/elfkickers.html)             | No

iroincally, gzexe provided better compression sizes than UPX

## Modifiying the name
To modify the name of the project, just do a Find and replace operation on the CMakeLists.txt file, replacing every instance of **"smallglitter"** with your own name (specifically in lowercase!). From there you can start coding.

## Modifiying the executable packers
If you wish to use a different executable packer, head to the compression.sh or compression.bat (currently nonexistent) files and modify the lines past the text "Packing starts here!" with your own packer commands.

# TODO
- utilise _start and minimise stdlibs without SDL breaking

# Credits
- PolyTonic for Glitter.
- The GNU Project for the source code of gzexe
- The creators of all the dependencies.

## License
>The MIT License (MIT)

>Copyright (c) 2021 PipeWarp

>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
