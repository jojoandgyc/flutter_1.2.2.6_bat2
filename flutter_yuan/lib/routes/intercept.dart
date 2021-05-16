import 'package:flutter/material.dart';

class intercept extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Route包"),
      ),
      body: RaisedButton(
        onPressed: () {
          Navigator.of(context).pop(
              {
                "name": "huangyunzhan",
              }
          );
        },
        child: Text("Route按钮"),
      )
      ,


    );
  }
}
