# NYT Demo App

## (New York Times Most Viewed Article)

A Flutter app showcasing a list of popular articles from [**New York Times**](https://www.nytimes.com/trending/).

So the application "Architect your Flutter project using BLoC pattern" is complete.

---

## Getting Started

### Requirement

Here are some things you need to prepare before this project setup:

1. Flutter SDK Stable (Latest Version) [Install](https://flutter.dev/docs/get-started/install)
2. Android Studio [Install](https://developer.android.com/studio)
3. Visual Studio Code (Optional) [Install](https://code.visualstudio.com/)
4. Extension **Dart** and **Flutter**:
   - **Intellij Platform** ([Dart](https://plugins.jetbrains.com/plugin/6351-dart), [Flutter](https://plugins.jetbrains.com/plugin/9212-flutter))
   - **Visual Studio Code** ([Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code), [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter))

### Setup

Here are the steps for setting up this Project:

**Step 1:**

In this step you need to download(cloning) the files from this repository to your local computer:

```bash
git clone https://github.com/mohdosman-dev/nyt-demo-app.git
```

Or

```bash
git clone git@github.com:mohdosman-dev/nyt-demo-app.git
```

**Step 2:**

The next step is to open the folder that has been downloaded / cloned into a cli application such as `bash`, `cmd`, `terminal` .

And then run this command to console:

```bash
flutter pub get
```

**Step 3:**

To run this code use command:

```bash
flutter run
```

**Step 4:**

To test the app use command:

```bash
flutter test
```

---

## Feature

- [✓] List most popular articles is specific section within specific period (1, 7, or 30 days).
- [✓] Refresh list articles with pull to refresh style.
- [✓] Go to detail news website.

## Technology

1. [Dio](https://pub.dev/packages/dio)<br />
   A powerful Http client for Dart, which supports interceptors, FormData, Request Cancellation, File Downloading, Timeout, etc.
2. [BLoC](https://pub.dev/packages/bloc)<br />
   Flutter widgets that make it easy to implement the BLoC design pattern.
3. [Intl](https://pub.dev/packages/intl)<br />
   Package providers internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.
4. [Url Launcher](https://pub.dev/packages/url_launcher)<br />
   Flutter plugin for launching a URL in the mobile platform. Supports iOS and Android.
5. [Cached Network Image](https://pub.dev/packages/cached_network_image)<br />
   Flutter library to load and cache network images. Can also be used with placeholder and error widgets.
6. [Get It](https://pub.dev/packages/git_it)<br />
   Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App.
7. [Dartz](https://pub.dev/packages/dartz)<br />
   Functional Programming in Dart. Purify your Dart code using efficient immutable data structures, monads, lenses and other FP tools.
8. [Equatable](https://pub.dev/packages/equatable)<br />
   An abstract class that helps to implement equality without needing to explicitly override == and hashCode.
9. [Mockito](https://pub.dev/packages/mockito)<br />
   A mock framework inspired by Mockito.
10. [Bloc Test](https://pub.dev/packages/bloc_test)<br />
    A testing library which makes it easy to test blocs.

---

## Folder structure

```
├── lib
│   ├── core
│   │   ├── helpers
│   │   │   └── dio_helper.dart
│   │   ├── strings
│   │   │   └── constants.dart
│   │   ├── theme
│   │   │   ├── app_colors.dart
│   │   │   └── app_theme.dart
│   │   ├── utils
│   │   │   └── string_extension.dart
│   │   ├── widgets
│   │   │   └── articles_list.dart
│   │   └── utils
│   │       └── response_utils.dart
│   ├── features
│   │   └── articles
│   │       ├── data
│   │       │   ├── datasources
│   │       │   │   └── articles_datasource.dart
│   │       │   ├── models
│   │       │   │   └── article.dart
│   │       │   └── repositories
│   │       │       └── article_repository.dart
│   │       ├── domain
│   │       │   ├── repositories
│   │       │   │   └── i_article_repository.dart
│   │       │   └── usescases
│   │       │       └── get_all_articles.dart
│   │       │
│   │       └── presentation
│   │           ├── bloc
│   │           │   └── articles
│   │           │       ├── article_bloc.dart
│   │           │       ├── article_events.dart
│   │           │       └── article_states.dart
│   │           └── pages
│   │               ├── article_details_page.dart
│   │               └── article_page.dart
│   │
│   └── main.dart
├── pubspec.lock
└── pubspec.yaml
```
