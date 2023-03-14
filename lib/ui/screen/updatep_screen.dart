import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdatepScreen extends StatelessWidget {
  const UpdatepScreen({super.key});

  get boxShadow => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(234, 53, 87, 53),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 7, right: 7, bottom: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: Image.asset(
                "assets/images/logo.png",
                width: 120,
                height: 120,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: 30),
            CustomProfileBox(
              text: "Update Profile",
              onTap: () {},
            ),
            SizedBox(height: 20),
            CustomProfileBox(
              text: "Log Out",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class CustomProfileBox extends StatelessWidget {
  final String text;
  final Function() onTap;
  const CustomProfileBox({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        shadowColor: Color.fromARGB(255, 10, 10, 10),
        elevation: 10,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.headline4,
                  color: Color.fromARGB(255, 14, 14, 14),
                  fontSize: 20,
                  shadows: <Shadow>[
                    Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 10,
                        color: Color.fromARGB(184, 10, 10, 10))
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}
