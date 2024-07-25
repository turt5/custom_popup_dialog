# Custom Popup Dialog

`custom_popup_dialog` is a Flutter package that provides a customizable dialog template. This package allows you to create beautiful and customizable dialog boxes with optional Lottie animations, background blur effects, and more.

## Features

- Customizable dialog with Lottie animations
- Optional background blur effect or darkened background
- Customizable button text and colors
- Easy to integrate into any Flutter application

## Getting Started

### Installation

Add `custom_popup_dialog` to your `pubspec.yaml` file:

```yaml
dependencies:
  custom_popup_dialog: ^0.0.1
```

### Install the dependencies:

```sh
flutter pub get
```

### Usage
Here's an example of how to use the CustomDialog widget in your Flutter application:


``` dart
import 'package:flutter/material.dart';
import 'package:custom_popup_dialog/custom_popup_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void showDialogTemplate(BuildContext context, String? animationPath, String message, {bool blurBackground = true}) {
    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        message: message,
        animationWidth: 120,
        animationHeight: 120,
        headerAnimation: animationPath,
        btnText: 'Continue',
        bgColor: Colors.white,
        textColor: Colors.black,
        btnColor: Colors.blue,
        btnTextColor: Colors.white,
        blurBackground: blurBackground,
        alternativeBgColor: Colors.black.withOpacity(0.7),
        onBtnPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Custom Alert Dialog',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              bgColor: Colors.green,
              fgColor: Colors.white,
              text: 'Show Success Dialog',
              onClick: () {
                showDialogTemplate(context, 'assets/lottie/success.json', 'Operation Successful!', blurBackground: true);
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              bgColor: Colors.red,
              fgColor: Colors.white,
              text: 'Show Error Dialog',
              onClick: () {
                showDialogTemplate(context, 'assets/lottie/error.json', 'An error occurred!', blurBackground: false);
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              bgColor: Colors.orange,
              fgColor: Colors.white,
              text: 'Show Alert Dialog',
              onClick: () {
                showDialogTemplate(context, 'assets/lottie/alert.json', 'This is an alert!', blurBackground: true);
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              bgColor: Colors.blueAccent,
              fgColor: Colors.white,
              text: 'Show Info Dialog',
              onClick: () {
                showDialogTemplate(context, 'assets/lottie/info.json', 'Here is some information.', blurBackground: false);
              },
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.bgColor,
    required this.fgColor,
    required this.text,
    required this.onClick,
  });

  final Color bgColor;
  final Color fgColor;
  final String text;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          child: ElevatedButton(
            onPressed: onClick,
            style: ElevatedButton.styleFrom(
              backgroundColor: bgColor,
              foregroundColor: fgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 5,
            ),
            child: Text(text),
          ),
        ),
      ],
    );
  }
}
```

### Customization Options

The `CustomDialog` widget provides various customization options through its constructor parameters:

- `message`: The message to be displayed in the dialog.
- `btnText`: The text for the button.
- `maxLines`: The maximum number of lines for the message text.
- `textAlign`: The alignment of the message text.
- `animationWidth`: The width of the Lottie animation.
- `animationHeight`: The height of the Lottie animation.
- `bgColor`: The background color of the dialog.
- `textColor`: The color of the message text.
- `btnColor`: The background color of the button.
- `btnTextColor`: The color of the button text.
- `animationDuration`: The duration of the Lottie animation.
- `headerAnimation`: The path to the Lottie animation file.
- `onBtnPressed`: The callback function when the button is pressed.
- `blurBackground`: Whether to apply a blur effect to the background.
- `blurAmount`: The amount of blur to apply if blurBackground is true.
- `alternativeBgColor`: The background color if blurBackground is false.


## Example Usage
To show a custom dialog with a success message and Lottie animation:

```dart
showDialogTemplate(context, 'assets/lottie/success.json', 'Operation Successful!', blurBackground: true);
```

To show a custom dialog with an error message and no background blur:

```dart
showDialogTemplate(context, 'assets/lottie/error.json', 'An error occurred!', blurBackground: false);
```


## License
This project is licensed under the MIT License. See the <a>LICENSE</a> file for more details.

## Contributions
Contributions are welcome! If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request on GitHub.

## Author
<b><a href='https://www.github.com/turt5'>Kaium Al Limon</a></b>