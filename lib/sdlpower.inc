// based on "sdl_power.h" (2.0.14)

{**
 *  \file SDL_power.h
 *
 *  Header for the SDL power management routines.
 *}

  {**
   *  The basic state for the system's power supply.
   *}
type
  PPSDL_PowerState = ^PSDL_PowerState;
  PSDL_PowerState = ^TSDL_PowerState;
  TSDL_PowerState = (SDL_POWERSTATE_UNKNOWN,      {**< cannot determine power status *}
                     SDL_POWERSTATE_ON_BATTERY,   {**< Not plugged in, running on the battery *}
                     SDL_POWERSTATE_NO_BATTERY,   {**< Plugged in, no battery available *}
                     SDL_POWERSTATE_CHARGING,     {**< Plugged in, charging battery *}
                     SDL_POWERSTATE_CHARGED);     {**< Plugged in, battery charged *}

  {**
   *  \brief Get the current power supply details.
   *
   *  \param secs Seconds of battery life left. You can pass a NULL here if
   *              you don't care. Will return -1 if we can't determine a
   *              value, or we're not running on a battery.
   *
   *  \param pct Percentage of battery life left, between 0 and 100. You can
   *             pass a NULL here if you don't care. Will return -1 if we
   *             can't determine a value, or we're not running on a battery.
   *
   *  \return The state of the battery (if any).
   *}
function SDL_GetPowerInfo(secs: pcint; pct: pcint): TSDL_PowerState; cdecl;
  external SDL_LibName {$IFDEF DELPHI} {$IFDEF MACOS} name '_SDL_GetPowerInfo' {$ENDIF} {$ENDIF};
