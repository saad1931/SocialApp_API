// ignore_for_file: use_build_context_synchronously, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialapp/provider/user_provider.dart';
import 'package:socialapp/screens/home_screen.dart';
import 'package:socialapp/utils/colors.dart';

import '../services/user_services.dart';
import '../widgets/textfieldwidget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  Future<bool> _isLoginValid(UserProvider userProvider) async {
    final email = emailController.text.trim();
    final password = passController.text.trim();

    List<dynamic> users = await getUsers();
    print(users);

    for (var user in users) {
      if (user.email == email && user.username == password) {
        userProvider.setLoggedInUser(user);
        return true;
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Invalid Username or Password")),
    );
    return false;
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Consumer<UserProvider>(
      builder: (context, userProvider, _) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.2),
                  Image.asset(
                    "assets/images/logo2.png",
                    height: screenHeight * 0.3,
                    width: screenWidth * 0.8,
                  ),
                  TextFieldWidget(
                    labelTextt: "Email",
                    textEditingController: emailController,
                    hintTextt: "Enter Your Email",
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email cannot be empty!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextFieldWidget(
                    labelTextt: "Password",
                    textEditingController: passController,
                    hintTextt: "Enter Your Password",
                    textInputType: TextInputType.text,
                    isPass: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: SizedBox(
                      height: screenHeight * 0.06,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primarycolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            bool isValid =
                                await _isLoginValid(userProvider);
                            if (isValid) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.2),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}