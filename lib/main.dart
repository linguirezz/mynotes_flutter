import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    ));
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("homepage"),
      ),
      body:FutureBuilder(
        future:  Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 ), 
      builder: (context, snapshot) {
        // switch(snapshot.connectionState){
        
        // } 
      null;
      },
      )
    );
  }
}