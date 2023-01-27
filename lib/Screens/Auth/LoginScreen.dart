import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rail_food/Screens/Auth/SignUp.dart';
import 'package:rail_food/Screens/AppAfterLogin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailcontroller = new TextEditingController();
  final passwordcontroller = new TextEditingController();


  final _auth = FirebaseAuth.instance;


  @override
  void dispose(){
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          child: Column(
              children: [

                SizedBox(height: size.height * 5/100,),

                Center(child: Image.asset('images/login.png',),),

                SizedBox(height: size.height * 6/100,),

                //login text
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('LOGIN',
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'font',
                        color: Colors.white,
                        fontSize: 35,
                      ),),
                    ),
                  ],
                ),

                SizedBox(height: size.height * 8/100,),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Column(
                    children: [

                       //email field
                        TextFormField(
                          controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(
                            fontFamily: 'font',
                            color: Colors.white,
                          ),

                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                          email !=null && !EmailValidator.validate(email)
                              ? 'Enter a valid email'
                              : null,


                          decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail, color: Colors.white,),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          labelText: "Email",
                          labelStyle: const TextStyle(
                            fontFamily: 'font',
                            color: Colors.white,
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.amber,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: size.height * 3/100,),

                        //password field
                        TextFormField(
                         controller: passwordcontroller,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          style: const TextStyle(
                            fontFamily: 'font',
                            color: Colors.white,
                          ),

                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                          value !=null && value.length <8
                              ? 'Enter min 8 characters'
                              : null,

                          decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key, color: Colors.white,),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            labelText: "Password",
                            labelStyle: const TextStyle(
                              fontFamily: 'font',
                              color: Colors.white,
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.amber,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white70,
                              ),
                           ),
                         ),
                       ),

                      SizedBox(height: size.height * 5/100,),

                  //Login button
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        // color: Colors.lightBlue,
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfffd746c),
                            Color(0xffff9068),
                            Color(0xfffd746c),
                          ],
                        ),
                      ),

                      child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            showDialog(context: context,
                                builder: (context) => Center(child: CircularProgressIndicator(),));

                            FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: emailcontroller.text, password: passwordcontroller.text).then((value) {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AppAfterLogin()));
                            }).onError((error, stackTrace) {

                            });
                          },

                          child: const Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'font',
                                fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 1/100,),

                //signup button
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?  ",
                        style: TextStyle(color: Colors.white,fontFamily: 'font'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SignUp(),),);
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'font',
                              fontSize: 15),
                        ),
                      ),
                    ],
                ),
              ],
            ),
        ),
    );
  }
}
