# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Flutter app ("base_flutter_app" in pubspec) using Dart SDK >=3.11.0. Targets iOS, Android, and web. Uses Firebase (Analytics, Crashlytics, Remote Config), Riverpod + Provider for state management, and go_router for navigation.

## Common Commands

```bash
# Run the app
flutter run

# Code generation (freezed, json_serializable)
just gen-code
# or directly: dart run build_runner build

# Run tests
just test                          # runs test/api/*
flutter test                       # all tests
flutter test test/some_test.dart   # single test

# Clean rebuild (iOS)
just clean-and-install

# Production builds
just build-ios-production
just build-android-production

# Lint
flutter analyze
```

## Architecture

Clean architecture with four layers under `lib/`:

- **`core/`** — Infrastructure: HTTP client (Dio-based `CHttpClient`), dependency injection (GetIt via `locator`), local storage, Firebase remote config, environment config, analytics, logging (`CustomLogger`)
- **`entity/`** — Data models using freezed + json_serializable. Core models include `ResultModel`, `ResponseWrapper`, `AppVersion`, `AppServiceStatus`
- **`data/`** — API clients and data source implementations (currently scaffolded, not populated)
- **`domain/`** — Repository interfaces and use cases (currently scaffolded, not populated)
- **`presentation/`** — UI layer: pages, widgets, routes (go_router), services (ThemeService)
- **`theme/`** — Design system: `AppTheme` foundation (color, typography, decorations), components (buttons, icons, images, indicators, lottie), light/dark theme definitions. Uses Pretendard font family.

## Key Patterns

- **Barrel exports**: Each directory has an `index.dart` that re-exports its contents. Import the barrel, not individual files.
- **DI**: `GetIt` configured in `lib/core/dependency_injection/dependency_injection.dart`. Register APIs → Repositories → Managers → Use cases.
- **Environment**: Config loaded from `.env` via `flutter_dotenv`. Endpoint configuration uses freezed models in `app_endpoint.dart`.
- **Routing**: `go_router` configured in `lib/presentation/route/custom_route.dart` with `RoutePath` enum for path definitions.
- **Code generation**: Run `just gen-code` after modifying any `@freezed` or `@JsonSerializable` annotated classes. Generated files use `.freezed.dart` and `.g.dart` suffixes.
- **Comments in Korean**: Codebase comments are written in Korean.
