import 'package:flutter/material.dart';
import 'package:flutter_application_2/sceen/login.dart';
import 'package:flutter_application_2/sceen/register.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("Register/Login"),
      ),
      body:Padding(
        padding: const EdgeInsets.fromLTRB(20, 300,20 , 30),
        //padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
        child: Column(
          children: [
            SizedBox(
              width:double.infinity,
              child:ElevatedButton.icon(onPressed: (){
                Navigator.push(context,MaterialPageRoute(
                  builder: (context){
                    return LoginScreen();
                  })
                  );
              }, 
              icon: Icon(Icons.login),
              label: Text("เข้าสู่ระบบ",style:TextStyle(fontSize:20))
              ),
            ),
             SizedBox(
               width: double.infinity,
              child:ElevatedButton.icon(onPressed: (){
                Navigator.push(context,MaterialPageRoute(
                  builder: (context){
                    return RegisterScreen();
                  })
                );
              }, 
              icon: Icon(Icons.add),
              label: Text("ลงทะเบียน",style:TextStyle(fontSize:20))
              ),
            )
          ],
        ),
      )
    );
  }
}