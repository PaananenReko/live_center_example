# Live Center WebView Embed Issue (Flutter)

This repository contains a minimal example demonstrating an issue with embedding Live Center content in a Flutter WebView. The issue occurs when the WebView is nested inside a scrollable widget (such as a ListView), causing the embedded content to be cut off at a certain point. However, when the WebView is the only widget on the screen, it renders correctly.

## Problem Description
- When embedding Live Center content inside a WebView that is placed in a ListView, the rendering gets cut off.
- When the same WebView is displayed as the only widget on the screen, it renders correctly.
- A toggle switch is available in the top-right corner of the UI, allowing users to switch between the ListView mode and the single WebView mode for comparison.
- This issue occurs on Android devices, and it is suggested to test on a physical device for accurate results.

## How to Run

1. Clone this repository:
```
git clone https://github.com/PaananenReko/live_center_example.git
cd live_center_example
```
2. Ensure you have Flutter installed. If not, install it from [flutter.dev](https://flutter.dev/).
3. Run `flutter pub` get to fetch dependencies.

Run the app on an emulator or physical device:
```
flutter run
```

## Expected Behavior

- In Single WebView Mode, the Live Center content should render correctly without being cut off.
- In ListView Mode, the Live Center content may be truncated at a certain point, demonstrating the issue.
