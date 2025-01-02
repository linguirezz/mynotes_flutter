import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constant/routes.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
       title: Text("verify"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(child: 
            Container(
              margin:EdgeInsets.only( bottom : 40.0),
              child: Text(
                "we've send you an email verification \n please check your email and click the link for verify your account"),
            ),
              ),
              Center(
                child: Text("if you dont receive any email click the below button"),
              ),
            Center(
              
              child: TextButton(
                  onPressed:() {
            
                    print("verification button pressed");
                    
                  },
                   child: Text('send email verification mwa',
                  style: TextStyle(
                    color: Colors.blue),)
                   ),
                   
            ),
            Center(
              child:TextButton(
                onPressed: () async{
                  await FirebaseAuth.instance.signOut();
    
                  Navigator.pushNamedAndRemoveUntil(context,loginRoute, ((Route<dynamic> route ) => false));
                },
                child:Text("if you've clicked the verification link . click here"),
                
                ),
            ),
          ],
        ),
      ),
    );
  }
}