import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task2/screens/homepage.dart';
import 'package:task2/services/signup_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onThemeToggle;

  const LoginPage({
    super.key,
    required this.onThemeToggle,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "", password = "";

  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  bool _obscuretext = true;

  userLogin() async {
    if (password != "" && mailcontroller.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Login Successfully',
              style: TextStyle(fontSize: 18),
            ),
            duration: Duration(seconds: 2),
          ),
        );

        await Future.delayed(const Duration(seconds: 2));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(
              onThemeToggle: widget.onThemeToggle,
            ),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'No User Found With That Email',
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'Wrong Password Provided',
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/loginimage.jpg',
                height: 400,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [

                    // EMAIL FIELD
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      decoration: BoxDecoration(
                        color: colors.surfaceVariant,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: colors.primary,
                          width: 2,
                        ),
                      ),
                      child: TextFormField(
                        controller: mailcontroller,

                        style: TextStyle(
                          color: colors.onSurface,
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
                          }
                          return null;
                        },

                        decoration: InputDecoration(
                          hintText: "Email",

                          hintStyle: TextStyle(
                            color: colors.onSurface.withOpacity(0.5),
                            fontSize: 18,
                          ),

                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // PASSWORD FIELD
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      decoration: BoxDecoration(
                        color: colors.surfaceVariant,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: colors.primary,
                          width: 2,
                        ),
                      ),
                      child: TextFormField(
                        controller: passwordcontroller,

                        obscureText: _obscuretext,

                        style: TextStyle(
                          color: colors.onSurface,
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },

                        decoration: InputDecoration(
                          hintText: "Password",

                          hintStyle: TextStyle(
                            color: colors.onSurface.withOpacity(0.5),
                            fontSize: 18,
                          ),

                          border: InputBorder.none,

                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscuretext
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: colors.onSurface.withOpacity(0.7),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscuretext = !_obscuretext;
                              });
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // LOGIN BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = mailcontroller.text;
                              password = passwordcontroller.text;
                            });

                            userLogin();
                          }
                        },

                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 18),
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(
                              onThemeToggle:
                                  widget.onThemeToggle,
                            ),
                          ),
                        );
                      },

                      child: Text(
                        'Do not have an account? Create Account',
                        style: TextStyle(
                          fontSize: 16,
                          color: colors.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}