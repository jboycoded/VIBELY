import 'package:flutter/material.dart';

mixin LiveLifecycleMixin<T extends StatefulWidget>
    on State<T>, WidgetsBindingObserver {

  void Function(String message)? onSnack;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      onSnack?.call("⏸ App Paused");
    }

    if (state == AppLifecycleState.resumed) {
      onSnack?.call("▶ App Resumed");
    }
  }
}
