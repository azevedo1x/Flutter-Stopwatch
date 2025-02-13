# Stopwatch App

A Flutter stopwatch application built using Riverpod for state management. This app features an animated stopwatch display, start/pause/reset functionality, and an about page.

## Features
- Start, pause, and reset the stopwatch.
- Animated stopwatch UI with ticking hands.
- Uses Riverpod for state management.
- Responsive UI with Flutter's Material design.

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/azevedo1x/Flutter-Stopwatch.git
   cd Flutter-Stopwatch
   ```

2. Install dependencies:
   ```sh
   flutter pub get
   ```

3. Run the app:
   ```sh
   flutter run
   ```

## Project Structure

```
stopwatch/
│── lib/
│   ├── data/
│   │   ├── stopwatch_provider.dart # Riverpod state management
│   ├── domain/
│   │   ├── stopwatch_service.dart  # Stopwatch logic
│   ├── presentation/
│   │   ├── main.dart              # Entry point of the app
│   │   ├── views/
│   │   │   ├── home_view.dart      # Main stopwatch screen
│   │   │   ├── about_view.dart     # About page
│   ├── widgets/
│   │   ├── animated_stopwatch.dart # Stopwatch animation widget
│── pubspec.yaml                    # Project dependencies
```

## Dependencies
This project uses the following dependencies:
- `flutter_riverpod` - State management
- `flutter/material.dart` - UI components

## Usage

- **Start/Pause:** Tap the "Start" button to begin timing, and "Pause" to stop.
- **Reset:** Tap "Restart" to reset the stopwatch.
- **About:** Click the info button in the top left corner to view the about page.

## Developer Info
Developed by [Gabriel Azevedo](https://github.com/azevedo1x)

- **Version 1.0:** July 2023
- **Version 2.0:** February 2025