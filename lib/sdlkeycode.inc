//from "sdl_keycode.h"

  {**
   *  The SDL virtual key representation.
   *
   *  Values of this type are used to represent keyboard keys using the current
   *  layout of the keyboard.  These values include Unicode values representing
   *  the unmodified character that would be generated by pressing the key, or
   *  an SDLK_* constant for those keys that do not generate characters.
   *
   *  A special exception is the number keys at the top of the keyboard which
   *  always map to SDLK_0...SDLK_9, regardless of layout.
   *}
type
  PPSDL_KeyCode = ^PSDL_KeyCode;
  PSDL_KeyCode = ^TSDL_KeyCode;
  TSDL_KeyCode = type cint32;

const
  SDLK_SCANCODE_MASK = 1 shl 30;
  //#define SDL_SCANCODE_TO_KEYCODE(X)  (X | SDLK_SCANCODE_MASK)
  //SDL2-for-Pascal: Not translated, see comment about this macro below.

  SDLK_UNKNOWN = TSDL_KeyCode(0);

  SDLK_RETURN = TSDL_KeyCode(#13);   // C: '\r'
  SDLK_ESCAPE = TSDL_KeyCode(#27);   // C: '\x1B'
  SDLK_BACKSPACE = TSDL_KeyCode(#8); // C: '\b'
  SDLK_TAB = TSDL_KeyCode(#9);       // C: '\t'
  SDLK_SPACE = TSDL_KeyCode(' ');
  SDLK_EXCLAIM = TSDL_KeyCode('!');
  SDLK_QUOTEDBL = TSDL_KeyCode('"');
  SDLK_HASH = TSDL_KeyCode('#');
  SDLK_PERCENT = TSDL_KeyCode('%');
  SDLK_DOLLAR = TSDL_KeyCode('$');
  SDLK_AMPERSAND = TSDL_KeyCode('&');
  SDLK_QUOTE = TSDL_KeyCode('''');
  SDLK_LEFTPAREN = TSDL_KeyCode('(');
  SDLK_RIGHTPAREN = TSDL_KeyCode(')');
  SDLK_ASTERISK = TSDL_KeyCode('*');
  SDLK_PLUS = TSDL_KeyCode('+');
  SDLK_COMMA = TSDL_KeyCode(',');
  SDLK_MINUS = TSDL_KeyCode('-');
  SDLK_PERIOD = TSDL_KeyCode('.');
  SDLK_SLASH = TSDL_KeyCode('/');
  SDLK_0 = TSDL_KeyCode('0');
  SDLK_1 = TSDL_KeyCode('1');
  SDLK_2 = TSDL_KeyCode('2');
  SDLK_3 = TSDL_KeyCode('3');
  SDLK_4 = TSDL_KeyCode('4');
  SDLK_5 = TSDL_KeyCode('5');
  SDLK_6 = TSDL_KeyCode('6');
  SDLK_7 = TSDL_KeyCode('7');
  SDLK_8 = TSDL_KeyCode('8');
  SDLK_9 = TSDL_KeyCode('9');
  SDLK_COLON = TSDL_KeyCode(':');
  SDLK_SEMICOLON = TSDL_KeyCode(';');
  SDLK_LESS = TSDL_KeyCode('<');
  SDLK_EQUALS = TSDL_KeyCode('=');
  SDLK_GREATER = TSDL_KeyCode('>');
  SDLK_QUESTION = TSDL_KeyCode('?');
  SDLK_AT = TSDL_KeyCode('@');
  {*
     Skip uppercase letters
   *}
  SDLK_LEFTBRACKET = TSDL_KeyCode('[');
  SDLK_BACKSLASH = TSDL_KeyCode('\');   // C: '\\'
  SDLK_RIGHTBRACKET = TSDL_KeyCode(']');
  SDLK_CARET = TSDL_KeyCode('^');
  SDLK_UNDERSCORE = TSDL_KeyCode('_');
  SDLK_BACKQUOTE = TSDL_KeyCode('`');
  SDLK_a = TSDL_KeyCode('a');
  SDLK_b = TSDL_KeyCode('b');
  SDLK_c = TSDL_KeyCode('c');
  SDLK_d = TSDL_KeyCode('d');
  SDLK_e = TSDL_KeyCode('e');
  SDLK_f = TSDL_KeyCode('f');
  SDLK_g = TSDL_KeyCode('g');
  SDLK_h = TSDL_KeyCode('h');
  SDLK_i = TSDL_KeyCode('i');
  SDLK_j = TSDL_KeyCode('j');
  SDLK_k = TSDL_KeyCode('k');
  SDLK_l = TSDL_KeyCode('l');
  SDLK_m = TSDL_KeyCode('m');
  SDLK_n = TSDL_KeyCode('n');
  SDLK_o = TSDL_KeyCode('o');
  SDLK_p = TSDL_KeyCode('p');
  SDLK_q = TSDL_KeyCode('q');
  SDLK_r = TSDL_KeyCode('r');
  SDLK_s = TSDL_KeyCode('s');
  SDLK_t = TSDL_KeyCode('t');
  SDLK_u = TSDL_KeyCode('u');
  SDLK_v = TSDL_KeyCode('v');
  SDLK_w = TSDL_KeyCode('w');
  SDLK_x = TSDL_KeyCode('x');
  SDLK_y = TSDL_KeyCode('y');
  SDLK_z = TSDL_KeyCode('z');

  {SDL2-for-Pascal: In C the following scancodes are or'd by a macro:
                    SDL_SCANCODE_TO_KEYCODE(X)  (X | SDLK_SCANCODE_MASK)

                    We convert the scancodes directly by:
                    TSDL_KeyCode(X or SDLK_SCANCODE_MASK); }

  SDLK_CAPSLOCK = TSDL_KeyCode(SDL_SCANCODE_CAPSLOCK or SDLK_SCANCODE_MASK);

  SDLK_F1 = TSDL_KeyCode(SDL_SCANCODE_F1 or SDLK_SCANCODE_MASK);
  SDLK_F2 = TSDL_KeyCode(SDL_SCANCODE_F2 or SDLK_SCANCODE_MASK);
  SDLK_F3 = TSDL_KeyCode(SDL_SCANCODE_F3 or SDLK_SCANCODE_MASK);
  SDLK_F4 = TSDL_KeyCode(SDL_SCANCODE_F4 or SDLK_SCANCODE_MASK);
  SDLK_F5 = TSDL_KeyCode(SDL_SCANCODE_F5 or SDLK_SCANCODE_MASK);
  SDLK_F6 = TSDL_KeyCode(SDL_SCANCODE_F6 or SDLK_SCANCODE_MASK);
  SDLK_F7 = TSDL_KeyCode(SDL_SCANCODE_F7 or SDLK_SCANCODE_MASK);
  SDLK_F8 = TSDL_KeyCode(SDL_SCANCODE_F8 or SDLK_SCANCODE_MASK);
  SDLK_F9 = TSDL_KeyCode(SDL_SCANCODE_F9 or SDLK_SCANCODE_MASK);
  SDLK_F10 = TSDL_KeyCode(SDL_SCANCODE_F10 or SDLK_SCANCODE_MASK);
  SDLK_F11 = TSDL_KeyCode(SDL_SCANCODE_F11 or SDLK_SCANCODE_MASK);
  SDLK_F12 = TSDL_KeyCode(SDL_SCANCODE_F12 or SDLK_SCANCODE_MASK);

  SDLK_PRINTSCREEN = TSDL_KeyCode(SDL_SCANCODE_PRINTSCREEN or SDLK_SCANCODE_MASK);
  SDLK_SCROLLLOCK = TSDL_KeyCode(SDL_SCANCODE_SCROLLLOCK or SDLK_SCANCODE_MASK);
  SDLK_PAUSE = TSDL_KeyCode(SDL_SCANCODE_PAUSE or SDLK_SCANCODE_MASK);
  SDLK_INSERT = TSDL_KeyCode(SDL_SCANCODE_INSERT or SDLK_SCANCODE_MASK);
  SDLK_HOME = TSDL_KeyCode(SDL_SCANCODE_HOME or SDLK_SCANCODE_MASK);
  SDLK_PAGEUP = TSDL_KeyCode(SDL_SCANCODE_PAGEUP or SDLK_SCANCODE_MASK);
  SDLK_DELETE = TSDL_KeyCode(#127); // C: '\x7F'
  SDLK_END = TSDL_KeyCode(SDL_SCANCODE_END or SDLK_SCANCODE_MASK);
  SDLK_PAGEDOWN = TSDL_KeyCode(SDL_SCANCODE_PAGEDOWN or SDLK_SCANCODE_MASK);
  SDLK_RIGHT = TSDL_KeyCode(SDL_SCANCODE_RIGHT or SDLK_SCANCODE_MASK);
  SDLK_LEFT = TSDL_KeyCode(SDL_SCANCODE_LEFT or SDLK_SCANCODE_MASK);
  SDLK_DOWN = TSDL_KeyCode(SDL_SCANCODE_DOWN or SDLK_SCANCODE_MASK);
  SDLK_UP = TSDL_KeyCode(SDL_SCANCODE_UP or SDLK_SCANCODE_MASK);

  SDLK_NUMLOCKCLEAR = TSDL_KeyCode(SDL_SCANCODE_NUMLOCKCLEAR or SDLK_SCANCODE_MASK);
  SDLK_KP_DIVIDE = TSDL_KeyCode(SDL_SCANCODE_KP_DIVIDE or SDLK_SCANCODE_MASK);
  SDLK_KP_MULTIPLY = TSDL_KeyCode(SDL_SCANCODE_KP_MULTIPLY or SDLK_SCANCODE_MASK);
  SDLK_KP_MINUS = TSDL_KeyCode(SDL_SCANCODE_KP_MINUS or SDLK_SCANCODE_MASK);
  SDLK_KP_PLUS = TSDL_KeyCode(SDL_SCANCODE_KP_PLUS or SDLK_SCANCODE_MASK);
  SDLK_KP_ENTER = TSDL_KeyCode(SDL_SCANCODE_KP_ENTER or SDLK_SCANCODE_MASK);
  SDLK_KP_1 = TSDL_KeyCode(SDL_SCANCODE_KP_1 or SDLK_SCANCODE_MASK);
  SDLK_KP_2 = TSDL_KeyCode(SDL_SCANCODE_KP_2 or SDLK_SCANCODE_MASK);
  SDLK_KP_3 = TSDL_KeyCode(SDL_SCANCODE_KP_3 or SDLK_SCANCODE_MASK);
  SDLK_KP_4 = TSDL_KeyCode(SDL_SCANCODE_KP_4 or SDLK_SCANCODE_MASK);
  SDLK_KP_5 = TSDL_KeyCode(SDL_SCANCODE_KP_5 or SDLK_SCANCODE_MASK);
  SDLK_KP_6 = TSDL_KeyCode(SDL_SCANCODE_KP_6 or SDLK_SCANCODE_MASK);
  SDLK_KP_7 = TSDL_KeyCode(SDL_SCANCODE_KP_7 or SDLK_SCANCODE_MASK);
  SDLK_KP_8 = TSDL_KeyCode(SDL_SCANCODE_KP_8 or SDLK_SCANCODE_MASK);
  SDLK_KP_9 = TSDL_KeyCode(SDL_SCANCODE_KP_9 or SDLK_SCANCODE_MASK);
  SDLK_KP_0 = TSDL_KeyCode(SDL_SCANCODE_KP_0 or SDLK_SCANCODE_MASK);
  SDLK_KP_PERIOD = TSDL_KeyCode(SDL_SCANCODE_KP_PERIOD or SDLK_SCANCODE_MASK);

  SDLK_APPLICATION = TSDL_KeyCode(SDL_SCANCODE_APPLICATION or SDLK_SCANCODE_MASK);
  SDLK_POWER = TSDL_KeyCode(SDL_SCANCODE_POWER or SDLK_SCANCODE_MASK);
  SDLK_KP_EQUALS = TSDL_KeyCode(SDL_SCANCODE_KP_EQUALS or SDLK_SCANCODE_MASK);
  SDLK_F13 = TSDL_KeyCode(SDL_SCANCODE_F13 or SDLK_SCANCODE_MASK);
  SDLK_F14 = TSDL_KeyCode(SDL_SCANCODE_F14 or SDLK_SCANCODE_MASK);
  SDLK_F15 = TSDL_KeyCode(SDL_SCANCODE_F15 or SDLK_SCANCODE_MASK);
  SDLK_F16 = TSDL_KeyCode(SDL_SCANCODE_F16 or SDLK_SCANCODE_MASK);
  SDLK_F17 = TSDL_KeyCode(SDL_SCANCODE_F17 or SDLK_SCANCODE_MASK);
  SDLK_F18 = TSDL_KeyCode(SDL_SCANCODE_F18 or SDLK_SCANCODE_MASK);
  SDLK_F19 = TSDL_KeyCode(SDL_SCANCODE_F19 or SDLK_SCANCODE_MASK);
  SDLK_F20 = TSDL_KeyCode(SDL_SCANCODE_F20 or SDLK_SCANCODE_MASK);
  SDLK_F21 = TSDL_KeyCode(SDL_SCANCODE_F21 or SDLK_SCANCODE_MASK);
  SDLK_F22 = TSDL_KeyCode(SDL_SCANCODE_F22 or SDLK_SCANCODE_MASK);
  SDLK_F23 = TSDL_KeyCode(SDL_SCANCODE_F23 or SDLK_SCANCODE_MASK);
  SDLK_F24 = TSDL_KeyCode(SDL_SCANCODE_F24 or SDLK_SCANCODE_MASK);
  SDLK_EXECUTE = TSDL_KeyCode(SDL_SCANCODE_EXECUTE or SDLK_SCANCODE_MASK);
  SDLK_HELP = TSDL_KeyCode(SDL_SCANCODE_HELP or SDLK_SCANCODE_MASK);
  SDLK_MENU = TSDL_KeyCode(SDL_SCANCODE_MENU or SDLK_SCANCODE_MASK);
  SDLK_SELECT = TSDL_KeyCode(SDL_SCANCODE_SELECT or SDLK_SCANCODE_MASK);
  SDLK_STOP = TSDL_KeyCode(SDL_SCANCODE_STOP or SDLK_SCANCODE_MASK);
  SDLK_AGAIN = TSDL_KeyCode(SDL_SCANCODE_AGAIN or SDLK_SCANCODE_MASK);
  SDLK_UNDO = TSDL_KeyCode(SDL_SCANCODE_UNDO or SDLK_SCANCODE_MASK);
  SDLK_CUT = TSDL_KeyCode(SDL_SCANCODE_CUT or SDLK_SCANCODE_MASK);
  SDLK_COPY = TSDL_KeyCode(SDL_SCANCODE_COPY or SDLK_SCANCODE_MASK);
  SDLK_PASTE = TSDL_KeyCode(SDL_SCANCODE_PASTE or SDLK_SCANCODE_MASK);
  SDLK_FIND = TSDL_KeyCode(SDL_SCANCODE_FIND or SDLK_SCANCODE_MASK);
  SDLK_MUTE = TSDL_KeyCode(SDL_SCANCODE_MUTE or SDLK_SCANCODE_MASK);
  SDLK_VOLUMEUP = TSDL_KeyCode(SDL_SCANCODE_VOLUMEUP or SDLK_SCANCODE_MASK);
  SDLK_VOLUMEDOWN = TSDL_KeyCode(SDL_SCANCODE_VOLUMEDOWN or SDLK_SCANCODE_MASK);
  SDLK_KP_COMMA = TSDL_KeyCode(SDL_SCANCODE_KP_COMMA or SDLK_SCANCODE_MASK);
  SDLK_KP_EQUALSAS400 = TSDL_KeyCode(SDL_SCANCODE_KP_EQUALSAS400 or SDLK_SCANCODE_MASK);

  SDLK_ALTERASE = TSDL_KeyCode(SDL_SCANCODE_ALTERASE or SDLK_SCANCODE_MASK);
  SDLK_SYSREQ = TSDL_KeyCode(SDL_SCANCODE_SYSREQ or SDLK_SCANCODE_MASK);
  SDLK_CANCEL = TSDL_KeyCode(SDL_SCANCODE_CANCEL or SDLK_SCANCODE_MASK);
  SDLK_CLEAR = TSDL_KeyCode(SDL_SCANCODE_CLEAR or SDLK_SCANCODE_MASK);
  SDLK_PRIOR = TSDL_KeyCode(SDL_SCANCODE_PRIOR or SDLK_SCANCODE_MASK);
  SDLK_RETURN2 = TSDL_KeyCode(SDL_SCANCODE_RETURN2 or SDLK_SCANCODE_MASK);
  SDLK_SEPARATOR = TSDL_KeyCode(SDL_SCANCODE_SEPARATOR or SDLK_SCANCODE_MASK);
  SDLK_OUT = TSDL_KeyCode(SDL_SCANCODE_OUT or SDLK_SCANCODE_MASK);
  SDLK_OPER = TSDL_KeyCode(SDL_SCANCODE_OPER or SDLK_SCANCODE_MASK);
  SDLK_CLEARAGAIN = TSDL_KeyCode(SDL_SCANCODE_CLEARAGAIN or SDLK_SCANCODE_MASK);
  SDLK_CRSEL = TSDL_KeyCode(SDL_SCANCODE_CRSEL or SDLK_SCANCODE_MASK);
  SDLK_EXSEL = TSDL_KeyCode(SDL_SCANCODE_EXSEL or SDLK_SCANCODE_MASK);

  SDLK_KP_00 = TSDL_KeyCode(SDL_SCANCODE_KP_00 or SDLK_SCANCODE_MASK);
  SDLK_KP_000 = TSDL_KeyCode(SDL_SCANCODE_KP_000 or SDLK_SCANCODE_MASK);
  SDLK_THOUSANDSSEPARATOR = TSDL_KeyCode(SDL_SCANCODE_THOUSANDSSEPARATOR or SDLK_SCANCODE_MASK);
  SDLK_DECIMALSEPARATOR = TSDL_KeyCode(SDL_SCANCODE_DECIMALSEPARATOR or SDLK_SCANCODE_MASK);
  SDLK_CURRENCYUNIT = TSDL_KeyCode(SDL_SCANCODE_CURRENCYUNIT or SDLK_SCANCODE_MASK);
  SDLK_CURRENCYSUBUNIT = TSDL_KeyCode(SDL_SCANCODE_CURRENCYSUBUNIT or SDLK_SCANCODE_MASK);
  SDLK_KP_LEFTPAREN = TSDL_KeyCode(SDL_SCANCODE_KP_LEFTPAREN or SDLK_SCANCODE_MASK);
  SDLK_KP_RIGHTPAREN = TSDL_KeyCode(SDL_SCANCODE_KP_RIGHTPAREN or SDLK_SCANCODE_MASK);
  SDLK_KP_LEFTBRACE = TSDL_KeyCode(SDL_SCANCODE_KP_LEFTBRACE or SDLK_SCANCODE_MASK);
  SDLK_KP_RIGHTBRACE = TSDL_KeyCode(SDL_SCANCODE_KP_RIGHTBRACE or SDLK_SCANCODE_MASK);
  SDLK_KP_TAB = TSDL_KeyCode(SDL_SCANCODE_KP_TAB or SDLK_SCANCODE_MASK);
  SDLK_KP_BACKSPACE = TSDL_KeyCode(SDL_SCANCODE_KP_BACKSPACE or SDLK_SCANCODE_MASK);
  SDLK_KP_A = TSDL_KeyCode(SDL_SCANCODE_KP_A or SDLK_SCANCODE_MASK);
  SDLK_KP_B = TSDL_KeyCode(SDL_SCANCODE_KP_B or SDLK_SCANCODE_MASK);
  SDLK_KP_C = TSDL_KeyCode(SDL_SCANCODE_KP_C or SDLK_SCANCODE_MASK);
  SDLK_KP_D = TSDL_KeyCode(SDL_SCANCODE_KP_D or SDLK_SCANCODE_MASK);
  SDLK_KP_E = TSDL_KeyCode(SDL_SCANCODE_KP_E or SDLK_SCANCODE_MASK);
  SDLK_KP_F = TSDL_KeyCode(SDL_SCANCODE_KP_F or SDLK_SCANCODE_MASK);
  SDLK_KP_XOR = TSDL_KeyCode(SDL_SCANCODE_KP_XOR or SDLK_SCANCODE_MASK);
  SDLK_KP_POWER = TSDL_KeyCode(SDL_SCANCODE_KP_POWER or SDLK_SCANCODE_MASK);
  SDLK_KP_PERCENT = TSDL_KeyCode(SDL_SCANCODE_KP_PERCENT or SDLK_SCANCODE_MASK);
  SDLK_KP_LESS = TSDL_KeyCode(SDL_SCANCODE_KP_LESS or SDLK_SCANCODE_MASK);
  SDLK_KP_GREATER = TSDL_KeyCode(SDL_SCANCODE_KP_GREATER or SDLK_SCANCODE_MASK);
  SDLK_KP_AMPERSAND = TSDL_KeyCode(SDL_SCANCODE_KP_AMPERSAND or SDLK_SCANCODE_MASK);
  SDLK_KP_DBLAMPERSAND = TSDL_KeyCode(SDL_SCANCODE_KP_DBLAMPERSAND or SDLK_SCANCODE_MASK);
  SDLK_KP_VERTICALBAR = TSDL_KeyCode(SDL_SCANCODE_KP_VERTICALBAR or SDLK_SCANCODE_MASK);
  SDLK_KP_DBLVERTICALBAR = TSDL_KeyCode(SDL_SCANCODE_KP_DBLVERTICALBAR or SDLK_SCANCODE_MASK);
  SDLK_KP_COLON = TSDL_KeyCode(SDL_SCANCODE_KP_COLON or SDLK_SCANCODE_MASK);
  SDLK_KP_HASH = TSDL_KeyCode(SDL_SCANCODE_KP_HASH or SDLK_SCANCODE_MASK);
  SDLK_KP_SPACE = TSDL_KeyCode(SDL_SCANCODE_KP_SPACE or SDLK_SCANCODE_MASK);
  SDLK_KP_AT = TSDL_KeyCode(SDL_SCANCODE_KP_AT or SDLK_SCANCODE_MASK);
  SDLK_KP_EXCLAM = TSDL_KeyCode(SDL_SCANCODE_KP_EXCLAM or SDLK_SCANCODE_MASK);
  SDLK_KP_MEMSTORE = TSDL_KeyCode(SDL_SCANCODE_KP_MEMSTORE or SDLK_SCANCODE_MASK);
  SDLK_KP_MEMRECALL = TSDL_KeyCode(SDL_SCANCODE_KP_MEMRECALL or SDLK_SCANCODE_MASK);
  SDLK_KP_MEMCLEAR = TSDL_KeyCode(SDL_SCANCODE_KP_MEMCLEAR or SDLK_SCANCODE_MASK);
  SDLK_KP_MEMADD = TSDL_KeyCode(SDL_SCANCODE_KP_MEMADD or SDLK_SCANCODE_MASK);
  SDLK_KP_MEMSUBTRACT = TSDL_KeyCode(SDL_SCANCODE_KP_MEMSUBTRACT or SDLK_SCANCODE_MASK);
  SDLK_KP_MEMMULTIPLY = TSDL_KeyCode(SDL_SCANCODE_KP_MEMMULTIPLY or SDLK_SCANCODE_MASK);
  SDLK_KP_MEMDIVIDE = TSDL_KeyCode(SDL_SCANCODE_KP_MEMDIVIDE or SDLK_SCANCODE_MASK);
  SDLK_KP_PLUSMINUS = TSDL_KeyCode(SDL_SCANCODE_KP_PLUSMINUS or SDLK_SCANCODE_MASK);
  SDLK_KP_CLEAR = TSDL_KeyCode(SDL_SCANCODE_KP_CLEAR or SDLK_SCANCODE_MASK);
  SDLK_KP_CLEARENTRY = TSDL_KeyCode(SDL_SCANCODE_KP_CLEARENTRY or SDLK_SCANCODE_MASK);
  SDLK_KP_BINARY = TSDL_KeyCode(SDL_SCANCODE_KP_BINARY or SDLK_SCANCODE_MASK);
  SDLK_KP_OCTAL = TSDL_KeyCode(SDL_SCANCODE_KP_OCTAL or SDLK_SCANCODE_MASK);
  SDLK_KP_DECIMAL = TSDL_KeyCode(SDL_SCANCODE_KP_DECIMAL or SDLK_SCANCODE_MASK);
  SDLK_KP_HEXADECIMAL = TSDL_KeyCode(SDL_SCANCODE_KP_HEXADECIMAL or SDLK_SCANCODE_MASK);

  SDLK_LCTRL = TSDL_KeyCode(SDL_SCANCODE_LCTRL or SDLK_SCANCODE_MASK);
  SDLK_LSHIFT = TSDL_KeyCode(SDL_SCANCODE_LSHIFT or SDLK_SCANCODE_MASK);
  SDLK_LALT = TSDL_KeyCode(SDL_SCANCODE_LALT or SDLK_SCANCODE_MASK);
  SDLK_LGUI = TSDL_KeyCode(SDL_SCANCODE_LGUI or SDLK_SCANCODE_MASK);
  SDLK_RCTRL = TSDL_KeyCode(SDL_SCANCODE_RCTRL or SDLK_SCANCODE_MASK);
  SDLK_RSHIFT = TSDL_KeyCode(SDL_SCANCODE_RSHIFT or SDLK_SCANCODE_MASK);
  SDLK_RALT = TSDL_KeyCode(SDL_SCANCODE_RALT or SDLK_SCANCODE_MASK);
  SDLK_RGUI = TSDL_KeyCode(SDL_SCANCODE_RGUI or SDLK_SCANCODE_MASK);

  SDLK_MODE = TSDL_KeyCode(SDL_SCANCODE_MODE or SDLK_SCANCODE_MASK);

  SDLK_AUDIONEXT = TSDL_KeyCode(SDL_SCANCODE_AUDIONEXT or SDLK_SCANCODE_MASK);
  SDLK_AUDIOPREV = TSDL_KeyCode(SDL_SCANCODE_AUDIOPREV or SDLK_SCANCODE_MASK);
  SDLK_AUDIOSTOP = TSDL_KeyCode(SDL_SCANCODE_AUDIOSTOP or SDLK_SCANCODE_MASK);
  SDLK_AUDIOPLAY = TSDL_KeyCode(SDL_SCANCODE_AUDIOPLAY or SDLK_SCANCODE_MASK);
  SDLK_AUDIOMUTE = TSDL_KeyCode(SDL_SCANCODE_AUDIOMUTE or SDLK_SCANCODE_MASK);
  SDLK_MEDIASELECT = TSDL_KeyCode(SDL_SCANCODE_MEDIASELECT or SDLK_SCANCODE_MASK);
  SDLK_WWW = TSDL_KeyCode(SDL_SCANCODE_WWW or SDLK_SCANCODE_MASK);
  SDLK_MAIL = TSDL_KeyCode(SDL_SCANCODE_MAIL or SDLK_SCANCODE_MASK);
  SDLK_CALCULATOR = TSDL_KeyCode(SDL_SCANCODE_CALCULATOR or SDLK_SCANCODE_MASK);
  SDLK_COMPUTER = TSDL_KeyCode(SDL_SCANCODE_COMPUTER or SDLK_SCANCODE_MASK);
  SDLK_AC_SEARCH = TSDL_KeyCode(SDL_SCANCODE_AC_SEARCH or SDLK_SCANCODE_MASK);
  SDLK_AC_HOME = TSDL_KeyCode(SDL_SCANCODE_AC_HOME or SDLK_SCANCODE_MASK);
  SDLK_AC_BACK = TSDL_KeyCode(SDL_SCANCODE_AC_BACK or SDLK_SCANCODE_MASK);
  SDLK_AC_FORWARD = TSDL_KeyCode(SDL_SCANCODE_AC_FORWARD or SDLK_SCANCODE_MASK);
  SDLK_AC_STOP = TSDL_KeyCode(SDL_SCANCODE_AC_STOP or SDLK_SCANCODE_MASK);
  SDLK_AC_REFRESH = TSDL_KeyCode(SDL_SCANCODE_AC_REFRESH or SDLK_SCANCODE_MASK);
  SDLK_AC_BOOKMARKS = TSDL_KeyCode(SDL_SCANCODE_AC_BOOKMARKS or SDLK_SCANCODE_MASK);

  SDLK_BRIGHTNESSDOWN = TSDL_KeyCode(SDL_SCANCODE_BRIGHTNESSDOWN or SDLK_SCANCODE_MASK);
  SDLK_BRIGHTNESSUP = TSDL_KeyCode(SDL_SCANCODE_BRIGHTNESSUP or SDLK_SCANCODE_MASK);
  SDLK_DISPLAYSWITCH = TSDL_KeyCode(SDL_SCANCODE_DISPLAYSWITCH or SDLK_SCANCODE_MASK);
  SDLK_KBDILLUMTOGGLE = TSDL_KeyCode(SDL_SCANCODE_KBDILLUMTOGGLE or SDLK_SCANCODE_MASK);
  SDLK_KBDILLUMDOWN = TSDL_KeyCode(SDL_SCANCODE_KBDILLUMDOWN or SDLK_SCANCODE_MASK);
  SDLK_KBDILLUMUP = TSDL_KeyCode(SDL_SCANCODE_KBDILLUMUP or SDLK_SCANCODE_MASK);
  SDLK_EJECT = TSDL_KeyCode(SDL_SCANCODE_EJECT or SDLK_SCANCODE_MASK);
  SDLK_SLEEP = TSDL_KeyCode(SDL_SCANCODE_SLEEP or SDLK_SCANCODE_MASK);
  SDLK_APP1 = TSDL_KeyCode(SDL_SCANCODE_APP1 or SDLK_SCANCODE_MASK);
  SDLK_APP2 = TSDL_KeyCode(SDL_SCANCODE_APP2 or SDLK_SCANCODE_MASK);

  SDLK_AUDIOREWIND = TSDL_KeyCode(SDL_SCANCODE_AUDIOREWIND or SDLK_SCANCODE_MASK);
  SDLK_AUDIOFASTFORWARD = TSDL_KeyCode(SDL_SCANCODE_AUDIOFASTFORWARD or SDLK_SCANCODE_MASK);

  SDLK_SOFTLEFT = TSDL_KeyCode(SDL_SCANCODE_SOFTLEFT or SDLK_SCANCODE_MASK);
  SDLK_SOFTRIGHT = TSDL_KeyCode(SDL_SCANCODE_SOFTRIGHT or SDLK_SCANCODE_MASK);
  SDLK_CALL = TSDL_KeyCode(SDL_SCANCODE_CALL or SDLK_SCANCODE_MASK);
  SDLK_ENDCALL = TSDL_KeyCode(SDL_SCANCODE_ENDCALL or SDLK_SCANCODE_MASK);

  {**
   *  Enumeration of valid key mods (possibly OR'd together).
   *}
type
  PPSDL_KeyMod = ^PSDL_KeyMod;
  PSDL_KeyMod = ^TSDL_KeyMod;
  TSDL_KeyMod = type cint;

const
  KMOD_NONE = TSDL_KeyMod($0000);
  KMOD_LSHIFT = TSDL_KeyMod($0001);
  KMOD_RSHIFT = TSDL_KeyMod($0002);
  KMOD_LCTRL = TSDL_KeyMod($0040);
  KMOD_RCTRL = TSDL_KeyMod($0080);
  KMOD_LALT = TSDL_KeyMod($0100);
  KMOD_RALT = TSDL_KeyMod($0200);
  KMOD_LGUI = TSDL_KeyMod($0400);
  KMOD_RGUI = TSDL_KeyMod($0800);
  KMOD_NUM = TSDL_KeyMod($1000);
  KMOD_CAPS = TSDL_KeyMod($2000);
  KMOD_MODE = TSDL_KeyMod($4000);
  KMOD_SCROLL = TSDL_KeyMod($8000);

  KMOD_CTRL  = KMOD_LCTRL  or KMOD_RCTRL;
  KMOD_SHIFT = KMOD_LSHIFT or KMOD_RSHIFT;
  KMOD_ALT   = KMOD_LALT   or KMOD_RALT;
  KMOD_GUI   = KMOD_LGUI   or KMOD_RGUI;

  KMOD_RESERVED = KMOD_SCROLL; {* This is for source-level compatibility with SDL 2.0.0. *}
