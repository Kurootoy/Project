import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/Profile.dart';
import 'package:flutter_application_2/sceen/login.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final fromKey=GlobalKey<FormState>();
  Profile profile = Profile(email: ' ', password: ' ',);
  final Future<FirebaseApp> firebase=Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Register"),),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: fromKey,
            child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email",style: TextStyle(fontSize: 20)),
                  TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Entry Email"),
                      EmailValidator(errorText: "Wrong Email")
                    ]),
                    keyboardType: TextInputType.emailAddress,
                    onSaved:(String? email){
                      profile.email=email!;
                    },          
                  ),
                  SizedBox(
                    height: 15,
                    ),
                  Text("Password",style: TextStyle(fontSize: 20)),
                  TextFormField(
                  validator: RequiredValidator(errorText: "Entry Password"),

                    obscureText: true,
                    onSaved:(String? password){
                      profile.password=password!;
                    },          
                    
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text("Register",style: TextStyle(fontSize: 20)),
                    onPressed: (){
                      if(fromKey.currentState!.validate()){
                     fromKey.currentState!.save();
                     print("email=${profile.email} password=${profile.password}");
                     fromKey.currentState!.reset();
                      }
                      },
                    ),
                    )
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}