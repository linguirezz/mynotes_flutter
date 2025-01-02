import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mynotes/constant/routes.dart';
import 'package:mynotes/utilities/Error_Handler.dart';


class Register extends StatefulWidget {
 
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                "Register",
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
              margin:EdgeInsets.only(top:20.0),
              width: double.infinity,
              color: Colors.black,
              child: Center(
                child: TextButton(
                  
                  onPressed: () async{
                    final email = _email.text;
                    final password = _password.text;
                    print(email);
                    print(password);
                     
                  try { UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword( email: email, password: password, ); 
                  print("User registered: ${userCredential.user?.email}");
                  final isVerified = userCredential.user?.emailVerified ?? false;
                   print('is verified ? $isVerified');
                   if(!isVerified){
                      final user = FirebaseAuth.instance.currentUser;
                      print("sending user emial verification");
                      await user?.sendEmailVerification();
                      Navigator.pushNamedAndRemoveUntil(context, verifyRoute, (Route<dynamic> route)=>true);
                   }
                   else{
                      Navigator.pushNamedAndRemoveUntil(context, notesRoute, (Route<dynamic> route)=>false);
                   }
                   }
                   on FirebaseAuthException catch (e) {
                    ErrorHandler(context,e.code);
                     print("Error: ${e.code}"); 

                     }
                   
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
            
            TextButton(
              onPressed : (){
                print("you clicked the link to register view");
               Navigator.pushNamedAndRemoveUntil( context, loginRoute, (Route<dynamic> route) => false, );;
              },
              child:Text("if you dont have any account click here")
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
                onPressed: (){print("login via google is pressed");},
              
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

