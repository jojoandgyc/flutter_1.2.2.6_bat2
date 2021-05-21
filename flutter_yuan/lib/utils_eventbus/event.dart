import 'package:flutter_yuan/eventbus/event_bus.dart';

void postMessage(String eventName, dynamic msg) {
  if (msg.runtimeType == String) {
    bus.emit(
      "fail",
      {
        "view": "login",
        "message": msg,
      },
    );
  }
}