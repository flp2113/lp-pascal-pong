program main;

uses SysUtils, SDL2, SDL2_ttf;

type
    windowState_t = (start, game, endgame);

const
    WINDOW_TITLE    = 'Pascal Pong';
    WINDOW_WIDTH    = 1280;
    WINDOW_HEIGHT   = 720;
    OFFSET_BORDER   = 100;
    PLAYER_WIDTH    = 15;
    PLAYER_HEIGHT   = 150;
    PLAYER_SPEED    = 7;
    BOT_SPEED       = 5;
    BALL_SCALE      = 10;
    MAX_TEXTS       = 3;
    MAX_SCORE       = 3;

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
    player1Score: integer = 0;
    player2Score: integer = 0;
    border1Rect: TSDL_Rect;
    border2Rect: TSDL_Rect;
    ball: TSDL_Rect;
    playerMiddle: integer = WINDOW_HEIGHT div 2 - PLAYER_HEIGHT div 2;
    state: windowState_t = start;
    lowerOption: boolean = false;
    lock: boolean = false;
    i: integer;
    ballDx: integer = 5;
    ballDy: integer = 5;

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

procedure updateScore();
begin
    updateText(0, IntToStr(player1Score), WINDOW_WIDTH div 2 - 25, WINDOW_HEIGHT div 2 - 200, true);
    updateText(1, IntToStr(player2Score), WINDOW_WIDTH div 2 + 25, WINDOW_HEIGHT div 2 - 200, true);
end;

procedure checkGoal();
begin
    if (ball.x <= 0) then
    begin
        Inc(player2Score);
        ball.x := WINDOW_WIDTH div 2;
        ball.y := WINDOW_HEIGHT div 2;
        ballDx := -5; 
        ballDy := 5;
        updateScore();
    end
    else if (ball.x >= WINDOW_WIDTH) then
    begin
        Inc(player1Score);
        ball.x := WINDOW_WIDTH div 2;
        ball.y := WINDOW_HEIGHT div 2;
        ballDx := 5;
        ballDy := 5;
        updateScore();
    end;
end;

procedure checkEndGame();
begin
    if (player1Score = MAX_SCORE) or (player2Score = MAX_SCORE) then
        state := endgame;
end;

procedure playerBoundCheck(var player: TSDL_Rect);
begin
    if (player.y <= 0) then player.y := 0;
    if (player.y >= 570) then player.y := 570;
end;

procedure ballWallCollision(var ball: TSDL_Rect);
begin
    if (ball.y <= 0) or (ball.y + ball.h >= WINDOW_HEIGHT) then
        ballDy := -ballDy;
end;

procedure ballPlayerCollision(player: TSDL_Rect);
begin
    if (ball.x + ball.w >= player.x) and
    (ball.x <= player.x + player.w) and
    (ball.y + ball.h >= player.y) and
    (ball.y <= player.y + player.h)
    then
    begin
        if (ball.y < player.y + player.h div 4) then 
            ballDy := -Abs(ballDy) 
        else if (ball.y > player.y + (3 * player.h) div 4) then 
            ballDy := Abs(ballDy);

        ballDx := -ballDx;
        ballDx := Round(ballDx * 1.1);
        ballDy := Round(ballDy * 1.1);
    end;
end;

procedure ballUpdate();
begin
    ballWallCollision(ball);
    ballPlayerCollision(player1Rect);
    ballPlayerCollision(player2Rect);
end;

procedure botMovement();
var
  targetY: integer;
begin
    targetY := ball.y;

    if player2Rect.y + PLAYER_HEIGHT div 2 > targetY then
        player2Rect.y := player2Rect.y - BOT_SPEED
    else if player2Rect.y + PLAYER_HEIGHT div 2 < targetY then
        player2Rect.y := player2Rect.y + BOT_SPEED;

    if Random(100) < 10 then
        player2Rect.y := player2Rect.y + (Random(2) - 1) * BOT_SPEED;
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

    // Start ball
    if state = game then
    begin
        ball.x := ball.x - ballDx;
        ball.y := ball.y + ballDy;
    end;
        
    SDL_PumpEvents;
    
    // Handling ESC
    if keyboardState[SDL_SCANCODE_ESCAPE] = 1 then
        Running := false;
        
    // W S
    if (state = game) and (keyboardState[SDL_SCANCODE_W] = 1) then
        player1Rect.y := player1Rect.y - PLAYER_SPEED;
    if (state = game) and (keyboardState[SDL_SCANCODE_S] = 1) then
        player1Rect.y := player1Rect.y + PLAYER_SPEED;

    // Arrow Up & Down
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
            if lowerOption then
                player2Rect.y := player2Rect.y - PLAYER_SPEED
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
            if lowerOption then
                player2Rect.y := player2Rect.y + PLAYER_SPEED
    end;

    // Handling ENTER key
    if keyboardState[SDL_SCANCODE_RETURN] = 1 then
    begin
        if state = start then
        begin
            // CLEAN TEXTS ARRAY
            toggleText;
            for i := 0 to MAX_TEXTS - 1 do
                SDL_DestroyTexture(textTextures[i]);

            // SHOW SCORES
            toggleText;
            updateText(0, '0', WINDOW_WIDTH div 2 - 25, WINDOW_HEIGHT div 2 - 200, true);
            updateText(1, '0', WINDOW_WIDTH div 2 + 25, WINDOW_HEIGHT div 2 - 200, true);

            state := game;
        end;
    end;

    // PLAYERS AND BALL UPDATE/CHECK
    if state = game then
    begin
        if not lowerOption then
            botMovement; 
        ballUpdate;
        playerBoundCheck(player1Rect);
        playerBoundCheck(player2Rect);
        checkGoal;
        checkEndGame;
    end;
end;

procedure renderStart();
begin
    SDL_SetRenderDrawColor(renderer, 255, 255, 255, SDL_ALPHA_OPAQUE);
end;

procedure renderEnd();
begin
    SDL_SetRenderDrawColor(renderer, 255, 255, 255, SDL_ALPHA_OPAQUE);

    for i := 0 to MAX_TEXTS - 1 do    
        SDL_DestroyTexture(textTextures[i]);

    if player1Score = MAX_SCORE then
        updateText(0, 'Jogador 1 venceu!', WINDOW_WIDTH div 2, WINDOW_HEIGHT div 2 - 80, true)
    else
        updateText(0, 'Jogador 2 venceu!', WINDOW_WIDTH div 2, WINDOW_HEIGHT div 2 - 80, true);

    updateText(1, 'Deseja jogar novamente?', WINDOW_WIDTH div 2, WINDOW_HEIGHT div 2 + 80, true);
    updateText(2, 'Pressione ESC para fechar', WINDOW_WIDTH div 2, WINDOW_HEIGHT div 2 + 160, true);
end;

procedure renderGame();
begin
    // RECT 
    SDL_SetRenderDrawColor(renderer, 255, 255, 255, SDL_ALPHA_OPAQUE);
    SDL_RenderFillRect(renderer, @ball);

    SDL_SetRenderDrawColor(renderer, 255, 255, 255, SDL_ALPHA_OPAQUE);
    SDL_RenderFillRect(renderer, @player1Rect);
    SDL_RenderFillRect(renderer, @player2Rect);

    SDL_SetRenderDrawColor(renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
    SDL_RenderFillRect(renderer, @border1Rect);
    SDL_RenderFillRect(renderer, @border2Rect);
end;

procedure render();
begin
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(renderer);

    case state of
        start: renderStart();
        game: renderGame();
        endgame: renderEnd();
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