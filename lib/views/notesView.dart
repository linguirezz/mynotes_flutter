import 'package:flutter/material.dart';
import 'dart:developer' as devTools show log;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mynotes/constant/routes.dart';
enum MenuActions {
  logOut
}
class MyNotes extends StatefulWidget {
  const MyNotes({super.key});

@override
  State<MyNotes> createState() => _MyNotesState();
}

class _MyNotesState extends State<MyNotes> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Center(child: Text("Mynotes")),
        actions: [
          PopupMenuButton<MenuActions>(
            onSelected: (value) async{
            switch (value) {
              case MenuActions.logOut:
                final popUpResult = await showPopUp(context);
                if(popUpResult){
                  print("log out");
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(context, loginRoute, (Route<dynamic> route)=>false);
                }
                
                
            }
            } ,
            itemBuilder: (context)=>[PopupMenuItem<MenuActions>(
            value: MenuActions.logOut,
            child: Text("log out")
          )])
        ],
      ),
      body: Column(
        
        children: [
          Text("main ui"),
          TextButton(onPressed: (){
            devTools.log("you pressed the log out button");
          }, child: Text("Log out"))
        ],
      ),
    );
  }
}
Future<bool> showPopUp(context){
 return showDialog<bool>(context: context,
   builder:(context){
    return AlertDialog(
      title: Text("Log Out"),
      content: Text("are you sure to log out ?"),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.pop(context,true);
          },
          child: Text("OK")
        ),
         TextButton(
          onPressed: (){
            Navigator.pop(context,false);
          },
          child: Text("Cancel")
        )
      ],
    );
   }).then((value) => value ?? false);
}