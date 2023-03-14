import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  get boxShadow => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(234, 53, 87, 53),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(height: 30),
              Text(
                "Contact Us",
                textAlign: TextAlign.center,
                style: GoogleFonts.berkshireSwash(
                  textStyle: Theme.of(context).textTheme.headline5,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "We are happy to hear from you about our Service & and how we can help",
                style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.titleSmall,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              Container(
                width: double.maxFinite,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none)),
                    hintText: 'Full Name',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.maxFinite,
                child: TextField(
                    decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none)),
                  hintText: 'Mobile Number',
                )),
              ),
              SizedBox(height: 20),
              Container(
                width: double.maxFinite,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none)),
                    hintText: 'E-mail ID',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.maxFinite,
                child: TextField(
                  minLines: 8,
                  maxLines: 8,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        )),
                    hintText: 'Your Message',
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 70, right: 50),
                  child: Container(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          shadows: <Shadow>[
                            Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(45, 0, 0, 0)),
                          ],
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    alignment: Alignment.center,
                    width: 200,
                    height: 55,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            offset: Offset(1, 3),
                            color: Color.fromARGB(255, 17, 17, 17)),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFFBC60C),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
