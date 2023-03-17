import 'package:flutter/material.dart';

import '../widgets/custom_bottom_sheet.dart';

class MaintainanceScreen extends StatefulWidget {
  const MaintainanceScreen({super.key});

  @override
  State<MaintainanceScreen> createState() => _MaintainanceScreen();
}

class _MaintainanceScreen extends State<MaintainanceScreen> {
  String? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Stack(children: [
        ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30, top: 30),
              child: const Text(
                "Maintainaance Service",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, top: 30),
              child: const Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 255, 255, 255),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/fan.jpg"),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Text(
                        "Fan Maintainance",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45, top: 60),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 36, 103, 40)),
                        child: const Text(
                          "Book",
                          style: TextStyle(fontSize: 10),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor:
                                const Color.fromARGB(255, 36, 103, 40),
                            shape: const RoundedRectangleBorder(
                              // <-- SEE HERE
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return const CustomBottomSheet();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 255, 255, 255),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/light.jpg"),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(9.0),
                          child: Text(
                            "Light Maintainance",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 60),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 36, 103, 40)),
                            child: const Text(
                              "Book",
                              style: TextStyle(fontSize: 10),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor:
                                    const Color.fromARGB(255, 36, 103, 40),
                                shape: const RoundedRectangleBorder(
                                  // <-- SEE HERE
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  return const CustomBottomSheet();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 255, 255, 255),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/switch.jpg"),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            "Switch Maintainance",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 60),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 36, 103, 40)),
                            child: const Text(
                              "Book",
                              style: TextStyle(fontSize: 10),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor:
                                    const Color.fromARGB(255, 36, 103, 40),
                                shape: const RoundedRectangleBorder(
                                  // <-- SEE HERE
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  return const CustomBottomSheet();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 255, 255, 255),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/other.jpg"),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Other Maintainance",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 60),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 36, 103, 40)),
                            child: const Text(
                              "Book",
                              style: TextStyle(fontSize: 10),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor:
                                    const Color.fromARGB(255, 36, 103, 40),
                                shape: const RoundedRectangleBorder(
                                  // <-- SEE HERE
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  return const CustomBottomSheet();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ])),
    );
  }
}
