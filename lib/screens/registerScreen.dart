import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:se7etyy/screens/loginScreen.dart';

class Registerscreen extends StatefulWidget {
  Registerscreen ({required this.type});
  String type;

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 300,
                    width: 300,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    widget.type,
                    style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 18,
                      color: Colors.teal,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                  TextFormField(
                  keyboardType: TextInputType.emailAddress,
                   controller: nameController,

                  decoration: InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'example.com',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Forgot Password
               
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: ()async {
                    try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text,
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    Fluttertoast.showToast(msg: 'The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    Fluttertoast.showToast(msg: 'The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text(
                    'تسجيل حساب',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: () {
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen(type: "",),));
        
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'لديك حساب؟ ',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'سجل دخول',
                            style: TextStyle(color: Colors.teal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
