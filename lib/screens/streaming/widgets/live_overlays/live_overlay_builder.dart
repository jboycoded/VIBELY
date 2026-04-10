import 'package:flutter/material.dart';

Widget? buildLiveOverlay({
  required bool isConnected,
  required bool isLoading,
  required bool streamEnded,
  required Widget noInternet,
  required Widget loading,
  required Widget ended,
}) {
  if (!isConnected) return noInternet;
  if (isLoading) return loading;
  if (streamEnded) return ended;

  return null;
}
