import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:staylit/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg.png",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        offset: Offset(1, 10),
                        color: Color.fromARGB(255, 17, 17, 17)),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55))),
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Email',
                          suffixIcon: Icon(Icons.email),
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Password',
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      label: 'Login',
                      onTap: () {},
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          onTap: () {},
                          text: 'Forgot Password ?',
                        ),
                        CustomText(
                          onTap: () {},
                          text: 'Sign Up Today',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: MediaQuery.of(context).viewInsets.bottom > 0.0 ? 30 : 0,
              bottom:
                  MediaQuery.of(context).viewInsets.bottom > 0.0 ? 180 : 100,
            ),
            child: Align(
              alignment: MediaQuery.of(context).viewInsets.bottom > 0.0
                  ? Alignment.topLeft
                  : Alignment.centerLeft,
              child: Text(
                "Login",
                textAlign: TextAlign.center,
                style: GoogleFonts.berkshireSwash(
                    textStyle: Theme.of(context).textTheme.headline2,
                    color: Color.fromARGB(255, 255, 255, 255),
                    shadows: <Shadow>[
                      Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 10,
                          color: Color.fromARGB(184, 10, 10, 10))
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final Function() onTap;
  final String text;
  const CustomText({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
