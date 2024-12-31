import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed:  () async {
              final user = FirebaseAuth.instance.currentUser; 
               try {
               await  user?.sendEmailVerification();
               } catch (e) {
                 print(e);
               }
            },
             child: Text('send email verification',
            style: TextStyle(
              color: Colors.blue),)
             ),
      ),
    );
  }
}