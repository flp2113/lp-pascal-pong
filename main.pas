program main;

uses SysUtils, SDL2, SDL2_ttf;

type
    windowState_t = (start, game);

const
    WINDOW_TITLE    = 'Pascal Pong';
    WINDOW_WIDTH    = 1280;
    WINDOW_HEIGHT   = 720;
    OFFSET_BORDER   = 100;
    PLAYER_WIDTH    = 15;
    PLAYER_HEIGHT   = 150;
    PLAYER_SPEED    = 5;
    BOT_SPEED       = 3;
    BALL_SCALE      = 10;
    MAX_TEXTS       = 3;

var
    sdlEvent: PSDL_Event;
    Running: Boolean;
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    font: PTTF_Font;
    textSurface: PSDL_Surface;
    textTextures: array[0..MAX_TEXTS - 1] of PSDL_Texture;
    textColor: TSDL_Color;
    textRects: array[0..MAX_TEXTS - 1] of TSDL_Rect;
    textsVisible: array[0..MAX_TEXTS - 1] of boolean; 
    keyboardState: PUInt8;
    player1Rect: TSDL_Rect;
    player2Rect: TSDL_Rect;
    border1Rect: TSDL_Rect;
    border2Rect: TSDL_Rect;
    ball: TSDL_Rect;
    playerMiddle: integer = WINDOW_HEIGHT div 2 - PLAYER_HEIGHT div 2;
    state: windowState_t = start;
    lowerOption: boolean = false;
    lock: boolean = false;
    i: integer;

procedure setRectangle(var rect: TSDL_Rect; width, height, xPos, yPos: integer);
begin
    rect.w := width;
    rect.h := height;
    rect.x := xPos;
    rect.y := yPos;
end;

procedure updateText(index: integer; text: string; xPos, yPos: integer; center: boolean);
begin
    if textTextures[index] <> nil then
        SDL_DestroyTexture(textTextures[index]);

    textColor.r := 255;
    textColor.g := 255;
    textColor.b := 255;
    textColor.a := 255;

    textSurface := TTF_RenderText_Solid(font, PChar(AnsiString(text)), textColor);

    textTextures[index] := SDL_CreateTextureFromSurface(renderer, textSurface);
    
    SDL_FreeSurface(textSurface);

    SDL_QueryTexture(textTextures[index], nil, nil, @textRects[index].w, @textRects[index].h);

    textRects[index].x := xPos;
    textRects[index].y := yPos;

    if center then
    begin
        textRects[index].x := textRects[index].x - textRects[index].w div 2;
        textRects[index].y := textRects[index].y - textRects[index].h div 2;
    end;
end;

procedure toggleText();
begin
    for i := 0 to MAX_TEXTS - 1 do
        textsVisible[i] := not textsVisible[i];
end;

procedure boundCheck();
begin
    // PLAYER 1
    if player1Rect.y <= 0 then player1Rect.y := 0;
    if player1Rect.y >= 570 then player1Rect.y := 570;

    // PLAYER 2
    if player2Rect.y <= 0 then player2Rect.y := 0;
    if player2Rect.y >= 570 then player2Rect.y := 570;

    // BALL
    if ball.y <= 0 then ball.y := 0;
    if ball.y >= 570 then ball.y := 570;
end;

procedure update();
begin
    new(sdlEvent);
    while SDL_PollEvent(sdlEvent) <> 0 do
    begin
        case sdlEvent^.type_ of
            SDL_QUITEV: 
                Running := False;

            SDL_KEYUP:
                lock := false;
        end;
    end;

    SDL_PumpEvents;
    
    // EXIT BY PRESSING ESC
    if keyboardState[SDL_SCANCODE_ESCAPE] = 1 then
        Running := False;

    // W S
    if (state = game) and (keyboardState[SDL_SCANCODE_W] = 1) then
        player1Rect.y := player1Rect.y - PLAYER_SPEED;
    if (state = game) and (keyboardState[SDL_SCANCODE_S] = 1) then
        player1Rect.y := player1Rect.y + PLAYER_SPEED;

    // ARROW_UP ARROW_DOWN
    if keyboardState[SDL_SCANCODE_UP] = 1 then
    begin
        if state = start then
        begin
            if not lock then
            begin
                lowerOption := false;
                if lowerOption then
                    updateText(2, '>', WINDOW_WIDTH div 2 - 300, WINDOW_HEIGHT div 2 + 80, true)
                else
                    updateText(2, '>', WINDOW_WIDTH div 2 - 300, WINDOW_HEIGHT div 2 - 80, true);

                lock := true;
            end;
        end
        else
            // IF 1 PLAYER SELECTED, IT WONT BE POSSIBLE TO MOVE THE SECOND RECT
            if lowerOption then
                player2Rect.y := player2Rect.y - PLAYER_SPEED
            else
                // IMPLEMENT BOT MOVEMENT   
                Writeln('1 player selected');
    end;

    if keyboardState[SDL_SCANCODE_DOWN] = 1 then
    begin
        if state = start then
        begin
            if not lock then
            begin
                lowerOption := true;
                if lowerOption then
                    updateText(2, '>', WINDOW_WIDTH div 2 - 300, WINDOW_HEIGHT div 2 + 80, true)
                else
                    updateText(2, '>', WINDOW_WIDTH div 2 - 300, WINDOW_HEIGHT div 2 - 80, true);

                lock := true;
            end;
        end
        else
            // IF 1 PLAYER SELECTED, IT WONT BE POSSIBLE TO MOVE THE SECOND RECT
            if lowerOption then
                player2Rect.y := player2Rect.y + PLAYER_SPEED
            else
                // IMPLEMENT BOT MOVEMENT
                Writeln('1 player selected'); 
    end;

    // Handling Enter key to select an option
    if keyboardState[SDL_SCANCODE_RETURN] = 1 then
    begin
        if state = start then
        begin
            if lowerOption then
            begin
                //Two players
                Writeln('2 players');
            end
            else
            begin
                //One player
                Writeln('1 player');
            end;
            // CLEAN TEXT
            toggleText;

            state := game;
        end;
    end;

    boundCheck;
end;

procedure renderStart();
begin
    SDL_SetRenderDrawColor(renderer, 255, 255, 255, SDL_ALPHA_OPAQUE);
end;

procedure renderGame();
begin
    // RECT 
    SDL_SetRenderDrawColor(renderer, 255, 255, 255, SDL_ALPHA_OPAQUE);
    SDL_RenderFillRect(renderer, @ball);

    SDL_SetRenderDrawColor(renderer, 255, 255, 255, SDL_ALPHA_OPAQUE);
    SDL_RenderFillRect(renderer, @player1Rect);
    SDL_RenderFillRect(renderer, @player2Rect);

    SDL_SetRenderDrawColor(renderer, 0, 255, 0, SDL_ALPHA_OPAQUE);
    SDL_RenderFillRect(renderer, @border1Rect);
    SDL_RenderFillRect(renderer, @border2Rect);
end;

procedure render();
begin
    // BACKGROUND
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(renderer);

    case state of
        start: renderStart();
        game: renderGame();
    end;

    for i := 0 to MAX_TEXTS - 1 do
    begin
        if textsVisible[i] = true then
            SDL_RenderCopy(renderer, textTextures[i], nil, @textRects[i]);
    end;
    
    SDL_RenderPresent(renderer);
    SDL_Delay(16);
end;

begin
    if SDL_Init(SDL_INIT_VIDEO) < 0 then Exit;
    if TTF_Init() < 0 then Exit;
        
    window := SDL_CreateWindow(WINDOW_TITLE, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, WINDOW_WIDTH, WINDOW_HEIGHT, SDL_WINDOW_SHOWN);
    if window = nil then Halt;
        
    renderer := SDL_CreateRenderer(window, -1, 0);
    if renderer = nil then Halt;

    font := TTF_OpenFont('./res/PixelatedEleganceRegular-ovyAA.ttf', 50);
    if font = nil then Halt;

    toggleText;
    updateText(0, 'Um jogador', WINDOW_WIDTH div 2, WINDOW_HEIGHT div 2 - 80, true);
    updateText(1, 'Dois jogadores', WINDOW_WIDTH div 2, WINDOW_HEIGHT div 2 + 80, true);
    updateText(2, '>', WINDOW_WIDTH div 2 - 300, WINDOW_HEIGHT div 2 - 80, true);

    setRectangle(ball, BALL_SCALE, BALL_SCALE, WINDOW_WIDTH div 2, WINDOW_HEIGHT div 2);
    setRectangle(player1Rect, PLAYER_WIDTH, PLAYER_HEIGHT, 0 + OFFSET_BORDER, playerMiddle);
    setRectangle(player2Rect, PLAYER_WIDTH, PLAYER_HEIGHT, WINDOW_WIDTH - OFFSET_BORDER, playerMiddle);
    setRectangle(border1Rect, PLAYER_WIDTH, WINDOW_HEIGHT, 0, 0);
    setRectangle(border2Rect, PLAYER_WIDTH, WINDOW_HEIGHT, WINDOW_WIDTH - PLAYER_WIDTH, 0);

    keyboardState := SDL_GetKeyboardState(nil);
    Running := True;
    while Running do
    begin
        update();
        render();
    end;

    for i := 0 to MAX_TEXTS - 1 do    
        SDL_DestroyTexture(textTextures[i]);
    TTF_CloseFont(font);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    TTF_Quit;
    SDL_Quit;
end.