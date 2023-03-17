import 'package:flutter/material.dart';

import '../widgets/custom_bottom_sheet.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({super.key});

  @override
  State<VehicleScreen> createState() => _VehicleScreen();
}

class _VehicleScreen extends State<VehicleScreen> {
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
                "Vehicle Wash",
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
                          image: AssetImage("assets/images/car.jpg"),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        "Car Wash           ",
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
                              image: AssetImage("assets/images/bike.jpg"),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Bike Wash             ",
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
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/scooter.jpg"),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Scooter Wash       ",
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
              ],
            ),
          ],
        ),
      ])),
    );
  }
}
