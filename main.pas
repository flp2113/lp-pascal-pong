program main;

uses SDL2;

const
    WINDOW_TITLE    = 'Pascal Pong';
    WINDOW_WIDTH    = 1280;
    WINDOW_HEIGHT   = 720;
    OFFSET_BORDER   = 100;
    PLAYER_WIDTH    = 15;
    PLAYER_HEIGHT   = 150;
    PLAYER_SPEED    = 5;

var
    sdlEvent: PSDL_Event;
    Running: Boolean;
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    keyboardState: PUInt8;
    player1Rect: TSDL_Rect;
    player2Rect: TSDL_Rect;
    border1Rect: TSDL_Rect;
    border2Rect: TSDL_Rect;

begin
    if SDL_Init(SDL_INIT_VIDEO) < 0 then Exit;
        
    window := SDL_CreateWindow(WINDOW_TITLE, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, WINDOW_WIDTH, WINDOW_HEIGHT, SDL_WINDOW_SHOWN);
    if window = nil then Halt;
        
    renderer := SDL_CreateRenderer(window, -1, 0);
    if renderer = nil then Halt;

    player1Rect.w := PLAYER_WIDTH;
    player1Rect.h := PLAYER_HEIGHT;
    player1Rect.x := 0 + OFFSET_BORDER;
    player1Rect.y := WINDOW_HEIGHT div 2 - PLAYER_HEIGHT div 2;

    player2Rect.w := PLAYER_WIDTH;
    player2Rect.h := PLAYER_HEIGHT;
    player2Rect.x := WINDOW_WIDTH - OFFSET_BORDER;
    player2Rect.y := WINDOW_HEIGHT div 2 - PLAYER_HEIGHT div 2;

    border1Rect.w := PLAYER_WIDTH;
    border1Rect.h := WINDOW_HEIGHT;
    border1Rect.x := 0;
    border1Rect.y := 0;

    border2Rect.w := PLAYER_WIDTH;
    border2Rect.h := WINDOW_HEIGHT;
    border2Rect.x := WINDOW_WIDTH - PLAYER_WIDTH;
    border2Rect.y := 0;

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
        player1Rect.y := player1Rect.y - PLAYER_SPEED;
        if keyboardState[SDL_SCANCODE_S] = 1 then
        player1Rect.y := player1Rect.y + PLAYER_SPEED;
        if keyboardState[SDL_SCANCODE_UP] = 1 then
        player2Rect.y := player2Rect.y - PLAYER_SPEED;
        if keyboardState[SDL_SCANCODE_DOWN] = 1 then
        player2Rect.y := player2Rect.y + PLAYER_SPEED;

        // BACKGROUND
        SDL_SetRenderDrawColor(renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
        SDL_RenderClear(renderer);

        // RECT
        SDL_SetRenderDrawColor(renderer, 255, 255, 255, SDL_ALPHA_OPAQUE);
        SDL_RenderFillRect(renderer, @player1Rect);
        SDL_RenderFillRect(renderer, @player2Rect);
        SDL_SetRenderDrawColor(renderer, 0, 255, 0, 255);
        SDL_RenderFillRect(renderer, @border1Rect);
        SDL_RenderFillRect(renderer, @border2Rect);

        SDL_RenderPresent(renderer);
        SDL_Delay(16);
    end;
    
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit;
end.