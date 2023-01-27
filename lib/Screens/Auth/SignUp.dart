import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rail_food/Screens/Auth/LoginScreen.dart';
import '../AppAfterLogin.dart';
import 'package:email_validator/email_validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;

  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black87,
        body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: size.height * 6/100,),

            //main image
            Padding(
              padding: const EdgeInsets.only(left: 60.0, right: 60.0),
              child: Center(child: Image.asset('images/signup.png',),),
            ),

            SizedBox(height: size.height * 3/100,),

            //signup text
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text('SIGN UP',
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

            SizedBox(height: size.height * 2.5/100,),

            //all fields
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [

                  //first name
                  TextFormField(
                  autofocus: false,
                  controller: firstNameEditingController,
                  keyboardType: TextInputType.name,
                    style: const TextStyle(
                      fontFamily: 'font',
                      color: Colors.white,
                    ),

                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                    value == null
                        ? 'Enter a valid name'
                        : null,

                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle, color: Colors.white,),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    labelText: "First Name",
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

                  SizedBox(height: size.height * 2/100,),

                  //second name
                  TextFormField(
                  autofocus: false,
                  controller: secondNameEditingController,
                  keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      fontFamily: 'font',
                      color: Colors.white,
                    ),

                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                    value == null
                        ? 'Enter a valid last name'
                        : null,

                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle, color: Colors.white,),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    labelText: "Second Name",
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

                  SizedBox(height: size.height * 2/100,),

                  //email
                  TextFormField(
                    autofocus: false,
                    controller: emailEditingController,
                    // keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      fontFamily: 'font',
                      color: Colors.white,
                    ),

                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                    email !=null && !EmailValidator.validate(email)
                        ? 'Enter a valid email'
                        : null,

                    textInputAction: TextInputAction.next,
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

                  SizedBox(height: size.height * 2/100,),

                  //password field
                  TextFormField(
                    autofocus: false,
                    controller: passwordEditingController,
                    obscureText: true,
                    style: const TextStyle(
                      fontFamily: 'font',
                      color: Colors.white,
                    ),

                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                    value !=null && value.length <8
                        ? 'Enter min 8 characters'
                        : null,

                    textInputAction: TextInputAction.next,
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

                  SizedBox(height: size.height * 2/100,),

                  //confirm password
                  TextFormField(
                    autofocus: false,
                    controller: confirmPasswordEditingController,
                    obscureText: true,
                    style: const TextStyle(
                      fontFamily: 'font',
                      color: Colors.white,
                    ),

                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                    value !=null && passwordEditingController.text != confirmPasswordEditingController.text
                        ? 'Password do not match'
                        : null,

                    textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key, color: Colors.white,),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        labelText: "Confirm Password",
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
                ],
              ),
            ),


            //signup button
            Padding(
              padding: const EdgeInsets.fromLTRB(30,30,30,0),
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
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailEditingController.text,
                        password: passwordEditingController.text).then((value) =>
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AppAfterLogin())),
                        ).onError((error, stackTrace) {

                    });
                    },

                  child: const Text(
                    "Sign Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'font',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 2.5/100,),

            //back to login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?  ",
                  style: TextStyle(color: Colors.white,fontFamily: 'font'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen(),),);
                  },
                  child: const Text(
                    "Log In",
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
        )


      ),
    );
  }
}

