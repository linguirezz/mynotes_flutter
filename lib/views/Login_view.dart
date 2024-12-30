import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Login extends StatefulWidget {
 
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
   late final TextEditingController _email;
   late final TextEditingController _password;
   @override
  void initState() {
    _email = TextEditingController();
    _password =  TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Padding(
        padding: EdgeInsets.only(top: 120.0,bottom: 50.0,right: 20.0,left:20.0 ),
        child: Column(
                
                  
          children: [
            Container(
              width: 80 ,
              height: 80,
              color: Colors.black,
              margin:  EdgeInsets.only(bottom: 30.0),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Text(
                "Login",
              style: TextStyle(
                 color: Colors.black,
                 fontSize: 25.0,
                 fontWeight: FontWeight.bold
              ),
              ),
            ),
               Container(
                margin:EdgeInsets.only(bottom: 20.0),
                 child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: "masukan email" ,
                    border: OutlineInputBorder()
                  ),
                  keyboardType: TextInputType.emailAddress
                               ),
               ),
            
             TextField(
              controller: _password,
              decoration: InputDecoration(
                labelText: "masukan password" ,
                border: OutlineInputBorder()
                
              ),
              obscureText: true,
            ),
            Container(
              margin:EdgeInsets.only(top:20.0,bottom:20.0),
              width: double.infinity,
              color: Colors.black,
              child: Center(
                child: TextButton(
                  
                  onPressed: () async{
                    final email = _email.text;
                    final password = _password.text;
                    print(email);
                    print(password);
                  try { UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword( email: email, password: password, );
                  print(userCredential);
                   print("User sign in: ${userCredential.user?.email}"); } on FirebaseAuthException 
                  catch (e) { print("Error: ${e.message}"); }
                 
                  },
                 style:ButtonStyle(
                 ) ,
                 child: Padding(
                   padding: const EdgeInsets.all(5.0),
                   child: Text("continue",
                   style: TextStyle(
                    color: Colors.white,
                    fontWeight : FontWeight.w700,
                    fontSize: 20
                   ),),
                 )
                 ),
                
              ),
            ),
            Center(
              child:Text("or",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black38
              ),
              )
            ),
            Container(
              width: double.infinity,
              margin:EdgeInsets.only(top: 20.0,bottom: 20.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black38,
                  width: 1.0
                )
              ),
              child: TextButton(
                onPressed: (){print("login via google is pressed");},
              
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Continue With Google",
                   style: TextStyle(
                    color: Colors.black,
                    fontWeight : FontWeight.bold,
                    fontSize: 20
                    
                   ),
                   ),
                ),
                  
                   ),
            ),
            Container(
              width: double.infinity,
              
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black38,
                  width: 1.0
                )
              ),
              child: TextButton(
                onPressed: (){print("login via apple is pressed");},
              
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Continue With apple",
                   style: TextStyle(
                    color: Colors.black,
                    fontWeight : FontWeight.bold,
                    fontSize: 20
                    
                   ),
                   ),
                ),
                  
                   ),
            ),
             
             
          ],
        ),
      )
    );
  }
}

