abstract class ThemeEvent {
  const ThemeEvent();
}

class ToggleThemeEvent extends ThemeEvent {
  const ToggleThemeEvent();
}

class SetLightThemeEvent extends ThemeEvent {
  const SetLightThemeEvent();
}

class SetDarkThemeEvent extends ThemeEvent {
  const SetDarkThemeEvent();
}

