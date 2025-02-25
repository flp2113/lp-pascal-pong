program main;

uses SDL2;

const
    WINDOW_TITLE    = 'Pascal SDL Test';
    WINDOW_WIDTH    = 1280;
    WINDOW_HEIGHT   = 720;
    WINDOW_X        = 0;
    WINDOW_Y        = 0;

var
    sdlEvent: PSDL_Event;
    ExitLoop: Boolean;
    window: PSDL_Window;
    renderer: PSDL_Renderer;

begin
    if SDL_Init(SDL_INIT_VIDEO) < 0 then Exit;
        
    window := SDL_CreateWindow(WINDOW_TITLE, WINDOW_X, WINDOW_Y, WINDOW_WIDTH, WINDOW_HEIGHT, SDL_WINDOW_SHOWN);
    if window = nil then Halt;
        
    renderer := SDL_CreateRenderer(window, -1, 0);
    if renderer = nil then Halt;

    new(sdlEvent);
    ExitLoop := False;
    while not ExitLoop do
    begin
        while (SDL_PollEvent(sdlEvent) <> 0) do
        begin
            if (sdlEvent^.type_ = SDL_QUITEV) then
                ExitLoop := True;
        end;
    end;
    
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);

    SDL_Quit;
end.