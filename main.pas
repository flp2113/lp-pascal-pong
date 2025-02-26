program main;

uses SDL2;

const
    WINDOW_TITLE    = 'Pascal Pong';
    WINDOW_WIDTH    = 1280;
    WINDOW_HEIGHT   = 720;

var
    sdlEvent: PSDL_Event;
    Running: Boolean;
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    rect: TSDL_Rect;
    keyboardState: PUInt8;

begin
    if SDL_Init(SDL_INIT_VIDEO) < 0 then Exit;
        
    window := SDL_CreateWindow(WINDOW_TITLE, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, WINDOW_WIDTH, WINDOW_HEIGHT, SDL_WINDOW_SHOWN);
    if window = nil then Halt;
        
    renderer := SDL_CreateRenderer(window, -1, 0);
    if renderer = nil then Halt;

    // PREPARE RECT
    rect.x := 300;
    rect.y := 200;
    rect.w := 100;
    rect.h := 50;

    keyboardState := SDL_GetKeyboardState(nil);
    Running := True;
    while Running do
    begin
        new(sdlEvent);
        while SDL_PollEvent(sdlEvent) <> 0 do
        begin
            case sdlEvent^.type_ of
                SDL_QUITEV: 
                    Running := False;
            end;
        end;

        SDL_PumpEvents;
        
        // EXIT BY PRESSING ESC
        if keyboardState[SDL_SCANCODE_ESCAPE] = 1 then
        Running := False;

        // WASD
        if keyboardState[SDL_SCANCODE_W] = 1 then
        rect.y := rect.y - 1;
        if keyboardState[SDL_SCANCODE_A] = 1 then
        rect.x := rect.x - 1;
        if keyboardState[SDL_SCANCODE_S] = 1 then
        rect.y := rect.y + 1;
        if keyboardState[SDL_SCANCODE_D] = 1 then
        rect.x := rect.x + 1;

        // BACKGROUND
        SDL_SetRenderDrawColor(renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
        SDL_RenderClear(renderer);

        // RECT
        SDL_SetRenderDrawColor(renderer, 255, 255, 255, SDL_ALPHA_OPAQUE);
        SDL_RenderFillRect(renderer, @rect);
        //SDL_RenderDrawRect(renderer, @rect);

        SDL_RenderPresent(renderer);
        SDL_Delay(16);
    end;
    
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);

    SDL_Quit;
end.