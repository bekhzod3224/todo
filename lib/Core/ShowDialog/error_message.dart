  import 'package:flutter/material.dart';

  ErrorPop(BuildContext context, String errorMessage) {
    showDialog(context: context, builder: (builder) {
      return AlertDialog(
        content: Text(errorMessage),
        actions: <Widget>[

          InkWell(child: Text('OK'),onTap: (){
            Navigator.pop(context);
          },)
        ],
      );
    });
  }