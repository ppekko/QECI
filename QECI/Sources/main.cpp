//
// >The MIT License (MIT)
//
// >Copyright (c) 2021 PipeWarp
//
// >Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// >The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// >THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
// Original Repo: https://github.com/pipewarp/QECI
//

#include <SDL2/SDL.h>
#include <glad/glad.h>

#define WinWidth 640
#define WinHeight 480

int main()
{

#ifdef SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR
    SDL_SetHint(SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR, "0");
#endif

    SDL_Window* Window = SDL_CreateWindow(NULL, 0, 0, WinWidth, WinHeight, SDL_WINDOW_OPENGL);
    SDL_GL_CreateContext(Window);

    gladLoadGLLoader((GLADloadproc)SDL_GL_GetProcAddress);

    while (1) {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            switch (event.type) {

            case SDL_QUIT:
                exit(1);
                break;
            }
        }

        glViewport(0, 0, WinWidth, WinHeight);
        glClearColor(0.2f, 0.2f, 0.2f, 0.f);
        glClear(GL_COLOR_BUFFER_BIT);
        SDL_GL_SwapWindow(Window);
    }
    exit(0);
}
