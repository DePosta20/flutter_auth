import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/auth/Login/login_screen.dart';
import 'package:flutter_auth/screens/auth/Signup/components/background.dart';
import 'package:flutter_auth/screens/auth/Signup/components/or_divider.dart';
import 'package:flutter_auth/screens/auth/Signup/components/social_icon.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              controller: emailController,
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: passwordController,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                showDialog(
                    context: context,
                    builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the user has entered by using the
                    // TextEditingController.
                    content: Text(passwordController.text),
                  );
                });
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
