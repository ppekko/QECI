

# QECI
#### Quick Easy Cross-platform ImGui

This project allows you to quickly get started with making a project with SDL and ImGui. It will automatically fetch all the required files for ImGui straight from the GitHub repo. This originally started life as a fork of SmallGlitter for ImGui

Like LxDemOWin, I won't maintain this much as I made this to quickly implement something.

Windows support is non-existent and I don't plan on supporting it ***however*** you can use WSL to run `fetchImGui.sh` to get the right ImGui files downloaded and then continue as normal.



```bash
# Linux
git clone --recursive https://github.com/ppekko/QECI
cd QECI
mkdir build
cd build
cmake ..
make

# Mac OSX
git clone --recursive https://github.com/ppekko/QECI
cd QECI
mkdir build
cd build
cmake -G "Xcode" ..
#(build in xcode)
```


## License
>The MIT License (MIT)

>Copyright (c) 2022 pipe

>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
