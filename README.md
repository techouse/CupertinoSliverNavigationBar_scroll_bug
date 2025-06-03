# CupertinoSliverNavigationBar Scroll Bug

This project is a minimal reproduction of a bug in Flutter's `CupertinoSliverNavigationBar` widget, as described in [Flutter issue #164458](https://github.com/flutter/flutter/issues/164458).

## Details

The bug manifests as a scroll issue where the navigation bar does not behave as expected when scrolling. The behavior varies by platform:

- **iOS & Web:** The screen becomes jumpy, but all buttons remain pressable.
- **Android:** The screen is not jumpy, but the buttons become unpressable.

## How to Reproduce

1. Run the app on your desired platform (iOS, Android, or Web).
2. The `main.dart` file sets the number of list items based on the platform to reliably trigger the bug:
   - **iOS:** 19 items
   - **Android:** 21 items
   - **Web:** 21 items (or resize the browser window to make the list extend past the viewport)
3. Scroll the list to observe the navigation bar and button behavior.

## Additional Notes

- Each list item contains a button that shows a SnackBar when pressed.
- You can toggle the `dense` and `visualDensity` properties in `main.dart` to see if the behavior changes.

## File Overview

- `lib/main.dart`: Contains the minimal reproduction code and platform-specific logic.

---

Feel free to open an issue or PR if you have suggestions or improvements.
