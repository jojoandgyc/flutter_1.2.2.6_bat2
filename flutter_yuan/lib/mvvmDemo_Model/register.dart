import "package:flutter_yuan/golbalPake/golbal.dart";

Future registerModel(String json) async {
  return await Golbal.getInstance().dio.post("path", queryParameters: {
    "": "",
    "1": "",
    "2": "",
    "3": "",
    "4": "",
  });
}
