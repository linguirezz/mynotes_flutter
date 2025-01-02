import 'package:flutter/material.dart';

Future<bool> ErrorHandler(context,error){
 return showDialog<bool>(context: context,
   builder:(context){
    return AlertDialog(
      title: Text("Alert"),
      content: Text(error),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.pop(context,true);
          },
          child: Text("OK")
        )
      ],
    );
   }).then((value) => value ?? false);
}