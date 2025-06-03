import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll Bug Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const BugHomePage(),
    );
  }
}

class BugHomePage extends StatelessWidget {
  const BugHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(largeTitle: Text('Hello Scroll Bug!')),
          SliverList.builder(
            // TODO: Edit the item count such that the list
            // extends past the viewport when the navigation
            // bar is expanded, but fits in the viewport when
            // the navigation bar is collapsed
            itemCount: switch (defaultTargetPlatform) {
              // In my case an iPhone 16 Pro simulator needed 19 items to trigger the bug.
              // FIXME: On iOS the we observe a jumpy screen and all buttons can be pressed.
              TargetPlatform.iOS => 19,
              // In my case an Android Pixel 9 Pro (API 36) emulator needed 21 items to trigger the bug.
              // FIXME: On Android the screen is not jumpy, but the buttons are not pressable.
              TargetPlatform.android => 21,
              // In the case of web, simply make your browser window small enough to trigger the bug.
              // FIXME: On web the we observe the same behavior as on iOS, the screen is jumpy and all buttons can be pressed.
              _ => 21,
            },
            itemBuilder: (_, int index) => ListTile(
              title: Text('Item $index'),
              trailing: TextButton(
                onPressed: () {
                  debugPrint('Button $index has been pressed!');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      content: Text('Button $index pressed!'),
                    ),
                  );
                },
                child: Text('Buton $index'),
              ),
              // TODO: You might want to either enable or disable the density
              // to see the difference in behavior
              dense: true,
              // TODO: You might want to either enable or disable the visual
              // density to see the difference in behavior
              visualDensity: VisualDensity.compact,
            ),
          ),
        ],
      ),
    );
  }
}
