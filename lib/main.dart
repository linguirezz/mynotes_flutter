import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:mynotes/views/Login_view.dart';
import 'package:mynotes/views/Register_view.dart';
import 'package:mynotes/views/Verify_view.dart';
import 'package:mynotes/views/notesView.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/login/':(context)=> const Login(),
        '/register/':(context)=> const Register(),
        '/verify/':(context)=> const EmailVerify(),
        '/Home/':(context)=> const MyNotes()
      },
    ));
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:FutureBuilder(
        future:  Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 ), 
      builder: (context, snapshot) {
        switch(snapshot.connectionState){
          
          case ConnectionState.none:
            return const Text("no connection started");
            
          case ConnectionState.waiting:
            return const Text("loading");
            
          case ConnectionState.active:
            
            return const Text("connection active");
            
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser; 
            final isVerified = user?.emailVerified ?? false;
            if(!isVerified){
              return const EmailVerify();
            }
            else{
              print("user is verified");
              return const MyNotes();  
        } 
      }
  })
    );
  }
}
