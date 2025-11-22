# Material Color Schemes Example

This Flutter project demonstrates how easy it is to build beautiful apps using Material 3 Color Schemes with real-time theme switching capabilities.

<img src="https://github.com/user-attachments/assets/c7ff7e4e-7024-4898-ad54-5d496d5a9add" alt="color_schemes_demo" width="250">


## What This Project Demonstrates

- **Material 3 Color Schemes**: Complete implementation of Material Design 3 color system
- **Real-time Theme Switching**: Toggle between light and dark modes instantly
- **State Management**: Clean architecture using BLoC pattern for theme management
- **Extensibility**: Simple structure for adding multiple color schemes

## Project Structure

```
lib/
├── bloc/
│   ├── theme_bloc.dart    # BLoC managing theme state
│   ├── theme_event.dart   # Theme-related events
│   └── theme_state.dart   # Theme state definition
├── main.dart              # App entry point with BLoC integration
├── themes.dart            # Color scheme definitions
└── text_themes.dart       # Typography definitions
```

## Key Files

### `themes.dart`
Defines predefined color schemes and themes. Contains:
- **`PredefinedTheme`**: Enum linking light/dark color schemes with text themes
- **`PredefinedColorScheme`**: Material 3 color definitions for different modes

### `text_themes.dart`
Contains Material 3 typography scale definitions following the official type system.

### `bloc/theme_bloc.dart`
Handles theme switching logic:
- `ToggleThemeEvent`: Switches between light and dark mode
- `SetLightThemeEvent`: Forces light mode
- `SetDarkThemeEvent`: Forces dark mode

### `main.dart`
Integrates BLoC provider and applies themes to MaterialApp.

## How Theme Switching Works

1. **BLoC Provider** wraps the MaterialApp
2. **BlocBuilder** listens to ThemeState changes
3. User interaction triggers **ThemeEvent**
4. **ThemeBloc** processes event and emits new state
5. UI rebuilds automatically with new theme

## Adding a New Color Scheme

### Step 1: Define Color Schemes

Add new entries to `PredefinedColorScheme` enum in `themes.dart`:

```dart
enum PredefinedColorScheme {
  // ... existing schemes
  
  oceanLight(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006688),
      onPrimary: Color(0xffffffff),
      // ... define all required colors
    ),
  ),
  oceanDark(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff88ccff),
      onPrimary: Color(0xff003344),
      // ... define all required colors
    ),
  ),
}
```

### Step 2: Create Theme Entry

Add entry to `PredefinedTheme` enum:

```dart
enum PredefinedTheme {
  cozy(
    light: PredefinedColorScheme.cozyLight,
    dark: PredefinedColorScheme.cozyDark,
    textTheme: PredefinedTextTheme.common,
  ),
  ocean(  // New theme
    light: PredefinedColorScheme.oceanLight,
    dark: PredefinedColorScheme.oceanDark,
    textTheme: PredefinedTextTheme.common,
  );
  
  // ... rest of the code
}
```

### Step 3: Use the New Theme

Update `theme_bloc.dart` to use your new theme:

```dart
ThemeBloc()
    : super(ThemeState(
        lightTheme: PredefinedTheme.ocean.lightTheme,  // Changed
        darkTheme: PredefinedTheme.ocean.darkTheme,    // Changed
        themeMode: ThemeMode.light,
      )) {
  // ...
}
```

## Generating Color Schemes

Use [Material Theme Builder](https://material-foundation.github.io/material-theme-builder/) to generate complete Material 3 color schemes from a seed color.

## Benefits of This Approach

- **Type Safety**: Compile-time checking of color schemes
- **Easy Switching**: Change entire app theme by modifying one line
- **Consistent**: All Material 3 colors defined upfront
- **Maintainable**: Centralized theme definitions
- **Extensible**: Add unlimited color schemes without modifying existing code

## Dependencies

- `flutter_bloc`: State management for theme switching
- Material 3 components (built into Flutter)

## Usage Example

The demo app includes a toggle button in the AppBar:

```dart
IconButton(
  icon: Icon(state.isDarkMode ? Icons.light_mode : Icons.dark_mode),
  onPressed: () {
    context.read<ThemeBloc>().add(const ToggleThemeEvent());
  },
)
```

Theme colors are automatically applied throughout the widget tree:

```dart
backgroundColor: Theme.of(context).colorScheme.inversePrimary,
style: Theme.of(context).textTheme.headlineMedium,
```

## Learn More

- [Material Design 3](https://m3.material.io/)
- [Flutter Material 3](https://docs.flutter.dev/ui/design/material)
- [BLoC Pattern](https://bloclibrary.dev/)

