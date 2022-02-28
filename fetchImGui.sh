#!/bin/bash

function drawProgress(){
echo -n "[ "
for ((i = 0 ; i <= $1; i++)); do echo -n "###"; done
for ((j = i ; j <= $2 ; j++)); do echo -n "   "; done
v=$(( ($1 * 100) / $2 ))
echo -n " ] "
echo -n "$v %" $'\r'
echo
}

if [[ -d "QECI/ImGui/Sources/" ]]
then
    exit
fi

if [[ -d "QECI/ImGui/Headers/" ]]
then
    exit
fi

echo "Fetching ImGui Sources..."

wget --quiet https://raw.githubusercontent.com/ocornut/imgui/master/imgui.cpp -P QECI/ImGui/Sources/
drawProgress 1 7

wget --quiet https://raw.githubusercontent.com/ocornut/imgui/master/imgui_draw.cpp -P QECI/ImGui/Sources/
drawProgress 2 7

wget --quiet https://raw.githubusercontent.com/ocornut/imgui/master/imgui_widgets.cpp -P QECI/ImGui/Sources/
drawProgress 3 7

wget --quiet https://raw.githubusercontent.com/ocornut/imgui/master/imgui_tables.cpp -P QECI/ImGui/Sources/
drawProgress 4 7


wget --quiet https://raw.githubusercontent.com/ocornut/imgui/master/backends/imgui_impl_opengl3.cpp -P QECI/ImGui/Sources/
drawProgress 5 7

wget --quiet https://raw.githubusercontent.com/ocornut/imgui/master/backends/imgui_impl_sdl.cpp -P QECI/ImGui/Sources/
drawProgress 6 7

wget --quiet https://raw.githubusercontent.com/ocornut/imgui/master/imgui_demo.cpp -P QECI/ImGui/Sources/
drawProgress 7 7

echo "Sources fetched."

echo "Fetching ImGui Headers..."

wget --quiet https://raw.githubusercontent.com/ocornut/imgui/master/imgui.h -P QECI/ImGui/Headers/
drawProgress 1 9

wget --quiet https://raw.githubusercontent.com/ocornut/imgui/master/imconfig.h -P QECI/ImGui/Headers/
drawProgress 2 9

wget --quiet https://raw.githubusercontent.com/ocornut/imgui/master/imgui_internal.h -P QECI/ImGui/Headers/
drawProgress 3 9

wget --quiet https://raw.githubusercontent.com/ocornut/imgui/master/imstb_rectpack.h -P QECI/ImGui/Headers/
drawProgress 4 9

wget --quiet https://raw.githubusercontent.com/ocornut/imgui/master/imstb_textedit.h -P QECI/ImGui/Headers/
drawProgress 5 9

wget --quiet https://raw.githubusercontent.com/ocornut/imgui/master/imstb_truetype.h -P QECI/ImGui/Headers/
drawProgress 6 9

wget --quiet https://raw.githubusercontent.com/ocornut/imgui/master/backends/imgui_impl_opengl3_loader.h -P QECI/ImGui/Headers/
drawProgress 7 9

wget --quiet https://raw.githubusercontent.com/ocornut/imgui/master/backends/imgui_impl_opengl3.h -P QECI/ImGui/Headers/
drawProgress 8 9

wget --quiet https://raw.githubusercontent.com/ocornut/imgui/master/backends/imgui_impl_sdl.h -P QECI/ImGui/Headers/
drawProgress 9 9

echo "Headers Fetched."

echo "ImGui has been downloaded/updated."
